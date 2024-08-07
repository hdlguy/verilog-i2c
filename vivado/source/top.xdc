#

set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 2.5 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 6 [current_design]
set_property BITSTREAM.Config.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

create_clock -period 10.000 -name clk100 -waveform {0.000 5.000} [get_ports {clk100}]

# adc input timing constraints.
create_clock -period 6.666 -name dco1 -waveform {0.00 3.333} [get_ports {adc_dco_p[1]}]
create_clock -period 6.666 -name dco0 -waveform {0.00 3.333} [get_ports {adc_dco_p[0]}]
set ltc_maxdel 0.6
set ltc_mindel 0.0
set_input_delay -clock [get_clocks {dco1}] -min -add_delay $ltc_mindel [get_ports {adc_data_p[1][*]}]
set_input_delay -clock [get_clocks {dco1}] -max -add_delay $ltc_maxdel [get_ports {adc_data_p[1][*]}]
set_input_delay -clock [get_clocks {dco0}] -min -add_delay $ltc_mindel [get_ports {adc_data_p[0][*]}]
set_input_delay -clock [get_clocks {dco0}] -max -add_delay $ltc_maxdel [get_ports {adc_data_p[0][*]}]

#
set_property IOSTANDARD LVCMOS25    [get_ports {clk100}]; # Vadj is 2.5V
set_property PACKAGE_PIN F4         [get_ports {clk100}]

set_property IOSTANDARD LVCMOS33    [get_ports {usb_uart_*}]
set_property PACKAGE_PIN A18        [get_ports {usb_uart_rxd}]
set_property PACKAGE_PIN B18        [get_ports {usb_uart_txd}]


set_property IOSTANDARD LVCMOS33    [get_ports {led_*}]
set_property PACKAGE_PIN V11        [get_ports {led_blue}]
set_property PACKAGE_PIN V10        [get_ports {led_green}]
set_property PACKAGE_PIN T11        [get_ports {led_yellow}]
set_property PACKAGE_PIN  T9        [get_ports {led_red}]


set_property IOSTANDARD LVDS_25 [get_ports {adc_*}]
set_property DIFF_TERM  TRUE    [get_ports {adc_dco_*}]
set_property DIFF_TERM  TRUE    [get_ports {adc_data_*}]

set_property PACKAGE_PIN B1  [get_ports {adc_clk_p[1]}]
set_property PACKAGE_PIN A1  [get_ports {adc_clk_n[1]}]
set_property PACKAGE_PIN E7  [get_ports {adc_clk_p[0]}]
set_property PACKAGE_PIN D7  [get_ports {adc_clk_n[0]}]

set_property PACKAGE_PIN E2  [get_ports {adc_dco_p[1]}]
set_property PACKAGE_PIN D2  [get_ports {adc_dco_n[1]}]
set_property PACKAGE_PIN D5  [get_ports {adc_dco_p[0]}]
set_property PACKAGE_PIN D4  [get_ports {adc_dco_n[0]}]

set_property PACKAGE_PIN J3  [get_ports {adc_data_p[1][7]}]
set_property PACKAGE_PIN C4  [get_ports {adc_data_p[1][6]}]
set_property PACKAGE_PIN H2  [get_ports {adc_data_p[1][5]}]
set_property PACKAGE_PIN E6  [get_ports {adc_data_p[1][4]}]
set_property PACKAGE_PIN G4  [get_ports {adc_data_p[1][3]}]
set_property PACKAGE_PIN J4  [get_ports {adc_data_p[1][2]}]
set_property PACKAGE_PIN H6  [get_ports {adc_data_p[1][1]}]
set_property PACKAGE_PIN G6  [get_ports {adc_data_p[1][0]}]

set_property PACKAGE_PIN J2  [get_ports {adc_data_n[1][7]}]
set_property PACKAGE_PIN B4  [get_ports {adc_data_n[1][6]}]
set_property PACKAGE_PIN G2  [get_ports {adc_data_n[1][5]}]
set_property PACKAGE_PIN E5  [get_ports {adc_data_n[1][4]}]
set_property PACKAGE_PIN G3  [get_ports {adc_data_n[1][3]}]
set_property PACKAGE_PIN H4  [get_ports {adc_data_n[1][2]}]
set_property PACKAGE_PIN H5  [get_ports {adc_data_n[1][1]}]
set_property PACKAGE_PIN F6  [get_ports {adc_data_n[1][0]}]

