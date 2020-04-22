#!/bin/sh

######
#
# Author:
# Richar Kent (https://github.com/sparverius)
#
######

make_all() {
    make all
}

######
#
# For when this repository is cloned without --recursive flag
#
######

clone_xanadu() {
    if [ ! -d xanadu/srcgen ]; then
	git clone https://github.com/xanadu-lang/xanadu.git
    fi
}

######

XINTERP_SCRIPT='#!/bin/sh

XINTERP='${PWD}/bin/xinterp'

if [ ! "$XATSHOME" ] ; then
  export XATSHOME='${PWD}/xanadu'
fi

if [ -f "$XINTERP" ] ; then
  "$XINTERP" "$@"
else
  # if build failed or "make cleanall" was executed
  echo "please execute `make all` to build [xinterp]"
fi
'
generate_script() {
    printf "${XINTERP_SCRIPT}" > ./bin/xinterp.sh
}

######

main() {
    clone_xanadu
    make_all
    generate_script
}

main

###### end of [build.sh] ######
