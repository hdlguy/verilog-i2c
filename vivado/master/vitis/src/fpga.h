
// Registers of the i2c_master_axil core.
#define     I2C_MASTER_STATUS   0
#define     I2C_MASTER_COMMAND  1
#define     I2C_MASTER_DATA     2
#define     I2C_MASTER_PRESCALE 3


// I2C 7-bit Addresses
#define     I2C_MAG             0x1E	// LIS2MDLTR
#define     I2C_GYRO            0x6A	// ISM330DHCXTR
#define     I2C_HUMIDITY        0x44	// SHT35-DIS-F2.5KS
#define     I2C_RTC             0x6F	// MCP7940M-I/MS
#define     I2C_EEPROM          0x50	// AT24CM02-SSHM-B
#define		I2C_DIGIPOT			0x18	// AD5259BRMZ5


// I2C bit fields
#define		I2C_STATUS_BUSY		0x00000001
#define 	I2C_STATUS_MISS_ACK 0x00000008

#define		I2C_COMMAND_WR_MULT	0x00000800
#define		I2C_COMMAND_STOP	0x00001000
#define		I2C_COMMAND_READ	0x00000200

#define		I2C_DATA_LAST		0x00000200
#define		I2C_DATA_VALID		0x00000100

