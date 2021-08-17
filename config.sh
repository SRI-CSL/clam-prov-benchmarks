#! /bin/bash

CURDIR=${PWD} 
INSTALL_BITCODE=${CURDIR}/bitcode_llvm11

if [[ "$OSTYPE" == "darwin"* ]]; then
    LIBEXT=dylib
else
    LIBEXT=so
fi
