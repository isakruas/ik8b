#include <avr/io.h>

int main(void) {
    DDRB = 0xFF;
    PORTB = 0x55;
    PORTB = 0xAA;
    while(1) {}
    return 0;
}
