
#include "xparameters.h"
#include "xil_printf.h"


int main()
{

    xil_printf("\n\rHello World\n\r");
    for(int j=0;;j++) {
    	xil_printf("%08d: Hello\n\r", j);
    	for (int i=0; i<10000000; i++);
    }

    return 0;
}
