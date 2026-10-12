all: build run

build:
	iverilog -o hello hello_world.v

run:
	vvp hello

clean:
	rm -rf hello

.PHONY: all build run clean