set_property PACKAGE_PIN A6  [get_ports {adc_data_p[0][7]}]
set_property PACKAGE_PIN C6  [get_ports {adc_data_p[0][6]}]
set_property PACKAGE_PIN D8  [get_ports {adc_data_p[0][5]}]
set_property PACKAGE_PIN B7  [get_ports {adc_data_p[0][4]}]
set_property PACKAGE_PIN E3  [get_ports {adc_data_p[0][3]}]
set_property PACKAGE_PIN A4  [get_ports {adc_data_p[0][2]}]
set_property PACKAGE_PIN C2  [get_ports {adc_data_p[0][1]}]
set_property PACKAGE_PIN B3  [get_ports {adc_data_p[0][0]}]

set_property PACKAGE_PIN A5  [get_ports {adc_data_n[0][7]}]
set_property PACKAGE_PIN C5  [get_ports {adc_data_n[0][6]}]
set_property PACKAGE_PIN C7  [get_ports {adc_data_n[0][5]}]
set_property PACKAGE_PIN B6  [get_ports {adc_data_n[0][4]}]
set_property PACKAGE_PIN D3  [get_ports {adc_data_n[0][3]}]
set_property PACKAGE_PIN A3  [get_ports {adc_data_n[0][2]}]
set_property PACKAGE_PIN C1  [get_ports {adc_data_n[0][1]}]
set_property PACKAGE_PIN B2  [get_ports {adc_data_n[0][0]}]

set_property IOSTANDARD LVCMOS33 [get_ports {amc7823_*}]
set_property IOB TRUE            [get_ports {amc7823_*}]
set_property PACKAGE_PIN B13 [get_ports {amc7823_sck[0]}]
set_property PACKAGE_PIN D12 [get_ports {amc7823_csn[0]}]
set_property PACKAGE_PIN F13 [get_ports {amc7823_mosi[0]}]
set_property PACKAGE_PIN B11 [get_ports {amc7823_miso[0]}]

set_property PACKAGE_PIN F15 [get_ports {amc7823_sck[1]}]
set_property PACKAGE_PIN H14 [get_ports {amc7823_csn[1]}]
set_property PACKAGE_PIN E17 [get_ports {amc7823_mosi[1]}]
set_property PACKAGE_PIN T8  [get_ports {amc7823_miso[1]}]

set_property DRIVE 4            [get_ports [list amc7823_sck]]
set_property SLEW SLOW          [get_ports [list amc7823_sck]]
set_property DRIVE 4            [get_ports [list amc7823_csn]]
set_property SLEW SLOW          [get_ports [list amc7823_csn]]
set_property DRIVE 4            [get_ports [list amc7823_mosi]]
set_property SLEW SLOW          [get_ports [list amc7823_mosi]]

set_property IOSTANDARD LVCMOS33    [get_ports {tec_enable}]
set_property PACKAGE_PIN L15        [get_ports {tec_enable}]

set_property IOSTANDARD LVCMOS33    [get_ports {phase*}]
set_property PACKAGE_PIN E15        [get_ports {phase1}]
set_property PACKAGE_PIN K15        [get_ports {phase2}]
set_property PACKAGE_PIN A13        [get_ports {phase5}]
set_property PACKAGE_PIN E16        [get_ports {phase6}]

set_property IOSTANDARD LVCMOS33    [get_ports {laser_trigger}];
set_property IOB TRUE               [get_ports {laser_trigger}];
set_property PACKAGE_PIN M17        [get_ports {laser_trigger}];
set_property IOSTANDARD LVCMOS33    [get_ports {laser_run_req}];
set_property PACKAGE_PIN U11        [get_ports {laser_run_req}];
set_property IOSTANDARD LVCMOS33    [get_ports {laser_sync_in}];
set_property IOB TRUE               [get_ports {laser_sync_in}];
set_property PACKAGE_PIN H17        [get_ports {laser_sync_in}];

