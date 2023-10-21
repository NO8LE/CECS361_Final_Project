# Clock constraint (adjust as needed)
create_clock -period 10.00 [get_ports {CLK}]

# Switches
set_property -dict {PACKAGE_PIN W1 IOSTANDARD LVCMOS33} [get_ports {SW[15]}]
set_property -dict {PACKAGE_PIN W2 IOSTANDARD LVCMOS33} [get_ports {SW[14]}]
# ... Repeat for SW[13] to SW[0]

# 7-Segment Display
set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {HEX0[6:0]}]
set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {HEX1[6:0]}]
set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {HEX2[6:0]}]
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {HEX3[6:0]}

# LEDs (if needed)
#set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {LED[15]}]
#set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {LED[14]}]
# ... Repeat for LED[13] to LED[0]
?
