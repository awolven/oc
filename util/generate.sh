#!/bin/bash
export SWIG_LIB=./swig-cffi/Lib
swig-cffi/swig-linux -c++ -cffi ../src/oc.i
