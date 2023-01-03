#!/bin/bash

set -e

echo "CLEAN:"
find . \
    -name "*.vpp" \
    -o -name "*.vcd" \
    -o -name "*.vresult" | xargs -I{} rm '{}'
