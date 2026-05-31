# Copyright 2026 The ik8b Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -------------------------------------------------------------
# Standard Fixed-Point Mathematics Library for AVR
# -------------------------------------------------------------

# -------------------------------------------------------------
# Q8.8 Fixed-Point Helper Functions (1.0 = 256)
# -------------------------------------------------------------

# Multiplies two Q8.8 fixed-point values.
# Computes the product by splitting inputs into high and low bytes
# to prevent intermediate 32-bit arithmetic overflow within 16-bit register limits.
@_q88_mul($a: r16, $b: r16) -> r16 {
    ram imut $a_raw: u16 = $a
    ram imut $b_raw: u16 = $b
    ram imut $a_hi: u16 = $a_raw / 256
    ram imut $a_lo: u16 = $a_raw & 255
    ram imut $b_hi: u16 = $b_raw / 256
    ram imut $b_lo: u16 = $b_raw & 255
    
    ram mut $term1: u16 = $a_hi * $b_hi
    $term1 * 256 -> $term1
    
    ram imut $term2: u16 = $a_hi * $b_lo
    ram imut $term3: u16 = $a_lo * $b_hi
    ram imut $term4: u16 = ($a_lo * $b_lo) / 256
    
    return $term1 + $term2 + $term3 + $term4
}

# Divides two Q8.8 fixed-point values.
# Utilizes a bit-by-bit long division algorithm to compute high-precision 
# quotients without 32-bit hardware division support.
@_q88_div($a: r16, $b: r16) -> r16 {
    ram imut $b_raw: u16 = $b
    ? $b_raw == 0 { return 127.99 }
    ram mut $rem: u16 = $a
    ram imut $int_part: u16 = $rem / $b_raw
    $rem % $b_raw -> $rem
    
    ram mut $frac_part: u16 = 0
    loop 0..8 -> $bit {
        $rem * 2 -> $rem
        $frac_part * 2 -> $frac_part
        ? $rem >= $b_raw {
            $rem - $b_raw -> $rem
            $frac_part + 1 -> $frac_part
        }
    }
    return ($int_part * 256) + $frac_part
}

# -------------------------------------------------------------
# Mathematical Constants in Q8.8 Fixed-Point Format
# -------------------------------------------------------------

# Archimedes' constant pi (3.14159 approximated as 3.14)
@pi() -> r16 { return 3.14 }

# Euler's number e (2.71828 approximated as 2.718)
@e() -> r16 { return 2.718 }

# Circle constant tau = 2 * pi (6.28318 approximated as 6.283)
@tau() -> r16 { return 6.283 }

# -------------------------------------------------------------
# Representation & Rounding Functions
# -------------------------------------------------------------

# Compares two signed fixed-point values and returns the minimum
@min($a: r16, $b: r16) -> r16 {
    ? $a < $b { return $a }
    return $b
}

# Compares two signed fixed-point values and returns the maximum
@max($a: r16, $b: r16) -> r16 {
    ? $a > $b { return $a }
    return $b
}

# Clamps an input value to remain within the specified inclusive bounds [min_val, max_val]
@clamp($val: r16, $min_val: r16, $max_val: r16) -> r16 {
    ? $val < $min_val { return $min_val }
    ? $val > $max_val { return $max_val }
    return $val
}

# Maps a value linearly from one numeric range to another
@map($val: r16, $in_min: r16, $in_max: r16, $out_min: r16, $out_max: r16) -> r16 {
    ram mut $num: r16 = $val - $in_min
    ram imut $in_span: r16 = $in_max - $in_min
    ram imut $ratio: r16 = $num / $in_span
    ram imut $out_span: r16 = $out_max - $out_min
    ram imut $prod: r16 = $ratio * $out_span
    return $prod + $out_min
}

# Computes absolute value of signed Q8.8 fixed-point integer
@abs($x: r16) -> r16 {
    ? $x < 0.0 { return 0.0 - $x }
    return $x
}

# Computes absolute value of signed fixed-point value
@fabs($x: r16) -> r16 {
    return @abs($x)
}

# Rounds a Q8.8 value to the nearest greater or equal integer boundary
@ceil($x: r16) -> r16 {
    ram imut $raw_x: u16 = $x
    ram imut $frac: u16 = $raw_x & 255
    ? $frac != 0 {
        return ($raw_x & 0xFF00) + 256
    }
    return $x
}

# Rounds a Q8.8 value to the nearest lesser or equal integer boundary
@floor($x: r16) -> r16 {
    ram imut $raw_x: u16 = $x
    return $raw_x & 0xFF00
}

