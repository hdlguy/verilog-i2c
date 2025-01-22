#

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 6 [current_design]
set_property BITSTREAM.Config.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

create_clock -period 10.000 -name clk100 -waveform {0.000 5.000} [get_ports {clkin100}]

set_property IOSTANDARD LVCMOS25    [get_ports {clkin100}]; # Vadj is 2.5V
set_property PACKAGE_PIN F4         [get_ports {clkin100}]

set_property IOSTANDARD LVCMOS33    [get_ports {usb_uart_*}]
set_property PACKAGE_PIN A18        [get_ports {usb_uart_rxd}]
set_property PACKAGE_PIN B18        [get_ports {usb_uart_txd}]


set_property IOSTANDARD LVCMOS33    [get_ports {led_*}]
set_property PACKAGE_PIN V11        [get_ports {led_blue}]
set_property PACKAGE_PIN V10        [get_ports {led_green}]
set_property PACKAGE_PIN T11        [get_ports {led_yellow}]
set_property PACKAGE_PIN  T9        [get_ports {led_red}]


set_property IOSTANDARD LVCMOS33    [get_ports {i2c_scl}]
set_property IOSTANDARD LVCMOS33    [get_ports {i2c_sda}]
set_property PACKAGE_PIN F16        [get_ports {i2c_scl}]
set_property PACKAGE_PIN D17        [get_ports {i2c_sda}]


########### timing constraints to shut up the compiler #############

set_max_delay -to [get_ports {led_*}]         15.555

set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {usb_uart_txd}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {usb_uart_txd}]

set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {i2c_scl}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {i2c_scl}]
set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {i2c_sda}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {i2c_sda}]


set_input_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {usb_uart_rxd}]
set_input_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {usb_uart_rxd}]

set_input_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {i2c_scl}]
set_input_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {i2c_scl}]
set_input_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {i2c_sda}]
set_input_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {i2c_sda}]






