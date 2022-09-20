#!/bin/bash

mkdir -p build
pushd build

cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/opt/Qt/6.2.4/gcc_64/ ..
cmake --build .
popd
