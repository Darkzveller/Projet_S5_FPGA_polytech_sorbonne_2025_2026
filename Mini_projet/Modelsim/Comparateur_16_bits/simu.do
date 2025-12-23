vlib work
vcom -93 comparateur_4bits.vhd

vcom -93 comparateur_16bits.vhd
vcom -93 comparateur_16bits_tb.vhd



#vsim -novopt comparateur_16bits_tb(RTL)
vsim -novopt work.tb_comparateur_16bits 



view signals
add wave *


#run -all   
run 90 ps
