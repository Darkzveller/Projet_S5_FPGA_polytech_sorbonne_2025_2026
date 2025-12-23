vlib work

vcom -93 comparateur_4bits.vhd
vcom -93 comparateur_4bits_tb.vhd



#vsim -novopt comparateur_4bits_tb(RTL)
vsim -novopt work.tb_comparateur 



view signals
add wave *


#run -all   
run 90 ps
