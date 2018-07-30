#!/bin/bash
#
# install-googletest.sh
#
# Copyright (c) 2018 Ben Lindsay <benjlindsay@gmail.com>

PROJ_ROOT=$(pwd)
GTEST_DIR=/tmp/googletest
rm -rf $GTEST_DIR && \
  git clone https://github.com/google/googletest $GTEST_DIR && \
  cd $GTEST_DIR && \
  mkdir build && \
  cd build && \
  cmake -DCMAKE_INSTALL_PREFIX=$PROJ_ROOT .. && \
  make && \
  make install && \
  cd $PROJ_ROOT