# Rounds a Q8.8 value to the nearest integer boundary towards zero
@trunc($x: r16) -> r16 {
    ? $x < 0.0 {
        ram imut $abs_x: r16 = 0.0 - $x
        ram imut $raw_abs: u16 = $abs_x
        ram imut $tr: u16 = $raw_abs & 0xFF00
        return 0.0 - $tr
    }
    ram imut $raw_x: u16 = $x
    return $raw_x & 0xFF00
}

# Returns value with magnitude of first parameter and sign of second parameter
@copysign($x: r16, $y: r16) -> r16 {
    ram imut $abs_x: r16 = @abs($x)
    ? $y < 0.0 { return 0.0 - $abs_x }
    return $abs_x
}

# Computes the remainder of dividing the first Q8.8 operand by the second
@fmod($x: r16, $y: r16) -> r16 {
    ? $y == 0.0 { return 0.0 }
    ram imut $div: r16 = @_q88_div($x, $y)
    ram imut $floor_div: r16 = @floor($div)
    ram imut $prod: r16 = @_q88_mul($floor_div, $y)
    return $x - $prod
}

# Determines if two values are equivalent within a given absolute tolerance threshold
@isclose($a: r16, $b: r16, $rel_tol: r16) -> r16 {
    ram mut $diff: r16 = 0.0
    ? $a > $b { $a - $b -> $diff } : { $b - $a -> $diff }
    ? $diff <= $rel_tol { return 1.0 }
    return 0.0
}

# Verifies if fixed-point representation contains a NaN (always returns 0.0 in fixed-point)
@isnan($x: r16) -> r16 { return 0.0 }

# Verifies if fixed-point representation corresponds to positive or negative infinity boundaries
@isinf($x: r16) -> r16 {
    ram imut $val: u16 = $x
    ? $val == 32767 { return 1.0 }
    ? $val == 65535 { return 1.0 }
    return 0.0
}

# Verifies if a Q8.8 value represents a finite value
@isfinite($x: r16) -> r16 {
    ram imut $inf: r16 = @isinf($x)
    ? $inf != 0.0 { return 0.0 }
    return 1.0
}

# -------------------------------------------------------------
# Power & Logarithmic Functions
# -------------------------------------------------------------

# Computes standard base raised to exponent power using binary exponentiation (square-and-multiply)
@pow($base: r16, $exp: u16) -> r16 {
    ram mut $res: r16 = 1.0
    ram mut $b: r16 = $base
    ram mut $e: u16 = $exp
    loop * {
        ? $e == 0 { return $res }
        ram imut $odd: u16 = $e & 1
        ? $odd != 0 { $res * $b -> $res }
        $b * $b -> $b
        $e / 2 -> $e
    }
    return $res
}

# Computes square root of a Q8.8 fixed-point value using the binary digit-by-digit extraction algorithm
@sqrt($x: r16) -> r16 {
    ram mut $res: u16 = 0
    ram mut $bit: u16 = 16384
    ram mut $val: u16 = $x
    loop 0..9 -> $step {
        ? $bit > $val {
            $bit / 4 -> $bit
        }
    }
    loop 0..9 -> $step {
        ? $bit != 0 {
            ram imut $temp: u16 = $res + $bit
            ? $val >= $temp {
                $val - $temp -> $val
                $res / 2 -> $res
                $res + $bit -> $res
            } : {
                $res / 2 -> $res
            }
            $bit / 4 -> $bit
        }
    }
    return $res * 16
}

# Computes exponential function e^x using a 5th-degree Maclaurin series approximation.
# Designed non-recursively to prevent SRAM static local variable collisions on AVR.
# Caps intermediate input value to 5.0 to prevent 16-bit calculation overflow.
@exp($x: r16) -> r16 {
    ram mut $is_neg: u8 = 0
    ram mut $val: r16 = $x
    ? $x < 0.0 {
        0.0 - $x -> $val
        1 -> $is_neg
    }
    ? $val > 5.0 {
        ? $is_neg != 0 { return 0.0 }
        return 127.99
    }
    
    ram imut $term0: r16 = 1.0
    ram mut $term1: r16 = $val
    ram imut $x2: r16 = @_q88_mul($val, $val)
    ram imut $term2: r16 = $x2 / 2
    ram imut $term3: r16 = @_q88_mul($term2, $val) / 3
    ram imut $term4: r16 = @_q88_mul($term3, $val) / 4
    ram imut $term5: r16 = @_q88_mul($term4, $val) / 5
    
    ram mut $res: r16 = $term0 + $term1 + $term2 + $term3 + $term4 + $term5
    ? $is_neg != 0 {
        ram imut $one: r16 = 1.0
        return @_q88_div($one, $res)
    }
    return $res
}

