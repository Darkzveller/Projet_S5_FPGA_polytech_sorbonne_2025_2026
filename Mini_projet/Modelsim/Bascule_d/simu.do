vlib work

vcom -93 bascule_d.vhd
vcom -93 bascule_d_tb.vhd



#vsim -novopt bascule_d_tb(RTL)
vsim -novopt work.tb_bascule_D 



view signals
add wave *


#run -all   
run 90 ps
