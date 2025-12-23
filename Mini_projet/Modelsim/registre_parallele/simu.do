vlib work
vcom -93 bascule_d.vhd

vcom -93 registre_changement_parallele.vhd
vcom -93 registre_changement_parallele_tb.vhd



#vsim -novopt registre_changement_parallele_tb(RTL)
vsim -novopt work.tb_registre 



view signals
add wave *


#run -all   
run 300 ps
