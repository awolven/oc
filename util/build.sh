#!/bin/bash
gcc -I ../opencascade-7.1.0/inc -shared -fpic ../src/oc_wrap.cxx -std=c++11 -o ../lib/oc/Linux/AMD64/gcc/debug/oc.so
