all: build run gtkwave

build:
	iverilog -o clocks clocks.v testbed.v

run:
	vvp ./clocks

gtkwave:
	gtkwave -o clocks.vcd clocks.gtkw

clean:
	rm -rf clocks *.vcd *.fst
