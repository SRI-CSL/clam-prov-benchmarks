#! /bin/bash

source config.sh

#CLAM_PROV_CMD=./clam-prov-install/bin/clam-prov.py
#CLAM_PROV_CONFIG=./clam-prov-install/config/sources-sinks.config
 
CLAM_PROV_CMD=/homes/jorge/Repos/clam-prov/install-release/bin/clam-prov.py
CLAM_PROV_CONFIG=/homes/jorge/Repos/clam-prov/install-release/config/sources-sinks.config

if [ ! -f "$CLAM_PROV_CMD" ]; then
    echo "Error: $CLAM_PROV_CMD not found. Run \"./install_clam-prov.sh\"."
    exit 1
fi

date

#declare -a bitcode=("bftpd.bc" "brotli.bc" "brotli_mod.bc" "curl.bc" "thttpd.bc" "vsftpd.bc")
declare -a bitcode=("thttpd.bc" "httpd.bc")

for bc in "${bitcode[@]}"
do
    bc="${INSTALL_BITCODE}/$bc"
    ${CLAM_PROV_CMD} ${bc} --print-sources-sinks
    time ${CLAM_PROV_CMD} ${bc} --devirt-functions=sea-dsa --add-metadata-config=${CLAM_PROV_CONFIG} --dependency-map=${bc}.output -o ${bc}.tagged.bc
done

exit 0

    
