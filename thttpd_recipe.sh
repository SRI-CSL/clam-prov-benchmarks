#! /bin/bash

source config.sh

SRC="http://acme.com/software/thttpd/thttpd-2.27.tar.gz"
curl -L ${SRC} > thttpd-2.27.tar.gz
gunzip -k thttpd-2.27.tar.gz
tar xvf thttpd-2.27.tar
rm -f thttpd-2.27.tar
rm -f thttpd-2.27.tar.gz
#INSTALL_DIR=$PWD/thttpd-2.27/install

cd thttpd-2.27
CC=gclang CFLAGS="-g" ./configure --host=i686 #--prefix=${INSTALL_DIR}
make 
get-bc thttpd
cp thttpd.bc ${INSTALL_BITCODE}/thttpd.bc


