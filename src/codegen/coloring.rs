// Copyright 2026 The ik8b Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//! Graph-coloring register allocator core: Chaitin–Briggs optimistic coloring with
//! Briggs-style conservative move coalescing and spill-cost-driven spill selection.
//!
//! This is the target-independent engine. The caller supplies an interference graph
//! whose nodes are virtual registers, each tagged with a width (1 = single register,
//! 2 = an aligned register pair such as AVR's 16-bit values) and a register class (the
//! physical registers it may occupy). Pre-colored nodes (ABI argument/return registers,
//! the `X`/`Y`/`Z` pointer pairs) pin a node to a physical register up front.
//!
//! A 2-wide node occupies physical registers `c` and `c+1`, and `c` must be even-aligned
//! within its class — so the allocator reasons about *byte-level* register occupancy
//! when testing feasibility against neighbors of either width.

use std::collections::{HashMap, HashSet};

/// A node in the interference graph (one virtual register / live range).
#[derive(Clone, Debug)]
pub struct Node {
    /// 1 for an 8-bit value, 2 for a 16-bit register pair.
    pub width: u8,
    /// Physical registers this node may be colored with (low byte for pairs).
    /// Empty means "any register in `all_regs`".
    pub class: Vec<u8>,
    /// Spill cost estimate (uses+defs weighted by loop depth). Higher = avoid spilling.
    pub spill_cost: u32,
    /// Pre-assigned physical register (ABI / fixed). `None` for ordinary nodes.
    pub precolored: Option<u8>,
}

impl Node {
    pub fn new(width: u8) -> Self {
        Node {
            width,
            class: Vec::new(),
            spill_cost: 1,
            precolored: None,
        }
    }
}

/// A move (copy) between two nodes; coalescing tries to give both the same color so the
/// copy can be deleted.
#[derive(Clone, Copy, Debug)]
pub struct Move {
    pub dst: usize,
    pub src: usize,
}

/// Result of allocation.
#[derive(Clone, Debug)]
pub struct Allocation {
    /// node -> assigned physical register (low byte for pairs).
    pub colors: HashMap<usize, u8>,
    /// nodes that could not be colored and must be spilled to memory.
    pub spilled: Vec<usize>,
    /// pairs of nodes that were coalesced (same color); the copy can be removed.
    #[allow(dead_code)]
    pub coalesced: Vec<(usize, usize)>,
}

/// The interference graph and allocation parameters.
pub struct ColoringInput {
    pub nodes: Vec<Node>,
    pub adj: Vec<HashSet<usize>>,
    pub moves: Vec<Move>,
    /// All physical registers available to the allocator, in preference order.
    pub all_regs: Vec<u8>,
}

impl ColoringInput {
    pub fn new(num_nodes: usize, all_regs: Vec<u8>) -> Self {
        ColoringInput {
            nodes: (0..num_nodes).map(|_| Node::new(1)).collect(),
            adj: vec![HashSet::new(); num_nodes],
            moves: Vec::new(),
            all_regs,
        }
    }

    pub fn add_edge(&mut self, a: usize, b: usize) {
        if a != b {
            self.adj[a].insert(b);
            self.adj[b].insert(a);
        }
    }

    pub fn add_move(&mut self, dst: usize, src: usize) {
        if dst != src {
            self.moves.push(Move { dst, src });
        }
    }

    fn class_of(&self, n: usize) -> Vec<u8> {
        let c = &self.nodes[n].class;
        if c.is_empty() {
            self.all_regs.clone()
        } else {
            c.clone()
        }
    }
}

/// Runs the allocator. The `colors` map gives every non-spilled node a physical register
/// such that interfering nodes never share a byte, pairs are aligned, and pre-colored
/// nodes keep their fixed registers.
pub fn color(input: &ColoringInput) -> Allocation {
    Allocator::new(input).run()
}

struct Allocator<'a> {
    input: &'a ColoringInput,
    /// Working adjacency (union-find applied as nodes coalesce).
    adj: Vec<HashSet<usize>>,
    /// Union-find: alias[n] = representative if coalesced into another node.
    alias: Vec<usize>,
    coalesced_pairs: Vec<(usize, usize)>,
    colors: HashMap<usize, u8>,
    spilled: Vec<usize>,
}

