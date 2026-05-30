#include <stdint.h>

int main(void) {
    volatile uint8_t res = 0;
    volatile uint8_t ok = 1;
    volatile uint16_t res16 = 0;

    // 1. 8-bit Bitwise AND
    volatile uint8_t x8 = 0xAA;
    volatile uint8_t y8 = 0xF0;
    res = x8 & y8;
    if (res != 0xA0) {
        ok = 0;
    }

    // 2. 8-bit Bitwise OR
    res = x8 | y8;
    if (res != 0xFA) {
        ok = 0;
    }

    // 3. 8-bit Bitwise XOR
    res = x8 ^ y8;
    if (res != 0x5A) {
        ok = 0;
    }

    // 4. 8-bit Bitwise NOT
    res = ~x8;
    if (res != 0x55) {
        ok = 0;
    }

    // 5. 16-bit Bitwise AND
    volatile uint16_t x16 = 0xAAAA;
    volatile uint16_t y16 = 0xFF00;
    res16 = x16 & y16;
    if (res16 != 0xAA00) {
        ok = 0;
    }

    // 6. 16-bit Bitwise OR
    res16 = x16 | y16;
    if (res16 != 0xFFAA) {
        ok = 0;
    }

    // 7. 16-bit Bitwise XOR
    res16 = x16 ^ y16;
    if (res16 != 0x55AA) {
        ok = 0;
    }

    // 8. 16-bit Bitwise NOT
    res16 = ~x16;
    if (res16 != 0x5555) {
        ok = 0;
    }

    // 9. Compound Bitwise AND (8-bit)
    volatile uint8_t c8 = 0xFF;
    c8 &= 0x0F;
    if (c8 != 0x0F) {
        ok = 0;
    }

    // 10. Compound Bitwise OR (8-bit)
    c8 |= 0xF0;
    if (c8 != 0xFF) {
        ok = 0;
    }

    // 11. Compound Bitwise XOR (8-bit)
    c8 ^= 0x0F;
    if (c8 != 0xF0) {
        ok = 0;
    }

    res = ok;

    while (1) {
        // End of test
    }
    return 0;
}
