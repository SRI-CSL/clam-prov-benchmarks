#! /bin/bash

source config.sh

VSFTPD=vsftpd-3.0.3
VSFTPD_DIR=$PWD/vsftpd-3.0.3

wget https://security.appspot.com/downloads/${VSFTPD}.tar.gz
tar xvfz ${VSFTPD}.tar.gz
rm -f ${VSFTPD}.tar.gz
patch -p0 < vsftpd-3.0.3.patch
cd ${VSFTPD}

make && make install
get-bc ${VSFTPD_DIR}/vsftpd
cp ${VSFTPD_DIR}/vsftpd.bc ${INSTALL_BITCODE}/vsftpd.bc
