#!/bin/bash
gcc -I ./include/opencascade  -shared -fpic ./src/oc_wrap.cxx -std=c++11 -o ./lib/Linux/AMD64/debug/oc.so
