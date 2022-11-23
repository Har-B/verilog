# TODO: create right dependencies of targets

SHELL=/bin/bash

SRC := $(wildcard *.v)
TARGET := a.vpp

all: run

# start the verilog compiler
build: $(SRC)
	@echo "----BUILD----"
	@ls -l $(SRC)	
	@iverilog -o $(TARGET) $(SRC)
	@echo -e "-----------\n"

## or
# ls -1 *.v | file_list.txt
# @iverilog -o $(TARGET) -c file_list.txt


# run the compiled output in simulation envirolment
run: build
	@echo "----RUN----"
	@vvp $(TARGET) | tee test.txt
	@echo -e "-----------\n"

show:
	gtkwave a.vcd

clean:
	rm -r *.vpp *.vcd
