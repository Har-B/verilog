#!/bin/bash

set -ex

GTKW_FILE=$1
if [[ -z "$(echo ${GTKW_FILE} | grep -e '\.vcd')" ]];then
    echo "Wrong file (extension)"
    echo "Select file *.vcd"
    exit 1
fi
if [[ ! -f $GTKW_FILE ]]; then
    echo "ERROR: File '${GTKW_FILE}' not exist"
    echo "Coose correct *.vcd file!"
    exit 1
fi

echo "SHOW:"
gtkwave ${GTKW_FILE}
