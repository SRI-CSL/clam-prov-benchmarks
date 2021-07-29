#! /bin/bash

source config.sh

INSTALL_DIR=$PWD/brotli_mod/install
git clone https://github.com/google/brotli.git brotli_mod
cp ./brotli_mod_files/* ./brotli_mod/c/enc
cd brotli_mod
patch -p1 < ../brotli_mod_files/brotli_mod.patch
mkdir build-release
cd build-release
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} -DCMAKE_C_COMPILER=gclang -DCMAKE_C_FLAGS=-g ..
cmake --build . --config Release --target install
get-bc ${INSTALL_DIR}/bin/brotli 
cp ${INSTALL_DIR}/bin/brotli.bc ${INSTALL_BITCODE}/brotli_mod.bc

