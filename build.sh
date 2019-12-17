#!/bin/sh

git clone https://github.com/xanadu-lang/xanadu.git

make -C ./xanadu/srcgen/xats all libxatsopt

make
