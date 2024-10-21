#ifndef __UART_H__
#define __UART_H__

#include <avr/io.h>

class UART{
public:
    UART();
    {
        // Baund rate 9600
        
        UCRSRA = (1 << 1);

        // Frame 8N1 

        // Enable Tx

        // Enable Rx
    }
}
#endif