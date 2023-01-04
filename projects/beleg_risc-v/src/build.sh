#!/bin/bash

set -e

TESTBENCH=$1
INC_DIR=${INC_DIR:=.}

TARGET=$( echo "${TESTBENCH}" | sed 's/\.v/\.vpp/' )

if [[ -e $TESTBENCH ]]; then
    echo "BUILD:"
    echo "$TESTBENCH -> $TARGET"
else
    echo "ERROR: File '${TESTBENCH}' not exist"
    echo "Choose correct *_tb.v file!"
    exit 1
fi

SRC=$(find ${INC_DIR} -iname "*.v" | grep --invert-match -E ".*_tb.v" | tr '\n' ' ')
# echo $SRC

## Build
iverilog -o $TARGET $SRC $TESTBENCH
