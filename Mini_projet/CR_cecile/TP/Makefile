
#options de compilation
GHDL = ghdl
WORKDIR = build
SIMUDIR = simulation
#GHDL_FLAGS = --std=93c

# fichiers testbench à compiler
SRC = comparateur_4bits_tb.vhd  comparateur_4x4bits_tb.vhd  registre_decalage_4x4bits_tb.vhd  serrure_elec_tb.vhd
# nom des fichiers de sortie, en .vcd
WAVEFORM = $(addprefix $(SIMUDIR)/, $(SRC:.vhd=.vcd))

all : $(WAVEFORM)

$(SIMUDIR)/%.vcd : %.vhd
	echo "$*"
	ghdl -i --workdir=$(WORKDIR) -P$(WORKDIR) $(GHDL_FLAGS) *.vhd
	ghdl -m --workdir=$(WORKDIR) -P$(WORKDIR) $(GHDL_FLAGS) $*
	ghdl -e --workdir=$(WORKDIR) -P$(WORKDIR) $(GHDL_FLAGS) $*
	ghdl -r --workdir=$(WORKDIR) -P$(WORKDIR) $(GHDL_FLAGS) $* --vcd=$@ $(GHDL_FLAGS)

clean : 
	rm -rf $(SIMUDIR)/*
	rm -rf $(WORKDIR)/*
