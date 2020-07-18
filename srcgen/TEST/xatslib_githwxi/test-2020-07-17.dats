(* ****** ****** *)
//
// HX: porting from ATS/Postiats
//
(* ****** ****** *)
(*
(* ****** ****** *)
//
// Implementing fixed-point operator
//
(* ****** ****** *)
//
(*
##myatsccdef=\
patsopt --constraint-ignore --dynamic $1 | \
tcc -run -DATS_MEMALLOC_LIBC -I${PATSHOME} -I${PATSHOME}/ccomp/runtime -
*)
//
(* ****** ****** *)
//
#include "share/atspre_staload.hats"
//
(* ****** ****** *)
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gfor.dats"
#staload
"prelude/DATS/gfun.dats"
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gios.dats"
(* ****** ****** *)
#staload
"prelude/DATS/rand.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/gflt.dats"
#staload
"prelude/DATS/string.dats"
#staload
"prelude/DATS/string_vt.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/list.dats"
#staload
"prelude/DATS/array.dats"
#staload
"prelude/DATS/stream.dats"
//
#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
//
fun
myfix
{a:type}
(
 f: lazy(a) -<cfr> a
) : lazy(a) = $lazy(f(myfix(f)))
//
val
fact =
myfix
{int-<cfr>int}(
lam(ff)(x) =>
if (x > 0) then (!ff)(x-1) else 1
)
(* ****** ****** *)

typedef
cfun(a:type, b:type) = a -<cfr> b

(* ****** ****** *)
//
fun
<
a:type
>
<
b:type
> myfix2
(
 f: cfun(a, b) -> cfun(a, b)
) : cfun(a, b) = lam x => f(myfix2(f))(x)
//
(* ****** ****** *)
//
val
fact2 =
myfix2<int><int>
(
lam(ff)(x) => if x > 0 then x * ff(x-1) else 1
)
(* ****** ****** *)
//
val
fact_10 =
let
val f = !fact in f(10)
end
//
(* ****** ****** *)
//
val fact2_20 = fact2(10)
//
(* ****** ****** *)

(*
(* end of [myfixptcomb.dats] *)
*)

(* ****** ****** *)

(* end of [test-2020-07-17.dats] *)