impl<'a> Allocator<'a> {
    fn new(input: &'a ColoringInput) -> Self {
        Allocator {
            input,
            adj: input.adj.clone(),
            alias: (0..input.nodes.len()).collect(),
            coalesced_pairs: Vec::new(),
            colors: HashMap::new(),
            spilled: Vec::new(),
        }
    }

    fn find(&self, mut n: usize) -> usize {
        while self.alias[n] != n {
            n = self.alias[n];
        }
        n
    }

    fn run(mut self) -> Allocation {
        self.coalesce_moves();

        // Build the simplify worklist over representatives (non-coalesced nodes).
        let reps: Vec<usize> = (0..self.input.nodes.len())
            .filter(|&n| self.find(n) == n)
            .collect();

        // Pre-colored nodes are removed from selection and fixed directly.
        let mut select_stack: Vec<usize> = Vec::new();
        let mut removed: HashSet<usize> = HashSet::new();
        for &n in &reps {
            if let Some(reg) = self.input.nodes[n].precolored {
                self.colors.insert(n, reg);
                removed.insert(n);
            }
        }

        // Simplify / potential-spill loop (Chaitin–Briggs).
        let mut pending: Vec<usize> = reps
            .iter()
            .copied()
            .filter(|n| !removed.contains(n))
            .collect();

        while !pending.is_empty() {
            // Simplify: remove a node whose current degree is trivially colorable.
            if let Some(pos) = pending.iter().position(|&n| {
                self.current_degree(n, &removed) < self.color_capacity(n)
                    && self.input.nodes[n].precolored.is_none()
            }) {
                let n = pending.remove(pos);
                select_stack.push(n);
                removed.insert(n);
                continue;
            }
            // Potential spill: remove the lowest-priority node (cheapest to spill,
            // breaking ties by highest degree) and keep going optimistically.
            let pos = self.pick_spill_candidate(&pending, &removed);
            let n = pending.remove(pos);
            select_stack.push(n);
            removed.insert(n);
        }

        // Select: pop nodes and assign the lowest feasible color.
        while let Some(n) = select_stack.pop() {
            removed.remove(&n);
            let used = self.neighbor_bytes(n, &removed);
            match self.lowest_color(n, &used) {
                Some(c) => {
                    self.colors.insert(n, c);
                }
                None => {
                    self.spilled.push(n);
                }
            }
        }

        // Propagate representative colors to coalesced members.
        let mut colors = HashMap::new();
        let mut spilled_set: HashSet<usize> = self.spilled.iter().copied().collect();
        for n in 0..self.input.nodes.len() {
            let r = self.find(n);
            if let Some(&c) = self.colors.get(&r) {
                colors.insert(n, c);
            } else if spilled_set.contains(&r) {
                spilled_set.insert(n);
            }
        }

        Allocation {
            colors,
            spilled: spilled_set.into_iter().collect(),
            coalesced: self.coalesced_pairs.clone(),
        }
    }

    /// Number of not-yet-removed neighbors of `n` (degree in the working graph).
    fn current_degree(&self, n: usize, removed: &HashSet<usize>) -> usize {
        self.adj[n]
            .iter()
            .map(|&m| self.find(m))
            .filter(|m| *m != n && !removed.contains(m))
            .collect::<HashSet<_>>()
            .len()
    }

    fn pick_spill_candidate(&self, pending: &[usize], removed: &HashSet<usize>) -> usize {
        let mut best = 0;
        let mut best_metric = f64::INFINITY;
        for (i, &n) in pending.iter().enumerate() {
            if self.input.nodes[n].precolored.is_some() {
                continue;
            }
            let deg = self.current_degree(n, removed).max(1) as f64;
            // Chaitin's heuristic: spill the node minimizing cost/degree.
            let metric = self.input.nodes[n].spill_cost as f64 / deg;
            if metric < best_metric {
                best_metric = metric;
                best = i;
            }
        }
        best
    }

    fn color_capacity(&self, n: usize) -> usize {
        let width = self.input.nodes[n].width;
        let class = self.input.class_of(n);
        if width == 2 {
            class
                .iter()
                .filter(|&&reg| reg % 2 == 0 && class.contains(&(reg + 1)))
                .count()
                .max(1)
        } else {
            class.len().max(1)
        }
    }