# Computes the natural logarithm ln(x) using Taylor series expansion and scaling.
# Performs scaling range reduction by multiplying/dividing by Euler's constant.
@log($x: r16) -> r16 {
    ram imut $raw_x: u16 = $x
    ? $raw_x == 0 { return -128.0 }
    ram mut $val: r16 = $x
    ram mut $offset: r16 = 0.0
    ram imut $e_val: r16 = @e()
    loop 0..7 -> $step {
        ? $val > 2.0 {
            @_q88_div($val, $e_val) -> $val
            $offset + 1.0 -> $offset
        }
    }
    loop 0..7 -> $step {
        ? $val < 0.5 {
            @_q88_mul($val, $e_val) -> $val
            $offset - 1.0 -> $offset
        }
    }
    
    ram mut $num: r16 = $val - 1.0
    ram imut $den: r16 = $val + 1.0
    ram mut $y: r16 = @_q88_div($num, $den)
    ram imut $y2: r16 = @_q88_mul($y, $y)
    ram imut $y3: r16 = @_q88_mul($y, $y2)
    ram imut $y5: r16 = @_q88_mul($y3, $y2)
    
    ram mut $term1: r16 = $y
    ram imut $term3: r16 = $y3 / 3
    ram imut $term5: r16 = $y5 / 5
    ram imut $sum: r16 = $term1 + $term3 + $term5
    ram imut $ln_val: r16 = $sum * 2
    return $ln_val + $offset
}

# Computes the base-2 logarithm log2(x) by dividing natural log by ln(2)
@log2($x: r16) -> r16 {
    ram imut $ln: r16 = @log($x)
    ram imut $div_val: r16 = 0.691
    return @_q88_div($ln, $div_val)
}

# Computes the base-10 logarithm log10(x) by dividing natural log by ln(10)
@log10($x: r16) -> r16 {
    ram imut $ln: r16 = @log($x)
    ram imut $div_val: r16 = 2.304
    return @_q88_div($ln, $div_val)
}

# -------------------------------------------------------------
# Trigonometric & Angular Functions
# -------------------------------------------------------------

# Computes the sine approximation in degrees over the domain [0, 180] 
# using Bhaskara I's high-efficiency approximation formula.
@_sin_180($x: u16) -> r16 {
    ? $x == 0 { return 0.0 }
    ? $x == 180 { return 0.0 }
    ram mut $num: u16 = 4 * $x
    $num * (180 - $x) -> $num
    ram imut $den: u16 = 40500 - ($x * (180 - $x))
    ram imut $pct: u16 = $num / ($den / 100)
    return ($pct * 64) / 25
}

# Computes sine function from input angle in degrees using quadrant symmetry mapping.
@sin($deg: u16) -> r16 {
    ram imut $d: u16 = $deg % 360
    ? $d <= 180 {
        ram mut $val: r16 = 0.0
        @_sin_180($d) -> $val
        return $val
    }
    ram mut $val: r16 = 0.0
    @_sin_180($d - 180) -> $val
    return 0.0 - $val
}

# Computes cosine function by phase-shifting input angle 90 degrees
@cos($deg: u16) -> r16 {
    return @sin($deg + 90)
}

# Computes tangent function as sine over cosine, checking for zero boundaries
@tan($deg: u16) -> r16 {
    ram mut $s: r16 = @sin($deg)
    ram mut $c: r16 = @cos($deg)
    ? $c == 0.0 { return 127.99 }
    return @_q88_div($s, $c)
}

# Converts an angle from degrees to Q8.8 fixed-point radians
@radians($deg: u16) -> r16 {
    return ($deg * 67) / 15
}

# Converts an angle from Q8.8 fixed-point radians to degrees
@degrees($rad: r16) -> u16 {
    return ($rad * 15) / 67
}

# Computes the Euclidean hypotenuse length sqrt(x^2 + y^2) avoiding intermediate overflows
@hypot($x: r16, $y: r16) -> r16 {
    ram imut $x2: r16 = @_q88_mul($x, $x)
    ram imut $y2: r16 = @_q88_mul($y, $y)
    return @sqrt($x2 + $y2)
}

