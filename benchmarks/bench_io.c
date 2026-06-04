#include <avr/io.h>
#include <stdint.h>

int main(void) {
#if defined(DDRB) && defined(PORTB)
    DDRB |= _BV(0);
    PORTB |= _BV(0);
    PORTB &= (uint8_t)~_BV(0);
#elif defined(PORTB_DIR) && defined(PORTB_OUT)
    PORTB_DIR |= _BV(0);
    PORTB_OUT |= _BV(0);
    PORTB_OUT &= (uint8_t)~_BV(0);
#elif defined(PORTA_DIR) && defined(PORTA_OUT)
    PORTA_DIR |= _BV(0);
    PORTA_OUT |= _BV(0);
    PORTA_OUT &= (uint8_t)~_BV(0);
#endif

    while(1) {}
    return 0;
}
