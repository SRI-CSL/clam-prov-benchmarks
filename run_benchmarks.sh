#! /bin/bash

source config.sh

CLAM_PROV_CMD=./clam-prov-install/bin/clam-prov.py 

if [ ! -f "$CLAM_PROV_CMD" ]; then
    echo "Error: $CLAM_PROV_CMD not found. Run \"./install_clam-prov.sh\"."
    exit 1
fi

date

declare -a bitcode=("bftpd.bc" "brotli.bc" "brotli_mod.bc" "curl.bc" "thttpd.bc" "vsftpd.bc")

for bc in "${bitcode[@]}"
do
    bc="${INSTALL_BITCODE}/$bc"
    time ${CLAM_PROV_CMD} ${bc} --add-metadata-config=AddMetadata.config --dependency-map=${bc}.DependencyMap.output
done

exit 0

    
