#!/bin/bash

TESTBENCH=$1
INC_DIR=${INC_DIR:=.}

TARGET="tb.vpp"

if [[ -e $TESTBENCH ]]; then
    echo "$TESTBENCH -> $TARGET"
else
    echo "ERROR: File '${TESTBENCH}' not exist"
    exit 1
fi

SRC=$(find ${INC_DIR} -iname "*.v" | grep --invert-match -E ".*_tb.v" | tr '\n' ' ')
# echo $SRC

## Build
iverilog -o $TARGET $SRC $TESTBENCH

    ## or
    # ls -1 *.v | file_list.txt
    # @iverilog -o $(TARGET) -c file_list.txt