    /// Physical register bytes occupied by colored neighbors of `n`.
    fn neighbor_bytes(&self, n: usize, removed: &HashSet<usize>) -> HashSet<u8> {
        let mut used = HashSet::new();
        let mut seen = HashSet::new();
        for &m in &self.adj[n] {
            let r = self.find(m);
            if r == n || !seen.insert(r) {
                continue;
            }
            // A colored neighbor (or precolored, which is always colored) blocks bytes.
            if let Some(&c) = self.colors.get(&r) {
                used.insert(c);
                if self.input.nodes[r].width == 2 {
                    used.insert(c + 1);
                }
            } else {
                let _ = removed;
            }
        }
        used
    }

    /// Lowest physical register usable for `n` given occupied `used` bytes.
    fn lowest_color(&self, n: usize, used: &HashSet<u8>) -> Option<u8> {
        let width = self.input.nodes[n].width;
        let class = self.input.class_of(n);
        for &reg in &class {
            if width == 2 {
                // Aligned pair: low register must be even and within the class, and
                // both bytes free.
                if reg % 2 != 0 {
                    continue;
                }
                if !class.contains(&(reg + 1)) {
                    continue;
                }
                if !used.contains(&reg) && !used.contains(&(reg + 1)) {
                    return Some(reg);
                }
            } else if !used.contains(&reg) {
                return Some(reg);
            }
        }
        None
    }

    /// Briggs conservative coalescing: coalesce a move's endpoints when the merged node
    /// has fewer than `k` neighbors of significant degree, which guarantees the merge
    /// never makes a colorable graph uncolorable.
    fn coalesce_moves(&mut self) {
        let mut changed = true;
        while changed {
            changed = false;
            let moves = self.input.moves.clone();
            for mv in moves {
                let a = self.find(mv.dst);
                let b = self.find(mv.src);
                if a == b {
                    continue;
                }
                // Cannot coalesce interfering nodes.
                if self.adj[a].iter().any(|&x| self.find(x) == b) {
                    continue;
                }
                // Widths must match (can't merge an 8-bit and 16-bit live range).
                if self.input.nodes[a].width != self.input.nodes[b].width {
                    continue;
                }
                // Don't coalesce two distinct pre-colored nodes.
                let pa = self.input.nodes[a].precolored;
                let pb = self.input.nodes[b].precolored;
                if pa.is_some() && pb.is_some() && pa != pb {
                    continue;
                }
                // Register-class constraints must survive coalescing. If two constrained
                // nodes disagree, merging them would silently drop one constraint.
                let ca = &self.input.nodes[a].class;
                let cb = &self.input.nodes[b].class;
                if !ca.is_empty() && !cb.is_empty() && ca != cb {
                    continue;
                }
                let k = self.color_capacity(a).min(self.color_capacity(b));
                // Briggs test: count merged neighbors of significant (>= k) degree.
                let mut merged: HashSet<usize> = HashSet::new();
                for &x in self.adj[a].iter().chain(self.adj[b].iter()) {
                    merged.insert(self.find(x));
                }
                merged.remove(&a);
                merged.remove(&b);
                let high: usize = merged
                    .iter()
                    .filter(|&&m| self.degree_estimate(m) >= k)
                    .count();
                if high < k {
                    self.union(a, b);
                    self.coalesced_pairs.push((mv.dst, mv.src));
                    changed = true;
                }
            }
        }
    }

    fn degree_estimate(&self, n: usize) -> usize {
        self.adj[n]
            .iter()
            .map(|&m| self.find(m))
            .collect::<HashSet<_>>()
            .len()
    }

