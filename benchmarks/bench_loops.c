#include <stdint.h>

uint16_t test_return(uint16_t val) {
    if (val == 0) {
        return 0;
    }
    return val * 5;
}

int main(void) {
    volatile uint8_t res = 0;
    volatile uint8_t ok = 1;

    // 1. Conditionals (If-Then-Else)
    volatile uint8_t x = 10;
    if (x == 10) {
        res = 1;
    } else {
        res = 2;
    }
    if (res != 1) {
        ok = 0;
    }

    if (x != 10) {
        res = 3;
    } else {
        res = 4;
    }
    if (res != 4) {
        ok = 0;
    }

    // 2. Simple Range Loop
    volatile uint16_t sum = 0;
    for (volatile uint16_t i = 0; i < 5; i++) {
        sum = sum + i;
    }
    if (sum != 10) {
        ok = 0;
    }

    // 3. Dynamic Range Bounds Loop
    volatile uint16_t limit = 10;
    sum = 0;
    for (volatile uint16_t j = 5; j < limit; j++) {
        sum = sum + j;
    }
    if (sum != 35) {
        ok = 0;
    }

    // 4. Nested Range Loops
    sum = 0;
    for (volatile uint16_t outer = 0; outer < 3; outer++) {
        for (volatile uint16_t inner = 0; inner < 4; inner++) {
            sum = sum + 1;
        }
    }
    if (sum != 12) {
        ok = 0;
    }

    // 5. Return Statement Subroutine Check
    res = test_return(5);
    if (res != 25) {
        ok = 0;
    }

    res = ok;

    while (1) {
        // End of test
    }
    return 0;
}
