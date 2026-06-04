==========================
Interrupt vector reference
==========================

Every ``isr`` handler binds to one of the **vector names** below, which are
specific to the device named in your ``target`` declaration. The compiler
validates the name against this table and rejects an unknown one, so if a
name here matches your device you can write ``isr <NAME> { ... }`` for it.

How to read this page
=====================

* Find your device (use your browser's search, or the search box). Devices
  that share an identical vector set are listed together.
* The reset vector (index 0) is **not** listed: that entry is the program
  entry point handled by ``@main``, not an ``isr``.
* Reserved/unused vector slots are omitted.
* A few sources have more than one accepted spelling, shown as ``A / B`` --
  either spelling is valid.
* Names are matched **case-sensitively**.

This table is generated from the compiler's own vector definitions
(``src/vectors.rs``); regenerate it whenever device support changes.

Vectors by device
=================

``at86rf401``
   ``TXDONE``, ``TXEMPTY``

``at90can128``, ``at90can32``, ``at90can64``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_COMPC``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``CANIT``, ``OVRIT``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TWI``, ``SPM_READY``

``at90pwm1``
   ``PSC2_CAPT``, ``PSC2_EC``, ``PSC0_CAPT``, ``PSC0_EC``, ``ANALOG_COMP_0``, ``ANALOG_COMP_2``, ``INT0``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP_A``, ``TIMER0_OVF``, ``ADC``, ``INT1``, ``SPI_STC``, ``INT2``, ``WDT``, ``EE_READY``, ``TIMER0_COMPB``, ``INT3``, ``SPM_READY``

``at90pwm161``, ``at90pwm81``
   ``PSC2_CAPT``, ``PSC2_EC``, ``PSC2_EEC``, ``PSC0_CAPT``, ``PSC0_EC``, ``PSC0_EEC``, ``ANALOG_COMP_1``, ``ANALOG_COMP_2``, ``ANALOG_COMP_3``, ``INT0``, ``TIMER1_CAPT``, ``TIMER1_OVF``, ``ADC``, ``INT1``, ``SPI_STC``, ``INT2``, ``WDT``, ``EE_READY``, ``SPM_READY``

``at90pwm2``, ``at90pwm216``, ``at90pwm3``, ``at90pwm316``
   ``PSC2_CAPT``, ``PSC2_EC``, ``PSC1_CAPT``, ``PSC1_EC``, ``PSC0_CAPT``, ``PSC0_EC``, ``ANALOG_COMP_0``, ``ANALOG_COMP_1``, ``ANALOG_COMP_2``, ``INT0``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP_A``, ``TIMER0_OVF``, ``ADC``, ``INT1``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``INT2``, ``WDT``, ``EE_READY``, ``TIMER0_COMPB``, ``INT3``, ``SPM_READY``

``at90pwm2b``, ``at90pwm3b``
   ``PSC2_CAPT``, ``PSC2_EC``, ``PSC1_CAPT``, ``PSC1_EC``, ``PSC0_CAPT``, ``PSC0_EC``, ``ANALOG_COMP_0``, ``ANALOG_COMP_1``, ``ANALOG_COMP_2``, ``INT0``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_OVF``, ``ADC``, ``INT1``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``INT2``, ``WDT``, ``EE_READY``, ``TIMER0_COMPB``, ``INT3``, ``SPM_READY``

``at90s1200``
   ``INT0``, ``TIMER0_OVF``, ``ANA_COMP``

``at90s2313``
   ``INT0``, ``INT1``, ``TIMER1_CAPT1``, ``TIMER1_COMP1``, ``TIMER1_OVF1``, ``TIMER0_OVF0``, ``UART_RX``, ``UART_UDRE``, ``UART_TX``, ``ANA_COMP``

``at90s2323``, ``at90s2343``, ``attiny22``
   ``INT0``, ``TIMER0_OVF0``

``at90s2333``, ``at90s4433``
   ``INT0``, ``INT1``, ``TIMER1_CAPT``, ``TIMER1_COMP``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC``, ``UART_RX``, ``UART_UDRE``, ``UART_TX``, ``ADC``, ``EE_RDY``, ``ANA_COMP``

``at90s4414``, ``at90s8515``
   ``INT0``, ``INT1``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC``, ``UART_RX``, ``UART_UDRE``, ``UART_TX``, ``ANA_COMP``

``at90s4434``, ``at90s8535``
   ``INT0``, ``INT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC``, ``UART_RX``, ``UART_UDRE``, ``UART_TX``, ``ADC``, ``EE_RDY``, ``ANA_COMP``

``at90scr100``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``SUPPLY_MON``, ``RFU``, ``EE_READY``, ``TWI``, ``SPM_READY``, ``KEYBOARD``, ``HSSPI``, ``SCIB``, ``CPRES``, ``PCINT3``

``at90usb1286``, ``at90usb1287``, ``at90usb646``, ``at90usb647``, ``atmega32u6``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``PCINT0``, ``USB_GEN``, ``USB_COM``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_COMPC``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``TWI``, ``SPM_READY``

``at90usb162``, ``at90usb82``, ``atmega16u2``, ``atmega32u2``, ``atmega8u2``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``PCINT0``, ``PCINT1``, ``USB_GEN``, ``USB_COM``, ``WDT``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_COMPC``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``ANALOG_COMP``, ``EE_READY``, ``SPM_READY``

``ata5272``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``WDT``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_OVF``, ``LIN_TC``, ``LIN_ERR``, ``SPI_STC``, ``ADC``, ``EE_RDY``, ``USI_OVF``, ``ANA_COMP``, ``USI_START``

``ata5505``, ``ata6616c``, ``ata6617c``, ``ata664251``, ``attiny167``, ``attiny87``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``WDT``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_OVF``, ``LIN_TC``, ``LIN_ERR``, ``SPI_STC``, ``ADC``, ``EE_RDY``, ``ANA_COMP``, ``USI_START``, ``USI_OVF``

``ata5702m322``
   ``INT0``, ``INT1``, ``PCI0``, ``PCI1``, ``VMON``, ``AVCCR``, ``AVCCL``, ``T0INT``, ``T1COMP``, ``T1OVF``, ``T2COMP``, ``T2OVF``, ``T3CAP``, ``T3COMP``, ``T3OVF``, ``T4CAP``, ``T4COMP``, ``T4OVF``, ``T5COMP``, ``T5OVF``, ``SPI``, ``SRX_FIFO``, ``STX_FIFO``, ``SSM``, ``DFFLR``, ``DFOUE``, ``SFFLR``, ``SFOUE``, ``TMTCF``, ``AES``, ``TPINT``, ``TPTOERR``, ``LFID0INT``, ``LFID1INT``, ``LFFEINT``, ``LFBCR``, ``LFPBD``, ``LFDE``, ``LFEOT``, ``LFTCOR``, ``LFRSCO``, ``LDFFLR``, ``LDFOUE``, ``EXCM``, ``E2CINT``, ``ERDY``, ``SPMR``, ``TWI1``, ``SPI2``, ``TWI2``

``ata5782``, ``ata5831``
   ``INT0``, ``INT1``, ``PCI0``, ``PCI1``, ``VMON``, ``AVCCR``, ``AVCCL``, ``T0INT``, ``T1COMP``, ``T1OVF``, ``T2COMP``, ``T2OVF``, ``T3CAP``, ``T3COMP``, ``T3OVF``, ``T4CAP``, ``T4COMP``, ``T4OVF``, ``T5COMP``, ``T5OVF``, ``SPI``, ``SRX_FIFO``, ``STX_FIFO``, ``SSM``, ``DFFLR``, ``DFOUE``, ``SFFLR``, ``SFOUE``, ``TMTCF``, ``UHF_WCOB``, ``UHF_WCOA``, ``UHF_SOTB``, ``UHF_SOTA``, ``UHF_EOTB``, ``UHF_EOTA``, ``UHF_NBITB``, ``UHF_NBITA``, ``EXCM``, ``ERDY``, ``SPMR``, ``IDFULL``

``ata5790``
   ``TPINT``, ``INT0``, ``PCINT0``, ``PCINT1``, ``VMINT``, ``T0INT``, ``LFID0INT``, ``LFID1INT``, ``LFFEINT``, ``LFDBINT``, ``T3CAPINT``, ``T3COMINT``, ``T3OVFINT``, ``T2COMINT``, ``T2OVFINT``, ``T1INT``, ``SPISTC``, ``TMRXBINT``, ``TMTXBINT``, ``TMTXCINT``, ``AESINT``, ``LFRSSINT``, ``LFSDINT``, ``LFMDINT``, ``EXCMINT``, ``EXXMINT``, ``RTCINT``, ``EEREADY``, ``SPMREADY``

``ata5790n``
   ``TPINT``, ``INT0``, ``PCINT0``, ``PCINT1``, ``VMINT``, ``T0INT``, ``LFID0INT``, ``LFID1INT``, ``LFFEINT``, ``LFDBINT``, ``T3CAPINT``, ``T3COMINT``, ``T3OVFINT``, ``T3COM2INT``, ``T2COMINT``, ``T2OVFINT``, ``T1INT``, ``SPISTC``, ``TMRXBINT``, ``TMTXBINT``, ``TMTXCINT``, ``AESINT``, ``LFRSSINT``, ``LFSDINT``, ``LFMDINT``, ``EXCMINT``, ``EXXMINT``, ``RTCINT``, ``EEREADY``, ``SPMREADY``

``ata5795``
   ``TPINT``, ``INT0``, ``PCINT0``, ``PCINT1``, ``VMINT``, ``T0INT``, ``T3CAPINT``, ``T3COMINT``, ``T3OVFINT``, ``T2COMINT``, ``T2OVFINT``, ``T1INT``, ``SPISTC``, ``TMRXBINT``, ``TMTXBINT``, ``TMTXCINT``, ``AESINT``, ``EXCMINT``, ``EXXMINT``, ``RTCINT``, ``EEREADY``, ``SPMREADY``

``ata6285``, ``ata6286``, ``ata6289``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``INTVM``, ``SENINT``, ``INTT0``, ``LFWP``, ``T3CAP``, ``T3COMA``, ``T3COMB``, ``T3OVF``, ``T2CAP``, ``T2COM``, ``T2OVF``, ``SPISTC``, ``LFRXB``, ``INTT1``, ``T2RXB``, ``T2TXB``, ``T2TXC``, ``LFREOB``, ``EXCM``, ``EEREADY``, ``SPM_RDY``

``ata6612c``, ``ata6613c``, ``ata6614q``, ``atmega168pa``, ``atmega48pa``, ``atmega88pa``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``ADC``, ``EE_READY``, ``ANALOG_COMP``, ``TWI``

``atmega103``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``UART_RX``, ``UART_UDRE``, ``UART_TX``, ``ADC``, ``EE_READY``, ``ANALOG_COMP``

``atmega128``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ADC``, ``ANALOG_COMP``, ``TIMER1_COMPC``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TWI``, ``SPM_READY``

``atmega1280``, ``atmega2560``, ``atmega640``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_COMPC``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TWI``, ``SPM_READY``, ``TIMER4_CAPT``, ``TIMER4_COMPA``, ``TIMER4_COMPB``, ``TIMER4_COMPC``, ``TIMER4_OVF``, ``TIMER5_CAPT``, ``TIMER5_COMPA``, ``TIMER5_COMPB``, ``TIMER5_COMPC``, ``TIMER5_OVF``, ``USART2_RX``, ``USART2_UDRE``, ``USART2_TX``, ``USART3_RX``, ``USART3_UDRE``, ``USART3_TX``

``atmega1281``, ``atmega2561``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``PCINT0``, ``PCINT1``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_COMPC``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TWI``, ``SPM_READY``, ``TIMER4_COMPA``, ``TIMER4_COMPB``, ``TIMER4_COMPC``, ``TIMER4_OVF``, ``TIMER5_COMPA``, ``TIMER5_COMPB``, ``TIMER5_COMPC``, ``TIMER5_OVF``

``atmega1284``, ``atmega1284p``
   ``INT0``, ``INT1``, ``INT2``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``PCINT3``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TWI``, ``SPM_READY``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_OVF``

``atmega1284rfr2``, ``atmega128rfr2``, ``atmega2564rfr2``, ``atmega256rfr2``, ``atmega644rfr2``, ``atmega64rfr2``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_COMPC``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TWI``, ``SPM_READY``, ``TIMER4_CAPT``, ``TIMER4_COMPA``, ``TIMER4_COMPB``, ``TIMER4_COMPC``, ``TIMER4_OVF``, ``TIMER5_CAPT``, ``TIMER5_COMPA``, ``TIMER5_COMPB``, ``TIMER5_COMPC``, ``TIMER5_OVF``, ``RESERVED_51``, ``RESERVED_52``, ``RESERVED_53``, ``RESERVED_54``, ``RESERVED_55``, ``RESERVED_56``, ``TRX24_PLL_LOCK``, ``TRX24_PLL_UNLOCK``, ``TRX24_RX_START``, ``TRX24_RX_END``, ``TRX24_CCA_ED_DONE``, ``TRX24_XAH_AMI``, ``TRX24_TX_END``, ``TRX24_AWAKE``, ``SCNT_CMP1``, ``SCNT_CMP2``, ``SCNT_CMP3``, ``SCNT_OVFL``, ``SCNT_BACKOFF``, ``AES_READY``, ``BAT_LOW``, ``TRX24_TX_START``, ``TRX24_AMI0``, ``TRX24_AMI1``, ``TRX24_AMI2``, ``TRX24_AMI3``

``atmega128a``, ``atmega64``, ``atmega64a``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ADC``, ``EE_READY``, ``ANALOG_COMP``, ``TIMER1_COMPC``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TWI``, ``SPM_READY``

``atmega128rfa1``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT4``, ``INT5``, ``INT6``, ``INT7``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_COMPC``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TWI``, ``SPM_READY``, ``TIMER4_CAPT``, ``TIMER4_COMPA``, ``TIMER4_COMPB``, ``TIMER4_COMPC``, ``TIMER4_OVF``, ``TIMER5_CAPT``, ``TIMER5_COMPA``, ``TIMER5_COMPB``, ``TIMER5_COMPC``, ``TIMER5_OVF``, ``TRX24_PLL_LOCK``, ``TRX24_PLL_UNLOCK``, ``TRX24_RX_START``, ``TRX24_RX_END``, ``TRX24_CCA_ED_DONE``, ``TRX24_XAH_AMI``, ``TRX24_TX_END``, ``TRX24_AWAKE``, ``SCNT_CMP1``, ``SCNT_CMP2``, ``SCNT_CMP3``, ``SCNT_OVFL``, ``SCNT_BACKOFF``, ``AES_READY``, ``BAT_LOW``

``atmega16``
   ``INT0``, ``INT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RXC``, ``USART_UDRE``, ``USART_TXC``, ``ADC``, ``EE_RDY``, ``ANA_COMP``, ``TWI``, ``INT2``, ``TIMER0_COMP``, ``SPM_RDY``

``atmega1608``, ``atmega3208``, ``atmega4808``, ``atmega808``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``PORTB_PORT``, ``PORTE_PORT``

``atmega1609``, ``atmega3209``, ``atmega4809``, ``atmega809``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``PORTB_PORT``, ``PORTE_PORT``, ``TCB3_INT``, ``USART3_RXC``, ``USART3_DRE``, ``USART3_TXC``

``atmega161``
   ``INT0``, ``INT1``, ``INT2``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``UART0_RX``, ``UART1_RX``, ``UART0_UDRE``, ``UART1_UDRE``, ``UART0_TX``, ``UART1_TX``, ``EE_RDY``, ``ANA_COMP``

``atmega162``
   ``INT0``, ``INT1``, ``INT2``, ``PCINT0``, ``PCINT1``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_OVF``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RXC``, ``USART1_RXC``, ``USART0_UDRE``, ``USART1_UDRE``, ``USART0_TXC``, ``USART1_TXC``, ``EE_RDY``, ``ANA_COMP``, ``SPM_RDY``

``atmega163``
   ``INT0``, ``INT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC``, ``UART_RX``, ``UART_UDRE``, ``UART_TX``, ``ADC``, ``EE_RDY``, ``ANA_COMP``, ``TWI``

``atmega164a``, ``atmega164p``, ``atmega164pa``, ``atmega324a``, ``atmega324p``, ``atmega324pa``, ``atmega644a``, ``atmega644p``, ``atmega644pa``
   ``INT0``, ``INT1``, ``INT2``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``PCINT3``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TWI``, ``SPM_READY``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``

``atmega165``, ``atmega165a``, ``atmega165p``, ``atmega165pa``, ``atmega325``, ``atmega325a``, ``atmega325p``, ``atmega325pa``, ``atmega645``, ``atmega645a``, ``atmega645p``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``USI_START``, ``USI_OVERFLOW``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``SPM_READY``

``atmega168``, ``atmega168a``, ``atmega168p``, ``atmega328``, ``atmega328p``, ``atmega48``, ``atmega48a``, ``atmega48p``, ``atmega88``, ``atmega88a``, ``atmega88p``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``ADC``, ``EE_READY``, ``ANALOG_COMP``, ``TWI``, ``SPM_READY``

``atmega168pb``, ``atmega48pb``, ``atmega88pb``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``ADC``, ``EE_READY``, ``ANALOG_COMP``, ``TWI``, ``USART_START``

``atmega169``, ``atmega169a``, ``atmega169p``, ``atmega169pa``, ``atmega329``, ``atmega329a``, ``atmega329p``, ``atmega329pa``, ``atmega649``, ``atmega649a``, ``atmega649p``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``USI_START``, ``USI_OVERFLOW``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``SPM_READY``, ``LCD``

``atmega16a``
   ``INT0``, ``INT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC / SPISTC``, ``USART_RXC / USARTRXC``, ``USART_UDRE / USARTUDRE``, ``USART_TXC / USARTTXC``, ``ADC``, ``EE_RDY``, ``ANA_COMP``, ``TWI``, ``INT2``, ``TIMER0_COMP``, ``SPM_RDY``

``atmega16hva``, ``atmega8hva``
   ``BPINT``, ``VREGMON``, ``INT0``, ``INT1``, ``INT2``, ``WDT``, ``TIMER1_IC``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_IC``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``VADC``, ``CCADC_CONV``, ``CCADC_REG_CUR``, ``CCADC_ACC``, ``EE_READY``

``atmega16hva2``
   ``BPINT``, ``VREGMON``, ``INT0``, ``INT1``, ``INT2``, ``PCINT0``, ``WDT``, ``TIMER1_IC``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_IC``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``VADC``, ``CCADC_CONV``, ``CCADC_REG_CUR``, ``CCADC_ACC``, ``EE_READY``

``atmega16hvb``, ``atmega16hvbrevb``, ``atmega32hvb``, ``atmega32hvbrevb``
   ``BPINT``, ``VREGMON``, ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``PCINT0``, ``PCINT1``, ``WDT``, ``BGSCD``, ``CHDET``, ``TIMER1_IC``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_IC``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``TWIBUSCD``, ``TWI``, ``SPI_STC``, ``VADC``, ``CCADC_CONV``, ``CCADC_REG_CUR``, ``CCADC_ACC``, ``EE_READY``, ``SPM``

``atmega16m1``, ``atmega32c1``, ``atmega32m1``, ``atmega64c1``, ``atmega64m1``
   ``ANACOMP0``, ``ANACOMP1``, ``ANACOMP2``, ``ANACOMP3``, ``PSC_FAULT``, ``PSC_EC``, ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``CAN_INT``, ``CAN_TOVF``, ``LIN_TC``, ``LIN_ERR``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``PCINT3``, ``SPI_STC``, ``ADC``, ``WDT``, ``EE_READY``, ``SPM_READY``

``atmega16u4``, ``atmega32u4``
   ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``INT6``, ``PCINT0``, ``USB_GEN``, ``USB_COM``, ``WDT``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_COMPC``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_COMPC``, ``TIMER3_OVF``, ``TWI``, ``SPM_READY``, ``TIMER4_COMPA``, ``TIMER4_COMPB``, ``TIMER4_COMPD``, ``TIMER4_OVF``, ``TIMER4_FPF``

``atmega32``, ``atmega323``, ``atmega32a``
   ``INT0``, ``INT1``, ``INT2``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RXC``, ``USART_UDRE``, ``USART_TXC``, ``ADC``, ``EE_RDY``, ``ANA_COMP``, ``TWI``, ``SPM_RDY``

``atmega324pb``
   ``INT0``, ``INT1``, ``INT2``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``PCINT3``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI0_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TWI0``, ``SPM_READY``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_OVF``, ``USART0_RXS / USART0_START``, ``USART1_RXS / USART1_START``, ``PCINT4``, ``XOSCFD``, ``PTC_EOC``, ``PTC_WCOMP``, ``SPI1_STC``, ``TWI1``, ``TIMER4_CAPT``, ``TIMER4_COMPA``, ``TIMER4_COMPB``, ``TIMER4_OVF``, ``USART2_RX``, ``USART2_UDRE``, ``USART2_TX``, ``USART2_RXS / USART2_START``

``atmega3250``, ``atmega3250a``, ``atmega3250p``, ``atmega6450``, ``atmega6450a``, ``atmega6450p``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART0_TX``, ``USI_START``, ``USI_OVERFLOW``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``SPM_READY``, ``PCINT2``, ``PCINT3``

``atmega3250pa``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART0_TX``, ``USI_START``, ``USI_OVERFLOW``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``SPM_READY``, ``NOT_USED``, ``PCINT2``, ``PCINT3``

``atmega328pb``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI0_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ADC``, ``EE_READY``, ``ANALOG_COMP``, ``TWI0``, ``USART0_START``, ``PCINT3``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``USART1_START``, ``TIMER3_CAPT``, ``TIMER3_COMPA``, ``TIMER3_COMPB``, ``TIMER3_OVF``, ``CFD``, ``PTC_EOC``, ``PTC_WCOMP``, ``SPI1_STC``, ``TWI1``, ``TIMER4_CAPT``, ``TIMER4_COMPA``, ``TIMER4_COMPB``, ``TIMER4_OVF``

``atmega3290``, ``atmega3290a``, ``atmega3290p``, ``atmega3290pa``, ``atmega6490``, ``atmega6490a``, ``atmega6490p``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMP``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART0_TX``, ``USI_START``, ``USI_OVERFLOW``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``SPM_READY``, ``LCD``, ``PCINT2``, ``PCINT3``

``atmega406``
   ``BPINT``, ``INT0``, ``INT1``, ``INT2``, ``INT3``, ``PCINT0``, ``PCINT1``, ``WDT``, ``WAKE_UP``, ``TIM1_COMP``, ``TIM1_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``TIM0_OVF``, ``TWI_BUS_CD``, ``TWI``, ``VADC``, ``CCADC_CONV``, ``CCADC_REG_CUR``, ``CCADC_ACC``, ``EE_READY``, ``SPM_READY``

``atmega644``
   ``INT0``, ``INT1``, ``INT2``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``PCINT3``, ``WDT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``ANALOG_COMP``, ``ADC``, ``EE_READY``, ``TWI``, ``SPM_READY``

``atmega64hve``, ``atmega64hve2``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``WDT``, ``WAKEUP``, ``TIMER1_IC``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_IC``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``LIN_STATUS``, ``LIN_ERROR``, ``SPI_STC``, ``VADC_CONV``, ``VADC_ACC``, ``CADC_CONV``, ``CADC_REG_CUR``, ``CADC_ACC``, ``EE_READY``, ``SPM``, ``PLL``

``atmega8``, ``atmega8a``
   ``INT0``, ``INT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RXC``, ``USART_UDRE``, ``USART_TXC``, ``ADC``, ``EE_RDY``, ``ANA_COMP``, ``TWI``, ``SPM_RDY``

``atmega8515``
   ``INT0``, ``INT1``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``ANA_COMP``, ``INT2``, ``TIMER0_COMP``, ``EE_RDY``, ``SPM_RDY``

``atmega8535``
   ``INT0``, ``INT1``, ``TIMER2_COMP``, ``TIMER2_OVF``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``ADC``, ``EE_RDY``, ``ANA_COMP``, ``TWI``, ``INT2``, ``TIMER0_COMP``, ``SPM_RDY``

``attiny10``, ``attiny5``
   ``INT0``, ``PCINT0``, ``TIM0_CAPT``, ``TIM0_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``ANA_COMP``, ``WDT``, ``VLM``, ``ADC``

``attiny11``
   ``INT0``, ``IO_PINS``, ``TIMER0_OVF``, ``ANA_COMP``

``attiny12``
   ``INT0``, ``IO_PINS``, ``TIMER0_OVF``, ``EE_RDY``, ``ANA_COMP``

``attiny13``, ``attiny13a``
   ``INT0``, ``PCINT0``, ``TIM0_OVF``, ``EE_RDY``, ``ANA_COMP``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``WDT``, ``ADC``

``attiny15``
   ``INT0``, ``IO_PINS``, ``TIMER1_COMP``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``EE_RDY``, ``ANA_COMP``, ``ADC``

``attiny1604``, ``attiny1606``, ``attiny1607``, ``attiny406``, ``attiny804``, ``attiny806``, ``attiny807``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``PORTA_PORT``, ``PORTB_PORT``, ``PORTC_PORT``, ``RTC_CNT``, ``RTC_PIT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``NVMCTRL_EE``

``attiny1614``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``PORTA_PORT``, ``PORTB_PORT``, ``RTC_CNT``, ``RTC_PIT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``AC0_AC``, ``AC1_AC``, ``AC2_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``ADC1_RESRDY``, ``ADC1_WCOMP``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``NVMCTRL_EE``

``attiny1616``, ``attiny1617``, ``attiny3214``, ``attiny3216``, ``attiny3217``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``PORTA_PORT``, ``PORTB_PORT``, ``PORTC_PORT``, ``RTC_CNT``, ``RTC_PIT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``AC0_AC``, ``AC1_AC``, ``AC2_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``ADC1_RESRDY``, ``ADC1_WCOMP``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``NVMCTRL_EE``

``attiny1624``, ``attiny1626``, ``attiny1627``, ``attiny3224``, ``attiny3226``, ``attiny3227``, ``attiny424``, ``attiny426``, ``attiny427``, ``attiny824``, ``attiny826``, ``attiny827``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``PORTB_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``AC0_AC``, ``ADC0_ERROR``, ``ADC0_RESRDY``, ``ADC0_SAMPRDY``, ``PORTC_PORT``, ``TCB1_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``NVMCTRL_EE``

``attiny1634``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIM1_CAPT / TIMER1_CAPT``, ``TIM1_COMPA / TIMER1_COMPA``, ``TIM1_COMPB / TIMER1_COMPB``, ``TIM1_OVF / TIMER1_OVF``, ``TIM0_COMPA / TIMER0_COMPA``, ``TIM0_COMPB / TIMER0_COMPB``, ``TIM0_OVF / TIMER0_OVF``, ``ANA_COMP``, ``ADC / ADC_READY``, ``USART0_RXS / USART0_START``, ``USART0_RX / USART0_RXC``, ``USART0_DRE / USART0_UDRE``, ``USART0_TX / USART0_TXC``, ``USART1_RXS / USART1_START``, ``USART1_RX / USART1_RXC``, ``USART1_DRE / USART1_UDRE``, ``USART1_TX / USART1_TXC``, ``USI_START / USI_STR``, ``USI_OVERFLOW / USI_OVF``, ``TWI / TWI_SLAVE``, ``EE_RDY``, ``QTRIP``

``attiny20``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``WDT``, ``TIM1_CAPT``, ``TIM1_COMPA``, ``TIM1_COMPB``, ``TIM1_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``TIM0_OVF``, ``ANA_COMP``, ``ADC_ADC``, ``TWI_SLAVE``, ``SPI``, ``QTRIP``

``attiny202``, ``attiny402``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``PORTA_PORT``, ``RTC_CNT``, ``RTC_PIT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``NVMCTRL_EE``

``attiny204``, ``attiny404``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``PORTA_PORT``, ``PORTB_PORT``, ``RTC_CNT``, ``RTC_PIT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``NVMCTRL_EE``

``attiny212``, ``attiny412``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``PORTA_PORT``, ``RTC_CNT``, ``RTC_PIT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``NVMCTRL_EE``

``attiny214``, ``attiny414``, ``attiny814``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``PORTA_PORT``, ``PORTB_PORT``, ``RTC_CNT``, ``RTC_PIT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``NVMCTRL_EE``

``attiny2313``
   ``INT0``, ``INT1``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``ANA_COMP``, ``PCINT``, ``TIMER1_COMPB``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``USI_START``, ``USI_OVERFLOW``, ``EEPROM_READY``, ``WDT_OVERFLOW``

``attiny2313a``, ``attiny4313``
   ``INT0``, ``INT1``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``USART0_RX / USART_RX``, ``USART0_UDRE / USART_UDRE``, ``USART0_TX / USART_TX``, ``ANA_COMP``, ``PCINT0 / PCINT_B``, ``TIMER1_COMPB``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``USI_START``, ``USI_OVERFLOW``, ``WDT_OVERFLOW``, ``PCINT1 / PCINT_A``, ``PCINT2 / PCINT_D``

``attiny24``, ``attiny44``, ``attiny84``
   ``EXT_INT0 / INT0``, ``PCINT0``, ``PCINT1``, ``WATCHDOG / WDT``, ``TIM1_CAPT / TIMER1_CAPT``, ``TIM1_COMPA``, ``TIM1_COMPB``, ``TIM1_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``TIM0_OVF``, ``ANA_COMP``, ``ADC``, ``EE_RDY``, ``USI_START / USI_STR``, ``USI_OVF``

``attiny24a``
   ``EXT_INT0``, ``PCINT0``, ``PCINT1``, ``WATCHDOG / WDT``, ``TIM1_CAPT``, ``TIM1_COMPA``, ``TIM1_COMPB``, ``TIM1_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``TIM0_OVF``, ``ANA_COMP``, ``ADC``, ``EE_RDY``, ``USI_STR``, ``USI_OVF``

``attiny25``, ``attiny45``, ``attiny85``
   ``INT0``, ``PCINT0``, ``TIM1_COMPA / TIMER1_COMPA``, ``TIM1_OVF / TIMER1_OVF``, ``TIM0_OVF / TIMER0_OVF``, ``EE_RDY``, ``ANA_COMP``, ``ADC``, ``TIM1_COMPB / TIMER1_COMPB``, ``TIM0_COMPA / TIMER0_COMPA``, ``TIM0_COMPB / TIMER0_COMPB``, ``WDT``, ``USI_START``, ``USI_OVF``

``attiny26``
   ``INT0``, ``IO_PINS``, ``TIMER1_CMPA``, ``TIMER1_CMPB``, ``TIMER1_OVF1``, ``TIMER0_OVF0``, ``USI_STRT``, ``USI_OVF``, ``EE_RDY``, ``ANA_COMP``, ``ADC``

``attiny261``, ``attiny261a``, ``attiny461``, ``attiny461a``, ``attiny861``, ``attiny861a``
   ``INT0``, ``PCINT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_OVF``, ``USI_START``, ``USI_OVF``, ``EE_RDY``, ``ANA_COMP``, ``ADC``, ``WDT``, ``INT1``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_CAPT``, ``TIMER1_COMPD``, ``FAULT_PROTECTION``

``attiny28``
   ``INT0``, ``INT1``, ``LOWLEVEL_IO_PINS``, ``TIMER0_OVF``, ``ANA_COMP``

``attiny4``, ``attiny9``
   ``INT0``, ``PCINT0``, ``TIM0_CAPT``, ``TIM0_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``ANA_COMP``, ``WDT``, ``VLM``

``attiny40``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``WDT``, ``TIM1_CAPT``, ``TIM1_COMPA``, ``TIM1_COMPB``, ``TIM1_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``TIM0_OVF``, ``ANA_COMP``, ``ADC``, ``TWI_SLAVE``, ``SPI``, ``QTRIP``

``attiny416``, ``attiny417``, ``attiny816``, ``attiny817``
   ``CRCSCAN_NMI``, ``BOD_VLM``, ``PORTA_PORT``, ``PORTB_PORT``, ``PORTC_PORT``, ``RTC_CNT``, ``RTC_PIT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCOMP``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``NVMCTRL_EE``

``attiny43u``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``WDT``, ``TIM1_COMPA``, ``TIM1_COMPB``, ``TIM1_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``TIM0_OVF``, ``ANA_COMP``, ``ADC``, ``EE_RDY``, ``USI_START``, ``USI_OVF``

``attiny441``, ``attiny841``
   ``INT0``, ``PCINT0``, ``PCINT1``, ``WDT``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``ANA_COMP0``, ``ADC``, ``EE_RDY``, ``ANA_COMP1``, ``TIMER2_CAPT``, ``TIMER2_COMPA``, ``TIMER2_COMPB``, ``TIMER2_OVF``, ``SPI``, ``USART0_START``, ``USART0_RX``, ``USART0_UDRE``, ``USART0_TX``, ``USART1_START``, ``USART1_RX``, ``USART1_UDRE``, ``USART1_TX``, ``TWI_SLAVE``

``attiny44a``, ``attiny84a``
   ``EXT_INT0``, ``PCINT0``, ``PCINT1``, ``WATCHDOG``, ``TIM1_CAPT``, ``TIM1_COMPA``, ``TIM1_COMPB``, ``TIM1_OVF``, ``TIM0_COMPA``, ``TIM0_COMPB``, ``TIM0_OVF``, ``ANA_COMP``, ``ADC``, ``EE_RDY``, ``USI_STR``, ``USI_OVF``

``attiny48``, ``attiny88``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``PCINT3``, ``WDT``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``ADC``, ``EE_READY``, ``ANALOG_COMP``, ``TWI``

``attiny828``
   ``INT0``, ``INT1``, ``PCINT0``, ``PCINT1``, ``PCINT2``, ``PCINT3``, ``WDT``, ``TIMER1_CAPT``, ``TIMER1_COMPA``, ``TIMER1_COMPB``, ``TIMER1_OVF``, ``TIMER0_COMPA``, ``TIMER0_COMPB``, ``TIMER0_OVF``, ``SPI_STC``, ``USART_START``, ``USART_RX``, ``USART_UDRE``, ``USART_TX``, ``ADC``, ``EE_READY``, ``ANALOG_COMP``, ``TWI_SLAVE``, ``QTRIP``

``atxmega128a1``, ``atxmega64a1``
   ``OSC_XOSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``DMA_CH2``, ``DMA_CH3``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``ADCB_CH1``, ``ADCB_CH2``, ``ADCB_CH3``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``TCE1_OVF``, ``TCE1_ERR``, ``TCE1_CCA``, ``TCE1_CCB``, ``SPIE_INT``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``USARTE1_RXC``, ``USARTE1_DRE``, ``USARTE1_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``ADCA_CH1``, ``ADCA_CH2``, ``ADCA_CH3``, ``TWID_TWIS``, ``TWID_TWIM``, ``TCD0_OVF``, ``TCD0_ERR``, ``TCD0_CCA``, ``TCD0_CCB``, ``TCD0_CCC``, ``TCD0_CCD``, ``TCD1_OVF``, ``TCD1_ERR``, ``TCD1_CCA``, ``TCD1_CCB``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USARTD1_RXC``, ``USARTD1_DRE``, ``USARTD1_TXC``, ``PORTQ_INT0``, ``PORTQ_INT1``, ``PORTH_INT0``, ``PORTH_INT1``, ``PORTJ_INT0``, ``PORTJ_INT1``, ``PORTK_INT0``, ``PORTK_INT1``, ``PORTF_INT0``, ``PORTF_INT1``, ``TWIF_TWIS``, ``TWIF_TWIM``, ``TCF0_OVF``, ``TCF0_ERR``, ``TCF0_CCA``, ``TCF0_CCB``, ``TCF0_CCC``, ``TCF0_CCD``, ``TCF1_OVF``, ``TCF1_ERR``, ``TCF1_CCA``, ``TCF1_CCB``, ``SPIF_INT``, ``USARTF0_RXC``, ``USARTF0_DRE``, ``USARTF0_TXC``, ``USARTF1_RXC``, ``USARTF1_DRE``, ``USARTF1_TXC``

``atxmega128a1u``, ``atxmega64a1u``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``DMA_CH2``, ``DMA_CH3``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``ADCB_CH1``, ``ADCB_CH2``, ``ADCB_CH3``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``TCE1_OVF``, ``TCE1_ERR``, ``TCE1_CCA``, ``TCE1_CCB``, ``SPIE_INT``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``USARTE1_RXC``, ``USARTE1_DRE``, ``USARTE1_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``ADCA_CH1``, ``ADCA_CH2``, ``ADCA_CH3``, ``TWID_TWIS``, ``TWID_TWIM``, ``TCD0_OVF``, ``TCD0_ERR``, ``TCD0_CCA``, ``TCD0_CCB``, ``TCD0_CCC``, ``TCD0_CCD``, ``TCD1_OVF``, ``TCD1_ERR``, ``TCD1_CCA``, ``TCD1_CCB``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USARTD1_RXC``, ``USARTD1_DRE``, ``USARTD1_TXC``, ``PORTQ_INT0``, ``PORTQ_INT1``, ``PORTH_INT0``, ``PORTH_INT1``, ``PORTJ_INT0``, ``PORTJ_INT1``, ``PORTK_INT0``, ``PORTK_INT1``, ``PORTF_INT0``, ``PORTF_INT1``, ``TWIF_TWIS``, ``TWIF_TWIM``, ``TCF0_OVF``, ``TCF0_ERR``, ``TCF0_CCA``, ``TCF0_CCB``, ``TCF0_CCC``, ``TCF0_CCD``, ``TCF1_OVF``, ``TCF1_ERR``, ``TCF1_CCA``, ``TCF1_CCB``, ``SPIF_INT``, ``USARTF0_RXC``, ``USARTF0_DRE``, ``USARTF0_TXC``, ``USARTF1_RXC``, ``USARTF1_DRE``, ``USARTF1_TXC``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``

``atxmega128a3``, ``atxmega192a3``, ``atxmega256a3``, ``atxmega64a3``
   ``OSC_XOSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``DMA_CH2``, ``DMA_CH3``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``ADCB_CH1``, ``ADCB_CH2``, ``ADCB_CH3``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``TCE1_OVF``, ``TCE1_ERR``, ``TCE1_CCA``, ``TCE1_CCB``, ``SPIE_INT``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``USARTE1_RXC``, ``USARTE1_DRE``, ``USARTE1_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``ADCA_CH1``, ``ADCA_CH2``, ``ADCA_CH3``, ``TCD0_OVF``, ``TCD0_ERR``, ``TCD0_CCA``, ``TCD0_CCB``, ``TCD0_CCC``, ``TCD0_CCD``, ``TCD1_OVF``, ``TCD1_ERR``, ``TCD1_CCA``, ``TCD1_CCB``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USARTD1_RXC``, ``USARTD1_DRE``, ``USARTD1_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF``, ``TCF0_ERR``, ``TCF0_CCA``, ``TCF0_CCB``, ``TCF0_CCC``, ``TCF0_CCD``, ``USARTF0_RXC``, ``USARTF0_DRE``, ``USARTF0_TXC``

``atxmega128a3u``, ``atxmega192a3u``, ``atxmega256a3u``, ``atxmega64a3u``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``DMA_CH2``, ``DMA_CH3``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``ADCB_CH1``, ``ADCB_CH2``, ``ADCB_CH3``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF / TCE2_LUNF``, ``TCE0_ERR / TCE2_HUNF``, ``TCE0_CCA / TCE2_LCMPA``, ``TCE0_CCB / TCE2_LCMPB``, ``TCE0_CCC / TCE2_LCMPC``, ``TCE0_CCD / TCE2_LCMPD``, ``TCE1_OVF``, ``TCE1_ERR``, ``TCE1_CCA``, ``TCE1_CCB``, ``SPIE_INT``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``USARTE1_RXC``, ``USARTE1_DRE``, ``USARTE1_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``ADCA_CH1``, ``ADCA_CH2``, ``ADCA_CH3``, ``TCD0_OVF / TCD2_LUNF``, ``TCD0_ERR / TCD2_HUNF``, ``TCD0_CCA / TCD2_LCMPA``, ``TCD0_CCB / TCD2_LCMPB``, ``TCD0_CCC / TCD2_LCMPC``, ``TCD0_CCD / TCD2_LCMPD``, ``TCD1_OVF``, ``TCD1_ERR``, ``TCD1_CCA``, ``TCD1_CCB``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USARTD1_RXC``, ``USARTD1_DRE``, ``USARTD1_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF / TCF2_LUNF``, ``TCF0_ERR / TCF2_HUNF``, ``TCF0_CCA / TCF2_LCMPA``, ``TCF0_CCB / TCF2_LCMPB``, ``TCF0_CCC / TCF2_LCMPC``, ``TCF0_CCD / TCF2_LCMPD``, ``USARTF0_RXC``, ``USARTF0_DRE``, ``USARTF0_TXC``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``

``atxmega128a4u``, ``atxmega16a4u``, ``atxmega32a4u``, ``atxmega64a4u``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``DMA_CH2``, ``DMA_CH3``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``ADCA_CH1``, ``ADCA_CH2``, ``ADCA_CH3``, ``TCD0_OVF / TCD2_LUNF``, ``TCD0_ERR / TCD2_HUNF``, ``TCD0_CCA / TCD2_LCMPA``, ``TCD0_CCB / TCD2_LCMPB``, ``TCD0_CCC / TCD2_LCMPC``, ``TCD0_CCD / TCD2_LCMPD``, ``TCD1_OVF``, ``TCD1_ERR``, ``TCD1_CCA``, ``TCD1_CCB``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USARTD1_RXC``, ``USARTD1_DRE``, ``USARTD1_TXC``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``

``atxmega128b1``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``, ``LCD_INT``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTG_INT0``, ``PORTG_INT1``, ``PORTM_INT0``, ``PORTM_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TCE0_OVF / TCE2_LUNF``, ``TCE0_ERR / TCE2_HUNF``, ``TCE0_CCA / TCE2_LCMPA``, ``TCE0_CCB / TCE2_LCMPB``, ``TCE0_CCC / TCE2_LCMPC``, ``TCE0_CCD / TCE2_LCMPD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``

``atxmega128b3``, ``atxmega64b3``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``, ``LCD_INT``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTG_INT0``, ``PORTG_INT1``, ``PORTM_INT0``, ``PORTM_INT1``

``atxmega128c3``, ``atxmega192c3``, ``atxmega256c3``, ``atxmega32c3``, ``atxmega64c3``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF / TCE2_LUNF``, ``TCE0_ERR / TCE2_HUNF``, ``TCE0_CCA / TCE2_LCMPA``, ``TCE0_CCB / TCE2_LCMPB``, ``TCE0_CCC / TCE2_LCMPC``, ``TCE0_CCD / TCE2_LCMPD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``TCD0_OVF / TCD2_LUNF``, ``TCD0_ERR / TCD2_HUNF``, ``TCD0_CCA / TCD2_LCMPA``, ``TCD0_CCB / TCD2_LCMPB``, ``TCD0_CCC / TCD2_LCMPC``, ``TCD0_CCD / TCD2_LCMPD``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF / TCF2_LUNF``, ``TCF0_ERR / TCF2_HUNF``, ``TCF0_CCA / TCF2_LCMPA``, ``TCF0_CCB / TCF2_LCMPB``, ``TCF0_CCC / TCF2_LCMPC``, ``TCF0_CCD / TCF2_LCMPD``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``

``atxmega128d3``, ``atxmega192d3``, ``atxmega256d3``, ``atxmega64d3``
   ``OSC_XOSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``TCD0_OVF``, ``TCD0_ERR``, ``TCD0_CCA``, ``TCD0_CCB``, ``TCD0_CCC``, ``TCD0_CCD``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF``, ``TCF0_ERR``, ``TCF0_CCA``, ``TCF0_CCB``, ``TCF0_CCC``, ``TCF0_CCD``

``atxmega128d4``, ``atxmega64d4``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``TCD0_OVF / TCD2_LUNF``, ``TCD0_ERR / TCD2_HUNF``, ``TCD0_CCA / TCD2_LCMPA``, ``TCD0_CCB / TCD2_LCMPB``, ``TCD0_CCC / TCD2_LCMPC``, ``TCD0_CCD / TCD2_LCMPD``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``

``atxmega16a4``, ``atxmega32a4``
   ``OSC_XOSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``DMA_CH2``, ``DMA_CH3``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``TCE1_OVF``, ``TCE1_ERR``, ``TCE1_CCA``, ``TCE1_CCB``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``ADCA_CH1``, ``ADCA_CH2``, ``ADCA_CH3``, ``TCD0_OVF``, ``TCD0_ERR``, ``TCD0_CCA``, ``TCD0_CCB``, ``TCD0_CCC``, ``TCD0_CCD``, ``TCD1_OVF``, ``TCD1_ERR``, ``TCD1_CCA``, ``TCD1_CCB``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USARTD1_RXC``, ``USARTD1_DRE``, ``USARTD1_TXC``

``atxmega16c4``, ``atxmega32c4``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``TCD0_OVF / TCD2_LUNF``, ``TCD0_ERR / TCD2_HUNF``, ``TCD0_CCA / TCD2_LCMPA``, ``TCD0_CCB / TCD2_LCMPB``, ``TCD0_CCC / TCD2_LCMPC``, ``TCD0_CCD / TCD2_LCMPD``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``

``atxmega16d4``, ``atxmega32d4``
   ``OSC_XOSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``TCD0_OVF``, ``TCD0_ERR``, ``TCD0_CCA``, ``TCD0_CCB``, ``TCD0_CCC``, ``TCD0_CCD``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``

``atxmega256a3b``
   ``OSC_XOSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``DMA_CH2``, ``DMA_CH3``, ``RTC32_OVF``, ``RTC32_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``ADCB_CH1``, ``ADCB_CH2``, ``ADCB_CH3``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``TCE1_OVF``, ``TCE1_ERR``, ``TCE1_CCA``, ``TCE1_CCB``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``ADCA_CH1``, ``ADCA_CH2``, ``ADCA_CH3``, ``TCD0_OVF``, ``TCD0_ERR``, ``TCD0_CCA``, ``TCD0_CCB``, ``TCD0_CCC``, ``TCD0_CCD``, ``TCD1_OVF``, ``TCD1_ERR``, ``TCD1_CCA``, ``TCD1_CCB``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USARTD1_RXC``, ``USARTD1_DRE``, ``USARTD1_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF``, ``TCF0_ERR``, ``TCF0_CCA``, ``TCF0_CCB``, ``TCF0_CCC``, ``TCF0_CCD``, ``USARTF0_RXC``, ``USARTF0_DRE``, ``USARTF0_TXC``

``atxmega256a3bu``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``DMA_CH2``, ``DMA_CH3``, ``RTC32_OVF``, ``RTC32_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``ADCB_CH1``, ``ADCB_CH2``, ``ADCB_CH3``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF / TCE2_LUNF``, ``TCE0_ERR / TCE2_HUNF``, ``TCE0_CCA / TCE2_LCMPA``, ``TCE0_CCB / TCE2_LCMPB``, ``TCE0_CCC / TCE2_LCMPC``, ``TCE0_CCD / TCE2_LCMPD``, ``TCE1_OVF``, ``TCE1_ERR``, ``TCE1_CCA``, ``TCE1_CCB``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``ADCA_CH1``, ``ADCA_CH2``, ``ADCA_CH3``, ``TCD0_OVF / TCD2_LUNF``, ``TCD0_ERR / TCD2_HUNF``, ``TCD0_CCA / TCD2_LCMPA``, ``TCD0_CCB / TCD2_LCMPB``, ``TCD0_CCC / TCD2_LCMPC``, ``TCD0_CCD / TCD2_LCMPD``, ``TCD1_OVF``, ``TCD1_ERR``, ``TCD1_CCA``, ``TCD1_CCB``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``USARTD1_RXC``, ``USARTD1_DRE``, ``USARTD1_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF / TCF2_LUNF``, ``TCF0_ERR / TCF2_HUNF``, ``TCF0_CCA / TCF2_LCMPA``, ``TCF0_CCB / TCF2_LCMPB``, ``TCF0_CCC / TCF2_LCMPC``, ``TCF0_CCD / TCF2_LCMPD``, ``USARTF0_RXC``, ``USARTF0_DRE``, ``USARTF0_TXC``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``

``atxmega32d3``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``TCD0_OVF``, ``TCD0_ERR``, ``TCD0_CCA``, ``TCD0_CCB``, ``TCD0_CCC``, ``TCD0_CCD``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF``, ``TCF0_ERR``, ``TCF0_CCA``, ``TCF0_CCB``, ``TCF0_CCC``, ``TCF0_CCD``

``atxmega32e5``, ``atxmega8e5``
   ``OSC_OSCF``, ``PORTR_INT``, ``EDMA_CH0``, ``EDMA_CH1``, ``EDMA_CH2``, ``EDMA_CH3``, ``RTC_OVF``, ``RTC_COMP``, ``PORTC_INT``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC4_OVF``, ``TCC4_ERR``, ``TCC4_CCA``, ``TCC4_CCB``, ``TCC4_CCC``, ``TCC4_CCD``, ``TCC5_OVF``, ``TCC5_ERR``, ``TCC5_CCA``, ``TCC5_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``NVM_EE``, ``NVM_SPM``, ``XCL_UNF``, ``XCL_CC``, ``PORTA_INT``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``PORTD_INT``, ``TCD5_OVF``, ``TCD5_ERR``, ``TCD5_CCA``, ``TCD5_CCB``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``

``atxmega384c3``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USARTC1_RXC``, ``USARTC1_DRE``, ``USARTC1_TXC``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF / TCE2_LUNF``, ``TCE0_ERR / TCE2_HUNF``, ``TCE0_CCA / TCE2_LCMPA``, ``TCE0_CCB / TCE2_LCMPB``, ``TCE0_CCC / TCE2_LCMPC``, ``TCE0_CCD / TCE2_LCMPD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``TCD0_OVF / TCD2_LUNF``, ``TCD0_ERR / TCD2_HUNF``, ``TCD0_CCA / TCD2_LCMPA``, ``TCD0_CCB / TCD2_LCMPB``, ``TCD0_CCC / TCD2_LCMPC``, ``TCD0_CCD / TCD2_LCMPD``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF / TCF2_LUNF``, ``TCF0_ERR / TCF2_HUNF``, ``TCF0_CCA / TCF2_LCMPA``, ``TCF0_CCB / TCF2_LCMPB``, ``TCF0_CCC / TCF2_LCMPC``, ``TCF0_CCD / TCF2_LCMPD``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``

``atxmega384d3``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF / TCC2_LUNF``, ``TCC0_ERR / TCC2_HUNF``, ``TCC0_CCA / TCC2_LCMPA``, ``TCC0_CCB / TCC2_LCMPB``, ``TCC0_CCC / TCC2_LCMPC``, ``TCC0_CCD / TCC2_LCMPD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TWIE_TWIS``, ``TWIE_TWIM``, ``TCE0_OVF / TCE2_LUNF``, ``TCE0_ERR / TCE2_HUNF``, ``TCE0_CCA / TCE2_LCMPA``, ``TCE0_CCB / TCE2_LCMPB``, ``TCE0_CCC / TCE2_LCMPC``, ``TCE0_CCD / TCE2_LCMPD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``, ``TCD0_OVF / TCD2_LUNF``, ``TCD0_ERR / TCD2_HUNF``, ``TCD0_CCA / TCD2_LCMPA``, ``TCD0_CCB / TCD2_LCMPB``, ``TCD0_CCC / TCD2_LCMPC``, ``TCD0_CCD / TCD2_LCMPD``, ``SPID_INT``, ``USARTD0_RXC``, ``USARTD0_DRE``, ``USARTD0_TXC``, ``PORTF_INT0``, ``PORTF_INT1``, ``TCF0_OVF / TCF2_LUNF``, ``TCF0_ERR / TCF2_HUNF``, ``TCF0_CCA / TCF2_LCMPA``, ``TCF0_CCB / TCF2_LCMPB``, ``TCF0_CCC / TCF2_LCMPC``, ``TCF0_CCD / TCF2_LCMPD``

``atxmega64b1``
   ``OSC_OSCF``, ``PORTC_INT0``, ``PORTC_INT1``, ``PORTR_INT0``, ``PORTR_INT1``, ``DMA_CH0``, ``DMA_CH1``, ``RTC_OVF``, ``RTC_COMP``, ``TWIC_TWIS``, ``TWIC_TWIM``, ``TCC0_OVF``, ``TCC0_ERR``, ``TCC0_CCA``, ``TCC0_CCB``, ``TCC0_CCC``, ``TCC0_CCD``, ``TCC1_OVF``, ``TCC1_ERR``, ``TCC1_CCA``, ``TCC1_CCB``, ``SPIC_INT``, ``USARTC0_RXC``, ``USARTC0_DRE``, ``USARTC0_TXC``, ``USB_BUSEVENT``, ``USB_TRNCOMPL``, ``LCD_INT``, ``AES_INT``, ``NVM_EE``, ``NVM_SPM``, ``PORTB_INT0``, ``PORTB_INT1``, ``ACB_AC0``, ``ACB_AC1``, ``ACB_ACW``, ``ADCB_CH0``, ``PORTD_INT0``, ``PORTD_INT1``, ``PORTG_INT0``, ``PORTG_INT1``, ``PORTM_INT0``, ``PORTM_INT1``, ``PORTE_INT0``, ``PORTE_INT1``, ``TCE0_OVF``, ``TCE0_ERR``, ``TCE0_CCA``, ``TCE0_CCB``, ``TCE0_CCC``, ``TCE0_CCD``, ``USARTE0_RXC``, ``USARTE0_DRE``, ``USARTE0_TXC``, ``PORTA_INT0``, ``PORTA_INT1``, ``ACA_AC0``, ``ACA_AC1``, ``ACA_ACW``, ``ADCA_CH0``

``avr128da28``, ``avr32da28``, ``avr64da28``
   ``NMI``, ``BOD_VLM``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD0_ZCD``, ``PTC_PTC``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``SPI1_INT``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``AC2_AC``

``avr128da32``, ``avr32da32``, ``avr64da32``
   ``NMI``, ``BOD_VLM``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD0_ZCD``, ``PTC_PTC``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``SPI1_INT``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``AC2_AC``, ``TWI1_TWIS``, ``TWI1_TWIM``

``avr128da48``, ``avr32da48``, ``avr64da48``
   ``NMI``, ``BOD_VLM``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD0_ZCD``, ``PTC_PTC``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``SPI1_INT``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``AC2_AC``, ``TCB3_INT``, ``TWI1_TWIS``, ``TWI1_TWIM``, ``PORTB_PORT``, ``PORTE_PORT``, ``TCA1_LUNF / TCA1_OVF``, ``TCA1_HUNF``, ``TCA1_CMP0 / TCA1_LCMP0``, ``TCA1_CMP1 / TCA1_LCMP1``, ``TCA1_CMP2 / TCA1_LCMP2``, ``ZCD1_ZCD``, ``USART3_RXC``, ``USART3_DRE``, ``USART3_TXC``, ``USART4_RXC``, ``USART4_DRE``, ``USART4_TXC``

``avr128da64``, ``avr64da64``
   ``NMI``, ``BOD_VLM``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD0_ZCD``, ``PTC_PTC``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``SPI1_INT``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``AC2_AC``, ``TCB3_INT``, ``TWI1_TWIS``, ``TWI1_TWIM``, ``PORTB_PORT``, ``PORTE_PORT``, ``TCA1_LUNF / TCA1_OVF``, ``TCA1_HUNF``, ``TCA1_CMP0 / TCA1_LCMP0``, ``TCA1_CMP1 / TCA1_LCMP1``, ``TCA1_CMP2 / TCA1_LCMP2``, ``ZCD1_ZCD``, ``USART3_RXC``, ``USART3_DRE``, ``USART3_TXC``, ``USART4_RXC``, ``USART4_DRE``, ``USART4_TXC``, ``PORTG_PORT``, ``ZCD2_ZCD``, ``TCB4_INT``, ``USART5_RXC``, ``USART5_DRE``, ``USART5_TXC``

``avr128db28``, ``avr32db28``, ``avr64db28``
   ``NMI``, ``BOD_VLM``, ``CLKCTRL_CFD``, ``MVIO_MVIO``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD0_ZCD``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``SPI1_INT``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``AC2_AC``

``avr128db32``, ``avr32db32``, ``avr64db32``
   ``NMI``, ``BOD_VLM``, ``CLKCTRL_CFD``, ``MVIO_MVIO``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD0_ZCD``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``SPI1_INT``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``AC2_AC``, ``TWI1_TWIS``, ``TWI1_TWIM``

``avr128db48``, ``avr32db48``, ``avr64db48``
   ``NMI``, ``BOD_VLM``, ``CLKCTRL_CFD``, ``MVIO_MVIO``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD0_ZCD``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``SPI1_INT``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``AC2_AC``, ``TWI1_TWIS``, ``TWI1_TWIM``, ``TCB3_INT``, ``PORTB_PORT``, ``PORTE_PORT``, ``TCA1_LUNF / TCA1_OVF``, ``TCA1_HUNF``, ``TCA1_CMP0 / TCA1_LCMP0``, ``TCA1_CMP1 / TCA1_LCMP1``, ``TCA1_CMP2 / TCA1_LCMP2``, ``ZCD1_ZCD``, ``USART3_RXC``, ``USART3_DRE``, ``USART3_TXC``, ``USART4_RXC``, ``USART4_DRE``, ``USART4_TXC``, ``ZCD2_ZCD``

``avr128db64``, ``avr64db64``
   ``NMI``, ``BOD_VLM``, ``CLKCTRL_CFD``, ``MVIO_MVIO``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD0_ZCD``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``, ``SPI1_INT``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``AC2_AC``, ``TWI1_TWIS``, ``TWI1_TWIM``, ``TCB3_INT``, ``PORTB_PORT``, ``PORTE_PORT``, ``TCA1_LUNF / TCA1_OVF``, ``TCA1_HUNF``, ``TCA1_CMP0 / TCA1_LCMP0``, ``TCA1_CMP1 / TCA1_LCMP1``, ``TCA1_CMP2 / TCA1_LCMP2``, ``ZCD1_ZCD``, ``USART3_RXC``, ``USART3_DRE``, ``USART3_TXC``, ``USART4_RXC``, ``USART4_DRE``, ``USART4_TXC``, ``PORTG_PORT``, ``ZCD2_ZCD``, ``TCB4_INT``, ``USART5_RXC``, ``USART5_DRE``, ``USART5_TXC``

``avr16dd14``, ``avr16dd20``, ``avr16dd28``, ``avr16dd32``, ``avr32dd14``, ``avr32dd20``, ``avr32dd28``, ``avr32dd32``, ``avr64dd14``, ``avr64dd20``, ``avr64dd28``, ``avr64dd32``
   ``NMI``, ``BOD_VLM``, ``CLKCTRL_CFD``, ``MVIO_MVIO``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TCD0_OVF``, ``TCD0_TRIG``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_RESRDY``, ``ADC0_WCMP``, ``ZCD3_ZCD``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EE``

``avr16ea28``, ``avr16ea32``, ``avr32ea28``, ``avr32ea32``, ``avr64ea28``, ``avr64ea32``
   ``NMI``, ``BOD_VLM``, ``CLKCTRL_CFD``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_ERROR``, ``ADC0_RESRDY``, ``ADC0_SAMPRDY``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EEREADY / NVMCTRL_FLREADY / NVMCTRL_NVMREADY``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``

``avr16ea48``, ``avr32ea48``, ``avr64ea48``
   ``NMI``, ``BOD_VLM``, ``CLKCTRL_CFD``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TCB1_INT``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``AC0_AC``, ``ADC0_ERROR``, ``ADC0_RESRDY``, ``ADC0_SAMPRDY``, ``AC1_AC``, ``PORTC_PORT``, ``TCB2_INT``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``PORTF_PORT``, ``NVMCTRL_EEREADY / NVMCTRL_FLREADY / NVMCTRL_NVMREADY``, ``USART2_RXC``, ``USART2_DRE``, ``USART2_TXC``, ``TCB3_INT``, ``TCA1_LUNF / TCA1_OVF``, ``TCA1_HUNF``, ``TCA1_CMP0 / TCA1_LCMP0``, ``TCA1_CMP1 / TCA1_LCMP1``, ``TCA1_CMP2 / TCA1_LCMP2``, ``PORTE_PORT``, ``PORTB_PORT``

``avr16eb14``, ``avr16eb20``, ``avr16eb28``, ``avr16eb32``
   ``NMI``, ``BOD_VLM``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``PORTA_PORT``, ``WEX0_FAULTDET / WEX0_FDFEVA / WEX0_FDFEVB / WEX0_FDFEVC``, ``TCE0_OVF``, ``TCE0_CMP0``, ``TCE0_CMP1``, ``TCE0_CMP2``, ``TCE0_CMP3``, ``TCB0_INT``, ``TCB1_INT``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``TCF0_INT``, ``AC0_AC``, ``ADC0_ERROR``, ``ADC0_RESRDY``, ``ADC0_SAMPRDY``, ``AC1_AC``, ``PORTC_PORT``, ``PORTF_PORT``, ``NVMCTRL_EEREADY / NVMCTRL_FLREADY / NVMCTRL_NVMREADY``

``avr64du28``, ``avr64du32``
   ``NMI``, ``BOD_VLM``, ``CLKCTRL_CFD``, ``RTC_CNT``, ``RTC_PIT``, ``CCL_CCL``, ``USB0_BUSEVENT``, ``USB0_TRNCOMPL``, ``PORTA_PORT``, ``TCA0_LUNF / TCA0_OVF``, ``TCA0_HUNF``, ``TCA0_CMP0 / TCA0_LCMP0``, ``TCA0_CMP1 / TCA0_LCMP1``, ``TCA0_CMP2 / TCA0_LCMP2``, ``TCB0_INT``, ``TWI0_TWIS``, ``TWI0_TWIM``, ``SPI0_INT``, ``USART0_RXC``, ``USART0_DRE``, ``USART0_TXC``, ``PORTD_PORT``, ``PORTC_PORT``, ``PORTF_PORT``, ``NVMCTRL_NVMREADY``, ``USART1_RXC``, ``USART1_DRE``, ``USART1_TXC``, ``TCB1_INT``, ``AC0_AC``, ``ADC0_ERROR``, ``ADC0_RESRDY``, ``ADC0_SAMPRDY``
