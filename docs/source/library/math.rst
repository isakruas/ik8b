=================================
``std/math`` --- Fixed-point math
=================================

.. code-block:: text

   import std/math

A mathematics library that works entirely in **Q8.8 fixed-point** (the ``r16``
type — see :doc:`/reference/types`). There is no floating-point hardware on the
AVR, so every "real" value here is a 16-bit fixed-point number: 8 integer bits
and 8 fractional bits, i.e. the true value scaled by 256.

Because of that representation, results are approximations with limited range
(roughly ±128) and precision (steps of ``1/256``). The transcendental functions
use series expansions and identities chosen to stay within 16-bit arithmetic;
treat them as good engineering approximations, not IEEE-exact.

Angles for the trigonometric functions are given in **whole degrees** as ``u16``
(not radians), which keeps the common case exact and avoids a fixed-point
conversion at every call.

Constants
=========

.. function:: @pi() -> r16

   π, Archimedes' constant (≈ 3.14 in Q8.8).

.. function:: @e() -> r16

   e, Euler's number (≈ 2.718).

.. function:: @tau() -> r16

   τ = 2π (≈ 6.283).

Rounding and sign
=================

.. function:: @abs($x: r16) -> r16

   Absolute value of a signed fixed-point ``$x``.

.. function:: @fabs($x: r16) -> r16

   Absolute value (floating-style alias of :func:`@abs` for fixed-point values).

.. function:: @ceil($x: r16) -> r16

   Round ``$x`` up to the nearest integer value (toward +∞).

.. function:: @floor($x: r16) -> r16

   Round ``$x`` down to the nearest integer value (toward −∞).

.. function:: @trunc($x: r16) -> r16

   Round ``$x`` toward zero, discarding the fractional part.

.. function:: @copysign($x: r16, $y: r16) -> r16

   Return a value with the magnitude of ``$x`` and the sign of ``$y``.

.. function:: @fmod($x: r16, $y: r16) -> r16

   Floating-style remainder of ``$x`` divided by ``$y``.

Comparison and ranges
=====================

.. function:: @min($a: r16, $b: r16) -> r16

   The smaller of two signed fixed-point values.

.. function:: @max($a: r16, $b: r16) -> r16

   The larger of two signed fixed-point values.

.. function:: @clamp($val: r16, $min_val: r16, $max_val: r16) -> r16

   Constrain ``$val`` to the inclusive range ``[$min_val, $max_val]``.

.. function:: @map($val: r16, $in_min: r16, $in_max: r16, $out_min: r16, $out_max: r16) -> r16

   Linearly remap ``$val`` from the input range to the output range.

.. function:: @isclose($a: r16, $b: r16, $rel_tol: r16) -> r16

   Test whether ``$a`` and ``$b`` are within tolerance ``$rel_tol`` of each
   other.

Floating-status predicates
==========================

These exist for API completeness. A Q8.8 value is always finite, so the answers
are constant — they let code that expects an ``isnan``/``isinf`` interface
compile and behave sensibly.

.. function:: @isnan($x: r16) -> r16

   Whether ``$x`` is NaN. Fixed-point has no NaN, so this is always false.

.. function:: @isinf($x: r16) -> r16

   Whether ``$x`` is ±infinity. Fixed-point has no infinities.

.. function:: @isfinite($x: r16) -> r16

   Whether ``$x`` is finite (always true for a fixed-point value).

Powers, roots, exponentials, logs
=================================

.. function:: @pow($base: r16, $exp: u16) -> r16

   ``$base`` raised to the **integer** power ``$exp``, by binary exponentiation
   (square-and-multiply).

.. function:: @sqrt($x: r16) -> r16

   Square root of ``$x``, by digit-by-digit (binary) extraction.

.. function:: @exp($x: r16) -> r16

   e raised to the power ``$x``, via a 5th-degree Maclaurin series. The input is
   capped at 5.0 to avoid 16-bit overflow.

.. function:: @log($x: r16) -> r16

   Natural logarithm ``ln($x)``, via range-reduction against e and a Taylor
   series.

.. function:: @log2($x: r16) -> r16

   Base-2 logarithm, computed as :func:`@log` divided by ln 2.

.. function:: @log10($x: r16) -> r16

   Base-10 logarithm, computed as :func:`@log` divided by ln 10.

Trigonometry
============

Angles are in **degrees** (``u16``) unless noted.

.. function:: @sin($deg: u16) -> r16

   Sine of ``$deg`` degrees, using quadrant symmetry.

.. function:: @cos($deg: u16) -> r16

   Cosine of ``$deg`` degrees (a 90° phase shift of sine).

.. function:: @tan($deg: u16) -> r16

   Tangent of ``$deg`` degrees, as sine over cosine (guards the zero-cosine
   case).

.. function:: @radians($deg: u16) -> r16

   Convert ``$deg`` degrees to radians (returned as Q8.8).

.. function:: @degrees($rad: r16) -> u16

   Convert ``$rad`` radians (Q8.8) to whole degrees.

.. function:: @hypot($x: r16, $y: r16) -> r16

   ``sqrt($x² + $y²)``, computed to avoid intermediate overflow.

.. function:: @dist($x1: r16, $y1: r16, $x2: r16, $y2: r16) -> r16

   Euclidean distance between the points (``$x1``,``$y1``) and (``$x2``,``$y2``).

Hyperbolic
==========

.. function:: @sinh($x: r16) -> r16

   Hyperbolic sine.

.. function:: @cosh($x: r16) -> r16

   Hyperbolic cosine.

.. function:: @tanh($x: r16) -> r16

   Hyperbolic tangent, as ``sinh/cosh``.

.. function:: @asinh($x: r16) -> r16

   Inverse hyperbolic sine.

.. function:: @acosh($x: r16) -> r16

   Inverse hyperbolic cosine.

.. function:: @atanh($x: r16) -> r16

   Inverse hyperbolic tangent.

Integer number theory
=====================

These take and return plain integers, not fixed-point.

.. function:: @gcd($a: u16, $b: u16) -> u16

   Greatest common divisor, by the Euclidean algorithm.

.. function:: @lcm($a: u16, $b: u16) -> u16

   Least common multiple of ``$a`` and ``$b``.

.. function:: @factorial($n: u8) -> u16

   ``$n!`` computed iteratively. Overflows a ``u16`` for ``$n`` above 8.

.. function:: @fibonacci($n: u8) -> u16

   The ``$n``-th Fibonacci number, computed iteratively.

.. function:: @perm($n: u8, $k: u8) -> u16

   The number of permutations of ``$n`` items taken ``$k`` at a time.

.. function:: @gamma($x: u8) -> u16

   The Gamma function for integer input, i.e. ``($x − 1)!``.

Example
=======

.. code-block:: text

   import std/math

   @main {
       ram imut $s:  r16 = @sin(30)             # angle in degrees -> ~0.5 (Q8.8)
       ram imut $rt: r16 = @sqrt(2.0)           # 2.0 is a fixed-point literal -> ~1.414
       ram imut $hi: r16 = @clamp(9.0, 0.0, 5.0) # 9 is above the max -> clamped to 5.0
       ram imut $g:  u16 = @gcd(48, 36)         # plain integers in/out -> 12
       loop * { }
   }

.. note::

   The functions with names beginning with an underscore — ``@_q88_mul``,
   ``@_q88_div``, ``@_sin_180`` — are the internal fixed-point primitives the
   public functions are built on. You normally do not call them directly.
