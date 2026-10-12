TOP = top.v
MAIN := "sim_main.cpp"

TOP_NO_EXT = $(subst .v,,$(TOP))
TOP_VCD := "$(TOP_NO_EXT).vcd"
TOP_GTKW := "$(TOP_NO_EXT).gtkw"

all: clean build run visualize

build:
	verilator -cc --exe --trace-vcd --assert --build $(TOP) $(MAIN)

run:
	./obj_dir/V$(TOP_NO_EXT)

visualize:
	gtkwave -o $(TOP_VCD) $(TOP_GTKW)

clean:
	rm -rf obj_dir "$(TOP_VCD)" "$(TOP_GTKW)"
