vlib work

vcom -93 detecteur_de_front.vhd
vcom -93 detecteur_de_front_tb.vhd



#vsim -novopt detecteur_de_front_tb(RTL)
vsim -novopt work.tb_detecteur 



view signals
add wave *


#run -all   
run 90 ps
