#! /bin/bash

source config.sh

CURL=curl-7.64.1
INSTALL_DIR=$PWD/curl-7.64.1/install

wget https://curl.haxx.se/download/${CURL}.tar.gz
tar xvfz ${CURL}.tar.gz
rm -f ${CURL}.tar.gz
cp clam.h ${CURL}
cp clam_rt.a ${CURL}
cd ${CURL}

if [[ "$OSTYPE" == "darwin"* ]]; then
    ./buildconf
    CC=gclang CFLAGS="-g" ./configure --prefix=${INSTALL_DIR}
    make && make install
    get-bc ${INSTALL_DIR}/bin/curl 
    cp ${INSTALL_DIR}/bin/curl.bc ${INSTALL_BITCODE}/curl.bc
else
    echo "Recipe only for MacOS"
fi

