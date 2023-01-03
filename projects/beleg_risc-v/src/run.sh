#!/bin/bash

set -e

COMP_TESTBENCH=$1
INC_DIR=${INC_DIR:=.}

TARGET_STDO=$( echo "${COMP_TESTBENCH}" | sed 's/\.vpp/\.vresult/' )
TARGET_SIM=$( echo "${COMP_TESTBENCH}" | sed 's/\.vpp/\.vcd/' )

if [[ -e $COMP_TESTBENCH ]]; then
    echo "RUN:"
    echo "$COMP_TESTBENCH -> $TARGET_STDO, $TARGET_SIM"
else
    echo "ERROR: File '${COMP_TESTBENCH}' not exist"
    echo "Coose correct *.vpp file!"
    exit 1
fi

SRC=$(find ${INC_DIR} -iname "*.v" | grep --invert-match -E ".*_tb.v" | tr '\n' ' ')
# echo $SRC

## Run *.vpp
# Generates TARGET_STDO & tb.vcd
vvp $COMP_TESTBENCH | tee $TARGET_STDO
mv tb.vcd $TARGET_SIM
