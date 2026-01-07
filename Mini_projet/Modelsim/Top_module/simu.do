# Création de la bibliothèque
#vdel -all -lib work
vlib work

# Compilation des composants de base (LES ENFANTS)
vcom -93 detecteur_de_front.vhd
vcom -93 bascule_d.vhd
vcom -93 registre_changement_parallele.vhd
vcom -93 comparateur_4bits.vhd
vcom -93 comparateur_16bits.vhd
vcom -93 decodeur_7_seg.vhd

vcom -93 top_module.vhd
vcom -93 top_module_tb.vhd



#vsim -novopt top_module_tb(RTL)
vsim -novopt work.top_module_tb 



view signals
add wave *


#run -all   
run 200 ns
