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
@_q88_mul($a: u16, $b: u16) -> u16 {
    mut $a_hi: u16 = $a / 256
    mut $a_lo: u16 = $a & 255
    mut $b_hi: u16 = $b / 256
    mut $b_lo: u16 = $b & 255
    
    mut $term1: u16 = $a_hi * $b_hi
    $term1 * 256 -> $term1
    
    mut $term2: u16 = $a_hi * $b_lo
    mut $term3: u16 = $a_lo * $b_hi
    mut $term4: u16 = ($a_lo * $b_lo) / 256
    
    return $term1 + $term2 + $term3 + $term4
}

# Divides two Q8.8 fixed-point values.
# Utilizes a bit-by-bit long division algorithm to compute high-precision 
# quotients without 32-bit hardware division support.
@_q88_div($a: u16, $b: u16) -> u16 {
    ? $b == 0 { return 32767 }
    mut $res: u16 = 0
    mut $rem: u16 = $a
    mut $int_part: u16 = $rem / $b
    $int_part * 256 -> $res
    $rem % $b -> $rem
    
    loop 0..8 -> $bit {
        $rem * 2 -> $rem
        $res * 2 -> $res
        ? $rem >= $b {
            $rem - $b -> $rem
            $res + 1 -> $res
        }
    }
    return $res
}

# -------------------------------------------------------------
# Mathematical Constants in Q8.8 Fixed-Point Format
# -------------------------------------------------------------

# Archimedes' constant pi (3.14159 approximated as 804 / 256 = 3.1328)
@pi() -> u16 { return 804 }

# Euler's number e (2.71828 approximated as 696 / 256 = 2.71875)
@e() -> u16 { return 696 }

# Circle constant tau = 2 * pi (6.28318 approximated as 1608 / 256 = 6.28125)
@tau() -> u16 { return 1608 }

# -------------------------------------------------------------
# Representation & Rounding Functions
# -------------------------------------------------------------

# Compares two unsigned 16-bit values and returns the minimum
@min($a: u16, $b: u16) -> u16 {
    ? $a < $b { return $a }
    return $b
}

# Compares two unsigned 16-bit values and returns the maximum
@max($a: u16, $b: u16) -> u16 {
    ? $a > $b { return $a }
    return $b
}

# Clamps an input value to remain within the specified inclusive bounds [min_val, max_val]
@clamp($val: u16, $min_val: u16, $max_val: u16) -> u16 {
    ? $val < $min_val { return $min_val }
    ? $val > $max_val { return $max_val }
    return $val
}

# Maps a value linearly from one numeric range to another
@map($val: u16, $in_min: u16, $in_max: u16, $out_min: u16, $out_max: u16) -> u16 {
    mut $num: u16 = $val - $in_min
    mut $out_span: u16 = $out_max - $out_min
    mut $prod: u16 = $num * $out_span
    mut $in_span: u16 = $in_max - $in_min
    mut $div: u16 = $prod / $in_span
    return $div + $out_min
}

# Computes absolute value of signed Q8.8 fixed-point integer (MSB set indicates negative in 2's complement)
@abs($x: u16) -> u16 {
    ? $x >= 32768 { return 0 - $x }
    return $x
}

# Computes absolute value of signed fixed-point value
@fabs($x: u16) -> u16 {
    return @abs($x)
}

# Rounds a Q8.8 value to the nearest greater or equal integer boundary
@ceil($x: u16) -> u16 {
    mut $frac: u16 = $x & 255
    ? $frac != 0 {
        return ($x & 0xFF00) + 256
    }
    return $x
}

# Rounds a Q8.8 value to the nearest lesser or equal integer boundary
@floor($x: u16) -> u16 {
    return $x & 0xFF00
}

# Rounds a Q8.8 value to the nearest integer boundary towards zero
@trunc($x: u16) -> u16 {
    ? $x >= 32768 {
        mut $abs_x: u16 = 0 - $x
        mut $tr: u16 = $abs_x & 0xFF00
        return 0 - $tr
    }
    return $x & 0xFF00
}