    fn union(&mut self, a: usize, b: usize) {
        // Keep the pre-colored representative if any; otherwise keep a constrained
        // register-class representative so the merged live range cannot escape it.
        let (keep, gone) = if self.input.nodes[b].precolored.is_some() {
            (b, a)
        } else if self.input.nodes[a].precolored.is_some() {
            (a, b)
        } else if self.input.nodes[a].class.is_empty() && !self.input.nodes[b].class.is_empty() {
            (b, a)
        } else {
            (a, b)
        };
        self.alias[gone] = keep;
        let gone_adj = self.adj[gone].clone();
        for x in gone_adj {
            self.adj[keep].insert(x);
            self.adj[x].insert(keep);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn colors_simple_triangle() {
        // 3 mutually-interfering 8-bit nodes need 3 distinct registers.
        let mut g = ColoringInput::new(3, vec![16, 17, 18]);
        g.add_edge(0, 1);
        g.add_edge(1, 2);
        g.add_edge(0, 2);
        let a = color(&g);
        assert!(a.spilled.is_empty());
        let c: HashSet<u8> = a.colors.values().copied().collect();
        assert_eq!(c.len(), 3, "all three must differ: {:?}", a.colors);
    }

    #[test]
    fn spills_when_insufficient_registers() {
        // 3-clique but only 2 registers -> exactly one spill.
        let mut g = ColoringInput::new(3, vec![16, 17]);
        g.add_edge(0, 1);
        g.add_edge(1, 2);
        g.add_edge(0, 2);
        // Make node 2 the cheapest to spill.
        g.nodes[0].spill_cost = 100;
        g.nodes[1].spill_cost = 100;
        g.nodes[2].spill_cost = 1;
        let a = color(&g);
        assert_eq!(a.spilled, vec![2], "cheapest node should spill: {:?}", a);
    }

    #[test]
    fn pair_nodes_get_aligned_registers() {
        // Two interfering 16-bit pairs need 4 registers across two aligned pairs.
        let mut g = ColoringInput::new(2, vec![24, 25, 26, 27]);
        g.nodes[0].width = 2;
        g.nodes[1].width = 2;
        g.add_edge(0, 1);
        let a = color(&g);
        assert!(a.spilled.is_empty(), "should fit: {:?}", a);
        let c0 = a.colors[&0];
        let c1 = a.colors[&1];
        assert_eq!(c0 % 2, 0, "pair must be even-aligned");
        assert_eq!(c1 % 2, 0, "pair must be even-aligned");
        assert!(
            (c0 as i16 - c1 as i16).abs() >= 2,
            "pairs must not overlap: {} {}",
            c0,
            c1
        );
    }

    #[test]
    fn pair_and_scalar_interference() {
        // A 16-bit pair interfering with an 8-bit node: the scalar must avoid both pair
        // bytes.
        let mut g = ColoringInput::new(2, vec![24, 25, 26]);
        g.nodes[0].width = 2; // occupies 24,25
        g.nodes[0].precolored = Some(24);
        g.nodes[1].width = 1;
        g.add_edge(0, 1);
        let a = color(&g);
        assert_eq!(a.colors[&1], 26, "scalar must dodge the pinned pair: {:?}", a.colors);
    }

    #[test]
    fn coalesces_non_interfering_move() {
        // dst <- src move, not interfering: should be coalesced to one register.
        let mut g = ColoringInput::new(2, vec![16, 17, 18]);
        g.add_move(0, 1);
        let a = color(&g);
        assert_eq!(a.colors[&0], a.colors[&1], "move should coalesce: {:?}", a);
        assert_eq!(a.coalesced.len(), 1);
    }

    #[test]
    fn coalescing_preserves_register_class() {
        let mut g = ColoringInput::new(2, vec![18, 22, 26]);
        g.nodes[0].class = vec![26];
        g.add_move(1, 0);
        let a = color(&g);
        assert_eq!(a.colors[&0], 26);
        assert_eq!(a.colors[&1], 26, "coalesced node must keep constrained class");
    }

    #[test]
    fn does_not_coalesce_interfering_move() {
        let mut g = ColoringInput::new(2, vec![16, 17, 18]);
        g.add_move(0, 1);
        g.add_edge(0, 1); // they interfere -> cannot share a register
        let a = color(&g);
        assert_ne!(a.colors[&0], a.colors[&1], "interfering nodes must differ");
    }

    #[test]
    fn respects_precolored_abi_register() {
        let mut g = ColoringInput::new(2, vec![24, 25]);
        g.nodes[0].precolored = Some(24);
        g.add_edge(0, 1);
        let a = color(&g);
        assert_eq!(a.colors[&0], 24);
        assert_eq!(a.colors[&1], 25);
    }
}