set_property IOSTANDARD LVCMOS33    [get_ports {scl}]
set_property IOSTANDARD LVCMOS33    [get_ports {sda}]
set_property PACKAGE_PIN F16        [get_ports {scl}]
set_property PACKAGE_PIN D17        [get_ports {sda}]

set_property IOSTANDARD LVCMOS33    [get_ports {lc_heater_pwm}]
set_property PACKAGE_PIN A16        [get_ports {lc_heater_pwm}]

set_property IOSTANDARD LVCMOS33    [get_ports {lc_*}]
set_property PACKAGE_PIN G14        [get_ports {lc_en}]
set_property IOB TRUE               [get_ports {lc_pol}]
set_property PACKAGE_PIN V12        [get_ports {lc_pol}]

set_property IOSTANDARD LVCMOS33    [get_ports {reset_em}]
set_property PACKAGE_PIN T10        [get_ports {reset_em}]
    
set_property IOSTANDARD LVCMOS33    [get_ports {photon_in[*]}]
set_property IOB TRUE               [get_ports {photon_in[*]}];
set_property PACKAGE_PIN V15        [get_ports {photon_in[1]}]
set_property PACKAGE_PIN M16        [get_ports {photon_in[2]}]

set_property IOSTANDARD LVCMOS33    [get_ports {fake_pulse}]
set_property IOB TRUE               [get_ports {fake_pulse}]
set_property PACKAGE_PIN U14        [get_ports {fake_pulse}]

set_property IOSTANDARD LVCMOS33    [get_ports {deck_heater_enable}]
set_property PACKAGE_PIN A14        [get_ports {deck_heater_enable}]

set_property IOSTANDARD LVCMOS33    [get_ports {fan_pwm[*]}]
set_property PACKAGE_PIN L18        [get_ports {fan_pwm[0]}]
set_property PACKAGE_PIN K13        [get_ports {fan_pwm[1]}]
set_property PACKAGE_PIN H16        [get_ports {fan_pwm[2]}]
set_property PACKAGE_PIN J14        [get_ports {fan_pwm[3]}]

set_property IOSTANDARD LVCMOS33    [get_ports {fan_tach[*]}]
set_property PACKAGE_PIN M18        [get_ports {fan_tach[0]}]
set_property PACKAGE_PIN J13        [get_ports {fan_tach[1]}]
set_property PACKAGE_PIN G16        [get_ports {fan_tach[2]}]
set_property PACKAGE_PIN H15        [get_ports {fan_tach[3]}]

set_property IOSTANDARD LVCMOS33    [get_ports {tft_*}]
set_property PACKAGE_PIN B16        [get_ports {tft_spi4w}]; # sd-d0
set_property PACKAGE_PIN B17        [get_ports {tft_cs_n}]; # sd-d1
set_property PACKAGE_PIN D14        [get_ports {tft_reset}]; # sd-d2
set_property PACKAGE_PIN C14        [get_ports {tft_wr}]; # sd-d3
set_property PACKAGE_PIN C16        [get_ports {tft_rs}]; # sd-clk
set_property PACKAGE_PIN C17        [get_ports {tft_d0}]; # sd-cmd

set_property IOSTANDARD LVCMOS33    [get_ports {pan_tilt_uart_*}]
set_property PACKAGE_PIN  A9        [get_ports {pan_tilt_uart_txd}]
set_property PACKAGE_PIN A10        [get_ports {pan_tilt_uart_rxd}]
set_property PACKAGE_PIN B12        [get_ports {pan_tilt_uart_de}]
set_property PACKAGE_PIN C12        [get_ports {pan_tilt_uart_re}]

set_property IOSTANDARD LVCMOS33    [get_ports {laser_uart_*}]
set_property PACKAGE_PIN A8         [get_ports {laser_uart_txd}]
set_property PACKAGE_PIN B8         [get_ports {laser_uart_rxd}]

set_property IOSTANDARD LVCMOS33    [get_ports {gps_uart_*}]
#set_property PACKAGE_PIN T15        [get_ports {gps_uart_txd}]; # io-a1
#set_property PACKAGE_PIN U16        [get_ports {gps_uart_rxd}]; # io-a2
set_property PACKAGE_PIN N17        [get_ports {gps_uart_txd}]; # io-b1
set_property PACKAGE_PIN P18        [get_ports {gps_uart_rxd}]; # io-b2

