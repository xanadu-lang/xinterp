(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
"prelude/DATS/tuple.dats"
(* ****** ****** *)
#staload
"prelude\
/DATS/CATS/Xint/basics.dats"
(* ****** ****** *)

#define one 1
#define two 2

(* ****** ****** *)

val sum = one + two

(* ****** ****** *)
//
#define
npow(n, x) =
if
n > 0
then x * npow(n-1, x) else 1
//
#define pow2(x) = npow(2, x)
#define pow3(x) = npow(3, x)
//
(* ****** ****** *)

val pow3_10 = pow3(10)

(* ****** ****** *)

(* end of [gmacro.dats] *)