# Computes the Euclidean distance between two points in 2D space
@dist($x1: r16, $y1: r16, $x2: r16, $y2: r16) -> r16 {
    ram mut $dx: r16 = 0.0
    ? $x1 > $x2 { $x1 - $x2 -> $dx } : { $x2 - $x1 -> $dx }
    ram mut $dy: r16 = 0.0
    ? $y1 > $y2 { $y1 - $y2 -> $dy } : { $y2 - $y1 -> $dy }
    return @hypot($dx, $dy)
}

# -------------------------------------------------------------
# Hyperbolic Functions
# -------------------------------------------------------------

# Computes hyperbolic sine function sinh(x) using exponential relationships
@sinh($x: r16) -> r16 {
    ram imut $ex: r16 = @exp($x)
    ram imut $neg_x: r16 = 0.0 - $x
    ram imut $enx: r16 = @exp($neg_x)
    return ($ex - $enx) / 2
}

# Computes hyperbolic cosine function cosh(x) using exponential relationships
@cosh($x: r16) -> r16 {
    ram imut $ex: r16 = @exp($x)
    ram imut $neg_x: r16 = 0.0 - $x
    ram imut $enx: r16 = @exp($neg_x)
    return ($ex + $enx) / 2
}

# Computes hyperbolic tangent function tanh(x) as sinh(x)/cosh(x)
@tanh($x: r16) -> r16 {
    ram mut $s: r16 = @sinh($x)
    ram mut $c: r16 = @cosh($x)
    return $s / $c
}

# Computes inverse hyperbolic sine function asinh(x)
@asinh($x: r16) -> r16 {
    ram imut $x2: r16 = @_q88_mul($x, $x)
    ram imut $val: r16 = $x2 + 1.0
    ram imut $sq: r16 = @sqrt($val)
    return @log($x + $sq)
}

# Computes inverse hyperbolic cosine function acosh(x)
@acosh($x: r16) -> r16 {
    ram imut $x2: r16 = @_q88_mul($x, $x)
    ram imut $val: r16 = $x2 - 1.0
    ram imut $sq: r16 = @sqrt($val)
    return @log($x + $sq)
}

# Computes inverse hyperbolic tangent function atanh(x)
@atanh($x: r16) -> r16 {
    ram mut $num: r16 = 1.0 + $x
    ram imut $den: r16 = 1.0 - $x
    ram imut $div: r16 = $num / $den
    ram imut $ln: r16 = @log($div)
    return $ln / 2
}

# -------------------------------------------------------------
# Combinatorics, Theory & Special Functions
# -------------------------------------------------------------

# Computes the Greatest Common Divisor (GCD) of two 16-bit values using the Euclidean algorithm
@gcd($a: u16, $b: u16) -> u16 {
    ram mut $x: u16 = $a
    ram mut $y: u16 = $b
    loop * {
        ? $y == 0 { return $x }
        ram imut $temp: u16 = $x % $y
        $y -> $x
        $temp -> $y
    }
    return $x
}

# Computes the Least Common Multiple (LCM) of two 16-bit values
@lcm($a: u16, $b: u16) -> u16 {
    ? $a == 0 { return 0 }
    ? $b == 0 { return 0 }
    ram imut $g: u16 = @gcd($a, $b)
    ram imut $prod: u16 = $a * $b
    return $prod / $g
}

# Computes the factorial of a 8-bit integer iteratively
@factorial($n: u8) -> u16 {
    ram mut $res: u16 = 1
    ram imut $limit: u16 = $n
    loop 1..($limit + 1) -> $idx {
        $res * $idx -> $res
    }
    return $res
}

# Computes the Fibonacci sequence value at position n iteratively
@fibonacci($n: u8) -> u16 {
    ? $n == 0 { return 0 }
    ? $n == 1 { return 1 }
    ram mut $a: u16 = 0
    ram mut $b: u16 = 1
    ram mut $c: u16 = 0
    ram imut $limit: u16 = $n
    loop 2..($limit + 1) -> $i {
        $a + $b -> $c
        $b -> $a
        $c -> $b
    }
    return $b
}

# Computes the permutations of n items chosen k at a time
@perm($n: u8, $k: u8) -> u16 {
    ram imut $fact_n: u16 = @factorial($n)
    ram imut $fact_nk: u16 = @factorial($n - $k)
    return $fact_n / $fact_nk
}

# Evaluates the Gamma function for integer input values (defined as (x - 1)!)
@gamma($x: u8) -> u16 {
    ram mut $val: u8 = $x - 1
    return @factorial($val)
}