# note: Rev B1 of the board has the uart channels swapped. These pins are swapped to fix it here.
set_property IOSTANDARD LVCMOS33    [get_ports {sensor_uart_*}]
set_property PACKAGE_PIN B9         [get_ports {sensor_uart_txd[1]}]
set_property PACKAGE_PIN C9         [get_ports {sensor_uart_rxd[1]}]
set_property PACKAGE_PIN C10        [get_ports {sensor_uart_txd[0]}]
set_property PACKAGE_PIN C11        [get_ports {sensor_uart_rxd[0]}]

##### Ethernet ###########

create_clock -period 40.000 -name eth_tx_clk -waveform {0.000 20.000} [get_ports {eth_mii_tx_clk}]
set mii_tx_maxdel  4.0
set mii_tx_mindel -2.0
set_output_delay -clock [get_clocks {eth_tx_clk}] -min -add_delay $mii_tx_mindel [get_ports {eth_mii_txd[*]}]
set_output_delay -clock [get_clocks {eth_tx_clk}] -max -add_delay $mii_tx_maxdel [get_ports {eth_mii_txd[*]}]

set_output_delay -clock [get_clocks {eth_tx_clk}] -min -add_delay $mii_tx_mindel [get_ports {eth_mii_tx_en}]
set_output_delay -clock [get_clocks {eth_tx_clk}] -max -add_delay $mii_tx_maxdel [get_ports {eth_mii_tx_en}]

set_output_delay -clock [get_clocks {eth_tx_clk}] -min -add_delay $mii_tx_mindel [get_ports {eth_mii_rst_n}]
set_output_delay -clock [get_clocks {eth_tx_clk}] -max -add_delay $mii_tx_maxdel [get_ports {eth_mii_rst_n}]


create_clock -period 40.000 -name eth_rx_clk -waveform {0.000 20.000} [get_ports {eth_mii_rx_clk}]
set mii_rx_maxdel 30.0
set mii_rx_mindel  5.0
set_input_delay -clock [get_clocks {eth_rx_clk}] -min -add_delay $mii_rx_mindel [get_ports {eth_mii_rxd[*]}]
set_input_delay -clock [get_clocks {eth_rx_clk}] -max -add_delay $mii_rx_maxdel [get_ports {eth_mii_rxd[*]}]

set_input_delay -clock [get_clocks {eth_rx_clk}] -min -add_delay $mii_rx_mindel [get_ports {eth_mii_rx_er}]
set_input_delay -clock [get_clocks {eth_rx_clk}] -max -add_delay $mii_rx_maxdel [get_ports {eth_mii_rx_er}]

set_input_delay -clock [get_clocks {eth_rx_clk}] -min -add_delay $mii_rx_mindel [get_ports {eth_mii_rx_dv}]
set_input_delay -clock [get_clocks {eth_rx_clk}] -max -add_delay $mii_rx_maxdel [get_ports {eth_mii_rx_dv}]


