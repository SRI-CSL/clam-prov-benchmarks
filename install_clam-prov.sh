#! /bin/bash

CURDIR=${PWD}

git clone https://github.com/SRI-CSL/clam-prov.git
cd clam-prov
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=${CURDIR}/clam-prov-install -GNinja ../
cmake --build . --target clam-seadsa && cmake ..
cmake --build . --target clam-seallvm && cmake ..
cmake --build . --target clam-src && cmake ..
cmake --build . --target crab && cmake ..
cmake --build . --target install

exit 0

