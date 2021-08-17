#! /bin/bash

source config.sh

THISDIR=${PWD}

HTTPD_VERSION=2.4.39
HTTPD=httpd-${HTTPD_VERSION}
HTTPD_TARBALL=${HTTPD}.tar.gz
HTTPD_URL=http://archive.apache.org/dist/httpd/${HTTPD_TARBALL}
HTTPD_EXE=httpd
HTTPD_BITCODE=${HTTPD_EXE}.bc
HTTPD_INSTALL=${PWD}/${HTTPD}/install
    
# ------ Begin httpd libraries -----#
PCRE_VERSION=8.42
APR_VERSION=1.7.0
APR_UTIL_VERSION=1.6.1
EXPAT_INSTALL=${HTTPD_INSTALL}/expat
PCRE_INSTALL=${HTTPD_INSTALL}/pcre-${PCRE_VERSION}
APR_INSTALL=${HTTPD_INSTALL}/apr-${APR_VERSION}
APR_UTIL_INSTALL=${HTTPD_INSTALL}/apr-util-${APR_UTIL_VERSION}

## --- APR
APR=apr-${APR_VERSION}
APR_TARBALL=${APR}.tar.gz
APR_URL=http://apache.cs.utah.edu/apr/${APR_TARBALL}
APR_BASENAME=libapr-1
APR_LIB=${APR_BASENAME}.${LIBEXT}
APR_BITCODE=${APR_BASENAME}.shared.bc

wget ${APR_URL}
tar xvfz ${APR_TARBALL}
rm -f ${APR_TARBALL}
cd ${APR}                                                    
CC=gclang CFLAGS="-g" ./configure --prefix=${APR_INSTALL}
CC=gclang make -j16                                            
make install
cd ${APR_INSTALL}/lib                                        
get-bc ${APR_LIB}                                        
#cp ${APR_BASENAME}*${LIBEXT}*.bc ${INSTALL_BITCODE}
cp *.bc ${INSTALL_BITCODE}

## -- APR-UTIL
APR_UTIL=apr-util-${APR_UTIL_VERSION}
APR_UTIL_TARBALL=${APR_UTIL}.tar.gz
APR_UTIL_URL=http://apache.mirrors.pair.com/apr/${APR_UTIL_TARBALL}
APR_UTIL_BASENAME=libaprutil-1
APR_UTIL_LIB=${APR_UTIL_BASENAME}.${LIBEXT}
APR_UTIL_BITCODE=${APR_UTIL_BASENAME}.shared.bc

cd ${THISDIR}
wget ${APR_UTIL_URL}
tar xvf ${APR_UTIL_TARBALL}
rm -f ${APR_UTIL_TARBALL}
cd ${APR_UTIL}                                                         
CC=gclang CFLAGS="-g" ./configure --prefix=${APR_UTIL_INSTALL} --with-apr=${APR_INSTALL}        
CC=gclang make -j16
make install
cd ${APR_UTIL_INSTALL}/lib                                             
get-bc ${APR_UTIL_LIB}                                             
#cp ${APR_UTIL_BASENAME}*${LIBEXT}*.bc ${INSTALL_BITCODE}
cp *.bc ${INSTALL_BITCODE}

## -- EXPAT
EXPAT_URL=https://github.com/omnigroup/Apache.git 
EXPAT_BASENAME=libexpat
EXPAT_BITCODE=${EXPAT_BASENAME}.shared.bc
EXPAT_CFLAGS="-O2 -g -fno-inline -fno-inline-functions -ffunction-sections -fdata-sections"
EXPAT_LIB=${EXPAT_BASENAME}.${LIBEXT}

cd ${THISDIR}
git clone ${EXPAT_URL}
cd ./Apache/apr-util/xml/expat && ./buildconf.sh 
CC=gclang CFLAGS=${EXPAT_CFLAGS} ./configure --prefix=${EXPAT_INSTALL} 
CC=gclang make -j16
make install
cd ${EXPAT_INSTALL}/lib                                        
get-bc ${EXPAT_LIB}                                        
#cp ${EXPAT_BASENAME}*${LIBEXT}*.bc ${INSTALL_BITCODE}
cp *.bc ${INSTALL_BITCODE}
	
## -- PCRE
PCRE=pcre-${PCRE_VERSION}
PCRE_TARBALL=${PCRE}.tar.gz
PCRE_URL=https://ftp.pcre.org/pub/pcre/${PCRE_TARBALL}
PCRE_BASENAME=libpcre
PCRE_LIB=${PCRE_BASENAME}.${LIBEXT}
PCRE_BITCODE=${PCRE_BASENAME}.shared.bc

cd ${THISDIR}
wget ${PCRE_URL}
tar xvfz ${PCRE_TARBALL}
rm -f ${PCRE_TARBALL}
cd ${PCRE}
CXX=gclang++ CC=gclang CXXFLAGS="-g" ./configure --prefix=${PCRE_INSTALL}   
CXX=gclang++ CC=gclang make -j16
make install
cd  ${PCRE_INSTALL}/lib
get-bc ${PCRE_LIB}
#cp ${PCRE_BASENAME}*${LIBEXT}*.bc ${INSTALL_BITCODE}
cp *.bc ${INSTALL_BITCODE}

# ------ End httpd libraries -----#

cd ${THISDIR}
wget ${HTTPD_URL}
tar xvf ${HTTPD_TARBALL} && touch ${HTTPD}
rm -f ${HTTPD_TARBALL}
cd ${HTTPD}
CC=gclang CFLAGS="-g" ./configure --prefix=${HTTPD_INSTALL} --with-pcre=${PCRE_INSTALL}/bin/pcre-config --with-apr=${APR_INSTALL} --with-apr-util=${APR_UTIL_INSTALL} 
CC=gclang make -j16
make install
cd ${HTTPD_INSTALL}/bin
get-bc httpd
cp httpd.bc ${INSTALL_BITCODE}