set_property IOSTANDARD LVCMOS33    [get_ports {eth_*}]
set_property DRIVE 4                [get_ports {eth_mii_txd[*]}]
set_property DRIVE 4                [get_ports {eth_mii_tx_en}]
set_property DRIVE 4                [get_ports {eth_refclk}]
set_property DRIVE 4                [get_ports {eth_mii_rst_n}]
#set_property PACKAGE_PIN N14       [get_ports {eth_mdio_mdc }]
#set_property PACKAGE_PIN R12       [get_ports {eth_mdio_mdio_io }]
#set_property PACKAGE_PIN P14       [get_ports {eth_mii_col }]
#set_property PACKAGE_PIN R13       [get_ports {eth_mii_crs }]
set_property PACKAGE_PIN G17        [get_ports {eth_mii_rst_n }]
set_property PACKAGE_PIN P17        [get_ports {eth_mii_rx_clk}]
set_property PACKAGE_PIN U18        [get_ports {eth_mii_rx_dv }]
set_property PACKAGE_PIN L16        [get_ports {eth_mii_rx_er }]  
set_property PACKAGE_PIN V16        [get_ports {eth_mii_rxd[3] }]
set_property PACKAGE_PIN R16        [get_ports {eth_mii_rxd[2] }]
set_property PACKAGE_PIN T16        [get_ports {eth_mii_rxd[1] }]
set_property PACKAGE_PIN T13        [get_ports {eth_mii_rxd[0] }]
set_property PACKAGE_PIN T14        [get_ports {eth_mii_tx_clk }]
set_property PACKAGE_PIN V17        [get_ports {eth_mii_tx_en }]
set_property PACKAGE_PIN U12        [get_ports {eth_mii_txd[3] }]
set_property PACKAGE_PIN R11        [get_ports {eth_mii_txd[2] }]
set_property PACKAGE_PIN R10        [get_ports {eth_mii_txd[1] }]
set_property PACKAGE_PIN U13        [get_ports {eth_mii_txd[0] }]
set_property PACKAGE_PIN V14        [get_ports {eth_refclk}]


########### timing constraints to shut up the compiler #############

# Outputs

#set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {led_*}]
#set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {led_*}]

#set_output_delay -clock [get_clocks {clkout150_system_clk_wiz_0_0}] -min -add_delay 0 [get_ports {led_blue}]
#set_output_delay -clock [get_clocks {clkout150_system_clk_wiz_0_0}] -max -add_delay 0 [get_ports {led_blue}]

set_max_delay -to [get_ports {led_*}]         15.555

set_max_delay -to [get_ports {lc_heater_pwm}]         15.555

set_max_delay -to [get_ports adc_clk_p[*]]         21.112

set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {amc7823_csn[*]}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {amc7823_csn[*]}]
set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {amc7823_sck[*]}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {amc7823_sck[*]}]
set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {amc7823_mosi[*]}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {amc7823_mosi[*]}]

set_max_delay -to [get_ports fake_pulse]           21.114

set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {fan_pwm}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {fan_pwm}]

set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {*uart_txd*}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {*uart_txd*}]

set_max_delay -to [get_ports laser_trigger]        21.115
set_max_delay -to [get_ports lc_pol]               21.115

set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {scl}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {scl}]
set_output_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {sda}]
set_output_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {sda}]

set_max_delay 20 -from [all_ffs] -to [get_ports deck_heater_enable]
set_max_delay 20 -from [all_ffs] -to [get_ports lc_en]
set_max_delay 20 -from [all_ffs] -to [get_ports phase1]
set_max_delay 20 -from [all_ffs] -to [get_ports phase2]
set_max_delay 20 -from [all_ffs] -to [get_ports phase5]
set_max_delay 20 -from [all_ffs] -to [get_ports phase6]
set_max_delay 20 -from [all_ffs] -to [get_ports reset_em]
set_max_delay 20 -from [all_ffs] -to [get_ports tec_enable]
set_max_delay 20 -from [all_ffs] -to [get_ports laser_run_req]
set_max_delay 20 -from [all_ffs] -to [get_ports pan_tilt_uart_de]


# Inputs

set_max_delay -from [get_ports laser_sync_in] -to [get_pins laser_sync_in_q_reg/D] 4.0
set_min_delay -from [get_ports laser_sync_in] -to [get_pins laser_sync_in_q_reg/D] 0.0

set_max_delay -from [get_ports photon_in[*]] -to [get_pins photon_in_q_reg[*]/D] 4.0
set_min_delay -from [get_ports photon_in[*]] -to [get_pins photon_in_q_reg[*]/D] 0.0

set_input_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {amc7823_miso[*]}]
set_input_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {amc7823_miso[*]}]

set_input_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {fan_tach[*]}]
set_input_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {fan_tach[*]}]

set_input_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {*uart_rxd*}]
set_input_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {*uart_rxd*}]

set_input_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {scl}]
set_input_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {scl}]
set_input_delay -clock [get_clocks {clk100}] -min -add_delay 0 [get_ports {sda}]
set_input_delay -clock [get_clocks {clk100}] -max -add_delay 0 [get_ports {sda}]






