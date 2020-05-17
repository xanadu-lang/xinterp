######
#
# For building xinterp
#
######

ECHO=echo

######

XINTERP="./../bin/xinterp"

######
#
test:: bools
bools: ; $(XINTERP) -d ./prelude/bools.dats
test:: chars
chars: ; $(XINTERP) -d ./prelude/chars.dats
#
######
#
test:: lists
lists: ; $(XINTERP) -d ./prelude/lists.dats
#
######
#
test:: lists
strms: ; $(XINTERP) -d ./prelude/strms.dats
#
######
#
test:: cbref
cbref: ; $(XINTERP) -d ./prelude/cbref.dats
#
######
#
test:: foldl
foldl: ; $(XINTERP) -d ./prelude/foldl.dats
#
######
#
test:: gfact
gfact: ; $(XINTERP) -d ./prelude/gfact.dats
#
######
#
test:: gtest1
gtest1: ; $(XINTERP) -d ./prelude/gtest1.dats
test:: gtest2
gtest2: ; $(XINTERP) -d ./prelude/gtest2.dats
test:: gtest3
gtest3: ; \
$(ECHO) "Hello!" | $(XINTERP) -d ./prelude/gtest3.dats
#
######

test:: kfact
kfact: ; $(XINTERP) -d ./prelude/kfact.dats
test:: kfibo
kfibo: ; $(XINTERP) -d ./prelude/kfibo.dats
test:: kisevn
kisevn: ; $(XINTERP) -d ./prelude/kisevn.dats

######
#
test:: addrs
addrs: ; $(XINTERP) -d ./prelude/addrs.dats
#
test:: dtcon
dtcon: ; $(XINTERP) -d ./prelude/dtcon.dats
#
test:: pswap
pswap: ; $(XINTERP) -d ./prelude/pswap.dats
#
test:: tuple
tuple: ; $(XINTERP) -d ./prelude/tuple.dats
#
######

test:: isAVL
isAVL: ; $(XINTERP) -d ./prelude/isAVL.dats

######

test:: sieve
sieve: ; $(XINTERP) -d ./prelude/sieve.dats
test:: sieve_vt
sieve_vt: ; $(XINTERP) -d ./prelude/sieve_vt.dats

######

test:: sieve1
sieve1: ; $(XINTERP) -d ./prelude/sieve1.dats
test:: sieve1_vt
sieve1_vt: ; $(XINTERP) -d ./prelude/sieve1_vt.dats

######

test:: koka-amb
koka-amb: ; $(XINTERP) -d ./prelude/koka-amb.dats

######

test:: \
test-2020-03-21
test-2020-03-21: ; \
$(XINTERP) -d ./xatslib_githwxi/test-2020-03-21.dats

test:: \
test-2020-03-22
test-2020-03-22: ; \
$(XINTERP) -d ./xatslib_githwxi/test-2020-03-22.dats

test:: \
test-2020-04-19
test-2020-04-19: ; \
$(XINTERP) -d ./xatslib_githwxi/test-2020-04-19.dats

test:: \
test-2020-05-17
test-2020-05-17: ; \
$(XINTERP) -d ./xatslib_githwxi/test-2020-05-17.dats

######

clean::

######

cleanall:: clean

######

###### end of [Makefile] ######
