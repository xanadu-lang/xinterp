######
#
# For building xinterp
#
######

XINTERP="./../bin/xinterp"

######
#
test:: cbref
cbref: ; $(XINTERP) -d ./cbref.dats
#
######
#
test:: foldl
foldl: ; $(XINTERP) -d ./foldl.dats
#
######
#
test:: gfact
gfact: ; $(XINTERP) -d ./gfact.dats
#
######
#
test:: gtest
gtest: ; $(XINTERP) -d ./gtest.dats
#
######

test:: kfact
kfact: ; $(XINTERP) -d ./kfact.dats
test:: kfibo
kfibo: ; $(XINTERP) -d ./kfibo.dats
test:: kisevn
kisevn: ; $(XINTERP) -d ./kisevn.dats

######
#
test:: addrs
addrs: ; $(XINTERP) -d ./addrs.dats
#
test:: dtcon
dtcon: ; $(XINTERP) -d ./dtcon.dats
#
test:: pswap
pswap: ; $(XINTERP) -d ./pswap.dats
#
test:: tuple
tuple: ; $(XINTERP) -d ./tuple.dats
#
######

test:: isAVL
isAVL: ; $(XINTERP) -d ./isAVL.dats

######

test:: sieve
sieve: ; $(XINTERP) -d ./sieve.dats
test:: sieve_vt
sieve_vt: ; $(XINTERP) -d ./sieve_vt.dats

######

test:: sieve1
sieve1: ; $(XINTERP) -d ./sieve1.dats
test:: sieve1_vt
sieve1_vt: ; $(XINTERP) -d ./sieve1_vt.dats

######

test:: koka-amb
koka-amb: ; $(XINTERP) -d ./koka-amb.dats

######

clean::

######

cleanall:: clean

######

###### end of [Makefile] ######
