#!/bin/bash
grep -e "^#pyCMD#" test.txt | sed 's/#pyCMD#//g' \
    | xargs -I {} -n 1 -P $(nproc) python3 -c 'print({})' \
    | grep -i "false"
