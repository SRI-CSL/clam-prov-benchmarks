#! /bin/bash

source config.sh

git clone https://github.com/gamman/bftpd.git
cd bftpd
chmod 764 configure
CC=gclang CFLAGS="-g" ./configure
chmod 764 mksources
make -j
if [[ "$OSTYPE" == "darwin"* ]]; then
    for i in $(find . -perm +111 -type f) ; do echo $i ; get-bc $i; done
else
    for i in $(find . -executable -and -type f) ; do echo $i ; get-bc $i ; done
fi
cp bftpd.bc ${INSTALL_BITCODE}/bftpd.bc; 

