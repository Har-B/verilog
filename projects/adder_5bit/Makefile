
TB := full_adder_8bit_tb.v

# TODO include_dir and their SRC's
SRC := $(wildcard *.v)
SHELL=/bin/bash



all: run

# start the verilog compiler
tb.vpp: $(SRC)
	@echo "----BUILD----"
	./build.sh $(TB)

# run the compiled output in simulation envirolment
tb_run.result: build
	@echo "----RUN----"
	@vvp tb.vpp | tee tb_run.result



build: tb.vpp 

run: tb_run.result

show: 
	gtkwave tb.vcd

clean:
	rm -r *.vpp *.vcd *.testResult

.PHONY: build run 