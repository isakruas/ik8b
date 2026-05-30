#include <stdint.h>

__attribute__((noinline)) uint16_t add_u8(uint8_t a, uint8_t b) {
    return a + b;
}

__attribute__((noinline)) uint16_t multiply_u16(uint16_t a, uint16_t b) {
    return a * b;
}

__attribute__((noinline)) uint16_t square(uint16_t n) {
    return n * n;
}

__attribute__((noinline)) uint16_t nested_ops(uint16_t x, uint16_t y) {
    volatile uint16_t sum = x + y;
    return square(sum);
}

int main(void) {
    volatile uint8_t ok = 1;
    volatile uint16_t res = 0;

    // 1. Direct function call with parameters
    res = add_u8(10, 20);
    if (res != 30) {
        ok = 10;
    }

    // 2. 16-bit subroutine call
    res = multiply_u16(500, 4);
    if (res != 2000) {
        ok = 20;
    }

    // 3. Nested function call
    res = nested_ops(3, 4);
    if (res != 49) {
        ok = 30;
    }

    // 4. Imported function call
    res = square(12);
    if (res != 144) {
        ok = 40;
    }

    res = ok;

    while (1) {
        // End of test
    }
    return 0;
}
