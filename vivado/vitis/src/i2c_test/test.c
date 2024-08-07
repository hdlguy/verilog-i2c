
#include "xparameters.h"
#include "xil_printf.h"
#include "fpga.h"

int i2c_write(uint8_t addr, uint8_t* buf, int num) {
	
	return(0);
}

int main()
{

    xil_printf("\n\rI2C Test\n\r");
    
    uint32_t* i2c_base = (uint32_t *)XPAR_M00_BASEADDR;
    uint8_t wr_buf[100], rd_buf[100];

    i2c_base[I2C_MASTER_PRESCALE] = 250; // 100Khz operation
    
    xil_printf("I2C_MASTER_STATUS =   0x%08x\n\r", i2c_base[I2C_MASTER_STATUS]);
    xil_printf("I2C_MASTER_COMMAND =  0x%08x\n\r", i2c_base[I2C_MASTER_COMMAND]);
    xil_printf("I2C_MASTER_DATA =     0x%08x\n\r", i2c_base[I2C_MASTER_DATA]);
    xil_printf("I2C_MASTER_PRESCALE = 0x%08x\n\r", i2c_base[I2C_MASTER_PRESCALE]);

    return 0;
}