# Returns value with magnitude of first parameter and sign of second parameter
@copysign($x: u16, $y: u16) -> u16 {
    mut $abs_x: u16 = @abs($x)
    ? $y >= 32768 { return 0 - $abs_x }
    return $abs_x
}

# Computes the remainder of dividing the first Q8.8 operand by the second
@fmod($x: u16, $y: u16) -> u16 {
    ? $y == 0 { return 0 }
    mut $div: u16 = @_q88_div($x, $y)
    mut $floor_div: u16 = @floor($div)
    mut $prod: u16 = @_q88_mul($floor_div, $y)
    return $x - $prod
}

# Determines if two values are equivalent within a given absolute tolerance threshold
@isclose($a: u16, $b: u16, $rel_tol: u16) -> u16 {
    mut $diff: u16 = 0
    ? $a > $b { $a - $b -> $diff } : { $b - $a -> $diff }
    ? $diff <= $rel_tol { return 1 }
    return 0
}

# Verifies if fixed-point representation contains a NaN (always returns 0 in fixed-point)
@isnan($x: u16) -> u16 { return 0 }

# Verifies if fixed-point representation corresponds to positive or negative infinity boundaries
@isinf($x: u16) -> u16 {
    ? $x == 32767 { return 1 }
    ? $x == 65535 { return 1 }
    return 0
}

# Verifies if a Q8.8 value represents a finite value
@isfinite($x: u16) -> u16 {
    mut $inf: u16 = @isinf($x)
    ? $inf != 0 { return 0 }
    return 1
}

# -------------------------------------------------------------
# Power & Logarithmic Functions
# -------------------------------------------------------------

# Computes standard base raised to exponent power using binary exponentiation (square-and-multiply)
@pow($base: u16, $exp: u16) -> u16 {
    mut $res: u16 = 1
    mut $b: u16 = $base
    mut $e: u16 = $exp
    loop * {
        ? $e == 0 { loop_break }
        mut $odd: u16 = $e & 1
        ? $odd != 0 { $res * $b -> $res }
        $b * $b -> $b
        $e / 2 -> $e
    }
    return $res
}

# Computes square root of a Q8.8 fixed-point value using the binary digit-by-digit extraction algorithm
@sqrt($x: u16) -> u16 {
    mut $res: u16 = 0
    mut $bit: u16 = 16384
    mut $val: u16 = $x
    loop * {
        ? $bit > $val { $bit / 4 -> $bit } : { loop_break }
    }
    loop * {
        ? $bit == 0 { loop_break }
        mut $temp: u16 = $res + $bit
        ? $val >= $temp {
            $val - $temp -> $val
            $res / 2 -> $res
            $res + $bit -> $res
        } : {
            $res / 2 -> $res
        }
        $bit / 4 -> $bit
    }
    return $res
}

# Computes exponential function e^x using a 5th-degree Maclaurin series approximation.
# Designed non-recursively to prevent SRAM static local variable collisions on AVR.
# Caps intermediate input value to 5.0 (1280) to prevent 16-bit calculation overflow.
@exp($x: u16) -> u16 {
    mut $is_neg: u8 = 0
    mut $val: u16 = $x
    ? $x >= 32768 {
        0 - $x -> $val
        1 -> $is_neg
    }
    ? $val > 1280 {
        ? $is_neg != 0 { return 0 }
        return 32767
    }
    
    mut $term0: u16 = 256
    mut $term1: u16 = $val
    mut $x2: u16 = @_q88_mul($val, $val)
    mut $term2: u16 = $x2 / 2
    mut $term3: u16 = @_q88_mul($term2, $val) / 3
    mut $term4: u16 = @_q88_mul($term3, $val) / 4
    mut $term5: u16 = @_q88_mul($term4, $val) / 5
    
    mut $res: u16 = $term0 + $term1 + $term2 + $term3 + $term4 + $term5
    ? $is_neg != 0 {
        return @_q88_div(256, $res)
    }
    return $res
}

