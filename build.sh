#!/bin/sh

make_all() {
    make all
}

#
# For when this repository is cloned without --recursive flag
#
clone_xanadu() {
    if [ ! -d xanadu/srcgen ]; then
	git clone https://github.com/xanadu-lang/xanadu.git
    fi
}

XINTERP_SCRIPT='#!/bin/sh
export XATSHOME='$PWD/xanadu'
XINTERP='$PWD'/bin/xinterp

if [ -f "$XINTERP" ]; then
    "$XINTERP" "$@"
else
    # if build failed or "make cleanall" was executed
    echo "./bin/xinterp does not exist"
    echo "please execute `make libxatsopt all`"
fi
'
generate_script() {
    printf "$XINTERP_SCRIPT" > xinterp
    # make the above script executable
    chmod +x xinterp
}

main() {
    clone_xanadu
    make_all
    generate_script
}

main
