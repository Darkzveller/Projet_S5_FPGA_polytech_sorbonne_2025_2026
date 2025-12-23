vlib work

vcom -93 decodeur_7_seg.vhd
vcom -93 decodeur_7_seg_tb.vhd



#vsim -novopt decodeur_7_seg_tb(RTL)
vsim -novopt work.tb_decodeur_7_seg 



view signals
add wave *


#run -all   
run 300 ps