# Computes the natural logarithm ln(x) using Taylor series expansion and scaling.
# Performs scaling range reduction by multiplying/dividing by Euler's constant.
@log($x: u16) -> u16 {
    ? $x == 0 { return 0xFFFF }
    mut $val: u16 = $x
    mut $offset: u16 = 0
    mut $e_val: u16 = @e()
    loop * {
        ? $val > 512 {
            @_q88_div($val, $e_val) -> $val
            $offset + 256 -> $offset
        } : { loop_break }
    }
    loop * {
        ? $val < 128 {
            @_q88_mul($val, $e_val) -> $val
            $offset - 256 -> $offset
        } : { loop_break }
    }
    
    mut $num: u16 = $val - 256
    mut $den: u16 = $val + 256
    mut $y: u16 = @_q88_div($num, $den)
    mut $y2: u16 = @_q88_mul($y, $y)
    mut $y3: u16 = @_q88_mul($y, $y2)
    mut $y5: u16 = @_q88_mul($y3, $y2)
    
    mut $term1: u16 = $y
    mut $term3: u16 = $y3 / 3
    mut $term5: u16 = $y5 / 5
    mut $sum: u16 = $term1 + $term3 + $term5
    mut $ln_val: u16 = $sum * 2
    return $ln_val + $offset
}

# Computes the base-2 logarithm log2(x) by dividing natural log by ln(2)
@log2($x: u16) -> u16 {
    mut $ln: u16 = @log($x)
    return @_q88_div($ln, 177)
}

# Computes the base-10 logarithm log10(x) by dividing natural log by ln(10)
@log10($x: u16) -> u16 {
    mut $ln: u16 = @log($x)
    return @_q88_div($ln, 590)
}

# -------------------------------------------------------------
# Trigonometric & Angular Functions
# -------------------------------------------------------------

# Computes the sine approximation in degrees over the domain [0, 180] 
# using Bhaskara I's high-efficiency approximation formula.
@_sin_180($x: u16) -> u16 {
    ? $x == 0 { return 0 }
    ? $x == 180 { return 0 }
    mut $num: u16 = 4 * $x
    $num * (180 - $x) -> $num
    mut $den: u16 = 40500 - ($x * (180 - $x))
    return ($num * 100) / $den
}

# Computes sine function from input angle in degrees using quadrant symmetry mapping.
@sin($deg: u16) -> u16 {
    mut $d: u16 = $deg % 360
    ? $d <= 180 {
        mut $val: u16 = 0
        @_sin_180($d) -> $val
        return $val
    }
    mut $val: u16 = 0
    @_sin_180($d - 180) -> $val
    return 0 - $val
}

# Computes cosine function by phase-shifting input angle 90 degrees
@cos($deg: u16) -> u16 {
    return @sin($deg + 90)
}

# Computes tangent function as sine over cosine, checking for zero boundaries
@tan($deg: u16) -> u16 {
    mut $s: u16 = @sin($deg)
    mut $c: u16 = @cos($deg)
    mut $s_neg: u8 = 0
    ? $s >= 32768 {
        0 - $s -> $s
        1 -> $s_neg
    }
    mut $c_neg: u8 = 0
    ? $c >= 32768 {
        0 - $c -> $c
        1 -> $c_neg
    }
    ? $c == 0 { return 32767 }
    mut $res: u16 = ($s * 100) / $c
    ? $s_neg != $c_neg { return 0 - $res }
    return $res
}

# Converts an angle from degrees to Q8.8 fixed-point radians
@radians($deg: u16) -> u16 {
    mut $prod: u16 = $deg * 804
    return $prod / 180
}

# Converts an angle from Q8.8 fixed-point radians to degrees
@degrees($rad: u16) -> u16 {
    mut $prod: u16 = @_q88_mul($rad, 46080)
    return @_q88_div($prod, 804)
}

# Computes the Euclidean hypotenuse length sqrt(x^2 + y^2) avoiding intermediate overflows
@hypot($x: u16, $y: u16) -> u16 {
    mut $x2: u16 = @_q88_mul($x, $x)
    mut $y2: u16 = @_q88_mul($y, $y)
    return @sqrt($x2 + $y2)
}

