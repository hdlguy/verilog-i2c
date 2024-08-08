
#include "xparameters.h"
#include "xil_printf.h"
#include "fpga.h"

int i2c_write(uint32_t* ptr, uint8_t addr, uint8_t* buf, int num) {
	
	for (int i=0; i<(num-1); i++) {
		ptr[I2C_MASTER_DATA] = buf[i];
	}
	ptr[I2C_MASTER_DATA] = buf[num-1] | I2C_DATA_LAST;	
	
    ptr[I2C_MASTER_COMMAND] = addr | I2C_COMMAND_WR_MULT;     
    
    while(ptr[I2C_MASTER_STATUS] & I2C_STATUS_BUSY);  // wait until i2c core not busy
    
//    ptr[I2C_MASTER_COMMAND] = addr | I2C_COMMAND_STOP;

//    xil_printf("I2C_MASTER_STATUS =   0x%08x\n\r", ptr[I2C_MASTER_STATUS]);

    if(ptr[I2C_MASTER_STATUS] & I2C_STATUS_MISS_ACK) {
    	ptr[I2C_MASTER_STATUS] = 0xffffffff;  // clear status flags
    	return(1);
    } else {
    	ptr[I2C_MASTER_STATUS] = 0xffffffff;  // clear status flags
    	return(0);
    }
}


int i2c_read(uint32_t* ptr, uint8_t addr, uint8_t* buf, int num) {

    ptr[I2C_MASTER_COMMAND] = addr | I2C_COMMAND_READ;    
	
}


int main()
{
	int status;
	
    xil_printf("\n\rI2C Test\n\r");
    
    uint32_t* i2c_base = (uint32_t *)XPAR_M00_BASEADDR; // verilog-i2c wired to axi bus M00
    
    uint8_t wr_buf[10], rd_buf[10];

    i2c_base[I2C_MASTER_PRESCALE] = 63; // 250 =100Khz operation, 63 = 400KHz
    
    xil_printf("I2C_MASTER_STATUS =   0x%08x\n\r", i2c_base[I2C_MASTER_STATUS]);
    xil_printf("I2C_MASTER_COMMAND =  0x%08x\n\r", i2c_base[I2C_MASTER_COMMAND]);
    xil_printf("I2C_MASTER_DATA =     0x%08x\n\r", i2c_base[I2C_MASTER_DATA]);
    xil_printf("I2C_MASTER_PRESCALE = 0x%08x\n\r", i2c_base[I2C_MASTER_PRESCALE]);
    
    
//    wr_buf[0] = 0x30; wr_buf[1] = 0x41;    
//    status = i2c_write(i2c_base, I2C_HUMIDITY, wr_buf, 2);
//    xil_printf("status = 0x%08x\n\r", status);
    
    
    wr_buf[0] = 0xF3; wr_buf[1] = 0x2D;  
    status = i2c_write(i2c_base, I2C_HUMIDITY, wr_buf, 2);
    xil_printf("status = 0x%08x\n\r", status);
    

    i2c_read(i2c_base, I2C_HUMIDITY, rd_buf, 2);

    
    xil_printf("test complete\n\r");

    return 0;
}
