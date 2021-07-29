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
    cp bftpd.bc ${INSTALL_BITCODE}/bftpd.bc; 
else
    echo "Recipe only for MacOS"
    #for i in $(find . -executable -and -type f) ; do echo $i ; extract-bc $i ; done
    #find . -name "[^\.]*.bc"    
fi

