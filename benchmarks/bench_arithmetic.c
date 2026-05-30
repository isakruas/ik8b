#include <stdint.h>

int main(void) {
    volatile uint8_t res = 0;
    volatile uint8_t ok = 1;
    volatile uint16_t res16 = 0;

    // 1. 8-bit Addition
    volatile uint8_t x8 = 100;
    volatile uint8_t y8 = 50;
    res = x8 + y8;
    if (res != 150) {
        ok = 0;
    }

    // 2. 8-bit Subtraction
    res = x8 - y8;
    if (res != 50) {
        ok = 0;
    }

    // 3. 8-bit Software Multiplication
    volatile uint8_t m8_a = 12;
    volatile uint8_t m8_b = 8;
    res = m8_a * m8_b;
    if (res != 96) {
        ok = 0;
    }

    // 4. 8-bit Software Division
    volatile uint8_t d8_a = 100;
    volatile uint8_t d8_b = 8;
    res = d8_a / d8_b;
    if (res != 12) {
        ok = 0;
    }

    // 5. 8-bit Modulo
    res = d8_a % d8_b;
    if (res != 4) {
        ok = 0;
    }

    // 6. 16-bit Addition
    volatile uint16_t x16 = 30000;
    volatile uint16_t y16 = 5000;
    res16 = x16 + y16;
    if (res16 != 35000) {
        ok = 0;
    }

    // 7. 16-bit Subtraction
    res16 = x16 - y16;
    if (res16 != 25000) {
        ok = 0;
    }

    // 8. Unary Negation (8-bit)
    volatile uint8_t neg8 = 10;
    res = -neg8;
    if (res != 246) {
        ok = 0;
    }

    // 9. Unary Negation (16-bit)
    volatile uint16_t neg16 = 500;
    res16 = -neg16;
    if (res16 != 65036) {
        ok = 0;
    }

    res = ok;

    while (1) {
        // End of test
    }
    return 0;
}