# Computes the Euclidean distance between two points in 2D space
@dist($x1: u16, $y1: u16, $x2: u16, $y2: u16) -> u16 {
    mut $dx: u16 = 0
    ? $x1 > $x2 { $x1 - $x2 -> $dx } : { $x2 - $x1 -> $dx }
    mut $dy: u16 = 0
    ? $y1 > $y2 { $y1 - $y2 -> $dy } : { $y2 - $y1 -> $dy }
    return @hypot($dx, $dy)
}

# -------------------------------------------------------------
# Hyperbolic Functions
# -------------------------------------------------------------

# Computes hyperbolic sine function sinh(x) using exponential relationships
@sinh($x: u16) -> u16 {
    mut $ex: u16 = @exp($x)
    mut $neg_x: u16 = 0 - $x
    mut $enx: u16 = @exp($neg_x)
    return ($ex - $enx) / 2
}

# Computes hyperbolic cosine function cosh(x) using exponential relationships
@cosh($x: u16) -> u16 {
    mut $ex: u16 = @exp($x)
    mut $neg_x: u16 = 0 - $x
    mut $enx: u16 = @exp($neg_x)
    return ($ex + $enx) / 2
}

# Computes hyperbolic tangent function tanh(x) as sinh(x)/cosh(x)
@tanh($x: u16) -> u16 {
    mut $s: u16 = @sinh($x)
    mut $c: u16 = @cosh($x)
    return @_q88_div($s, $c)
}

# Computes inverse hyperbolic sine function asinh(x)
@asinh($x: u16) -> u16 {
    mut $x2: u16 = @_q88_mul($x, $x)
    mut $sq: u16 = @sqrt($x2 + 256)
    return @log($x + $sq)
}

# Computes inverse hyperbolic cosine function acosh(x)
@acosh($x: u16) -> u16 {
    mut $x2: u16 = @_q88_mul($x, $x)
    mut $sq: u16 = @sqrt($x2 - 256)
    return @log($x + $sq)
}

# Computes inverse hyperbolic tangent function atanh(x)
@atanh($x: u16) -> u16 {
    mut $num: u16 = 256 + $x
    mut $den: u16 = 256 - $x
    mut $div: u16 = @_q88_div($num, $den)
    mut $ln: u16 = @log($div)
    return $ln / 2
}

# -------------------------------------------------------------
# Combinatorics, Theory & Special Functions
# -------------------------------------------------------------

# Computes the Greatest Common Divisor (GCD) of two 16-bit values using the Euclidean algorithm
@gcd($a: u16, $b: u16) -> u16 {
    mut $x: u16 = $a
    mut $y: u16 = $b
    loop * {
        ? $y == 0 { loop_break }
        mut $temp: u16 = $x % $y
        $y -> $x
        $temp -> $y
    }
    return $x
}

# Computes the Least Common Multiple (LCM) of two 16-bit values
@lcm($a: u16, $b: u16) -> u16 {
    ? $a == 0 { return 0 }
    ? $b == 0 { return 0 }
    mut $g: u16 = @gcd($a, $b)
    mut $prod: u16 = $a * $b
    return $prod / $g
}

# Computes the factorial of a 8-bit integer iteratively
@factorial($n: u8) -> u16 {
    mut $res: u16 = 1
    mut $limit: u16 = $n
    loop 1..($limit + 1) -> $idx {
        $res * $idx -> $res
    }
    return $res
}

# Computes the Fibonacci sequence value at position n iteratively
@fibonacci($n: u8) -> u16 {
    ? $n == 0 { return 0 }
    ? $n == 1 { return 1 }
    mut $a: u16 = 0
    mut $b: u16 = 1
    mut $c: u16 = 0
    mut $limit: u16 = $n
    loop 2..($limit + 1) -> $i {
        $a + $b -> $c
        $b -> $a
        $c -> $b
    }
    return $b
}

# Computes the permutations of n items chosen k at a time
@perm($n: u8, $k: u8) -> u16 {
    mut $fact_n: u16 = @factorial($n)
    mut $fact_nk: u16 = @factorial($n - $k)
    return $fact_n / $fact_nk
}

# Evaluates the Gamma function for integer input values (defined as (x - 1)!)
@gamma($x: u8) -> u16 {
    mut $val: u8 = $x - 1
    return @factorial($val)
}
