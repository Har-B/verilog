#!/bin/bash

set -e

COMP_TESTBENCH=$1
if [[ -z "$(echo ${COMP_TESTBENCH} | grep -e '_tb\.vpp')" ]];then
    echo "Wrong file (extension)"
    echo "Select file *_tb.vpp"
    exit 1
fi
if [[ ! -f $COMP_TESTBENCH ]]; then
    echo "ERROR: File '${COMP_TESTBENCH}' not exist"
    echo "Coose correct *.vpp file!"
    exit 1
fi

INC_DIR=${INC_DIR:=.}

TARGET_STDO=$( echo "${COMP_TESTBENCH}" | sed 's/\.vpp/\.vresult/' )
TARGET_SIM=$( echo "${COMP_TESTBENCH}" | sed 's/\.vpp/\.vcd/' )

echo "RUN:"
echo "$COMP_TESTBENCH -> $TARGET_STDO, $TARGET_SIM"


SRC=$(find ${INC_DIR} -iname "*.v" | grep --invert-match -E ".*_tb.v" | tr '\n' ' ')
# echo $SRC

## Run *.vpp
# Generates TARGET_STDO & tb.vcd
vvp $COMP_TESTBENCH | tee $TARGET_STDO
mv tb.vcd $TARGET_SIM
