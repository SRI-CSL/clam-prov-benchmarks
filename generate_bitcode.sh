#! /bin/bash

source config.sh

# Generate the bitcode files
echo "Generating bitcode for bftpd ..."
./bftpd_recipe.sh >& bftpd.bc.log
echo "Generating bitcode for brotli ..."
./brotli_recipe.sh >& brotli.bc.log
echo "Generating bitcode for brotli_mod ..."
./brotli_mod_recipe.sh >& brotli_mod.bc.log
echo "Generating bitcode for curl ..."
./curl_recipe.sh >& curl.bc.log
echo "Generating bitcode for thttpd ..."
./thttpd_recipe.sh >& thttpd.bc.log
echo "Generating bitcode for vsftpd ..."
./vsftpd_recipe.sh >& vsftpd.bc.log
echo "Generating bitcode for httpd ..."
./apache_recipe.sh >& apache.bc.log

# Check that the bitcode files are built
declare -a bitcode=("bftpd.bc" "brotli.bc" "brotli_mod.bc" "curl.bc" "httpd.bc" "thttpd.bc" "vsftpd.bc")
echo "Checking all the bitcode files are available ..."
for bc in "${bitcode[@]}"
do
    bc="${INSTALL_BITCODE}/$bc"
    if [ -a  "$bc" ]
    then
        echo "Found $bc"
    else
        echo "Error: $bc not found. Check \"$bc.log\""
    fi
done
echo "OK!"
exit 0
