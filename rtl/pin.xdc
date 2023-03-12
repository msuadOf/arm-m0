set_property IOSTANDARD LVCMOS33 [get_ports SWCLK]
set_property IOSTANDARD LVCMOS33 [get_ports SWDIO]
set_property PACKAGE_PIN J1 [get_ports SWCLK]
set_property PACKAGE_PIN L2 [get_ports SWDIO]

set_property IOSTANDARD LVCMOS33 [get_ports NULL]
set_property PACKAGE_PIN A16 [get_ports NULL]


set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets SWCLK_IBUF]