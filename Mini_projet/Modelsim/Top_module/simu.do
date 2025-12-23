# Création de la bibliothèque
vlib work

# Compilation des composants de base (LES ENFANTS)
vcom -93 detecteur_de_front.vhd
vcom -93 bascule_d.vhd
vcom -93 registre_changement_parallele.vhd

vcom -93 top_module.vhd
vcom -93 top_module_tb.vhd



#vsim -novopt top_module_tb(RTL)
vsim -novopt work.tb_top_module 



view signals
add wave *


#run -all   
run 300 ps
