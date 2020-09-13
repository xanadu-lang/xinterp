(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/basics.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gseq.dats"
#staload
"prelude/DATS/gseq_vt.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/gint.dats"
//
#staload
"prelude/DATS/unsafe.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/list.dats"
#staload
"prelude/DATS/list_vt.dats"
(* ****** ****** *)

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fun
isprime(x: int): bool =
if
x >= 2
then isprime2(x, 2) else false

and
isprime2(x: int, y: int): bool =
if
y * y > x
then true
else
(
  if (x % y) = 0
    then false else isprime2(x, y+1)
  // end of [if]
) (* isprime2 *)

(* ****** ****** *)

val p97 = isprime(97)
val p100 = isprime(100)
val p101 = isprime(101)
val p111 = isprime(111)
val p2003 = isprime(2003)

(* ****** ****** *)

(* end of [test-2020-06-07.dats] *)
