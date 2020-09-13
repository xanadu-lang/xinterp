(* ****** ****** *)
(*
//
// For use in Effective ATS
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
//
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/basics.dats"
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

extern
fun
<a:t0>
<b:t0>
list_fold_left
( xs
: list(a)
, init: b
, fopr: (b, a) -<cfr> b
) : b // end-of-function

(* ****** ****** *)

implement
<a>
<b>(*tmp*)
list_fold_left
  (xs, init, fopr) = let
//
fun
auxmain
{n:nat} .<n>.
(
  init: b, xs: list(a, n)
) : b = (
//
case+ xs of
|
list_nil() => init
|
list_cons(x, xs) =>
auxmain(fopr(init, x), xs)
//
) (* auxmain *)
//
(*
val () = lemma_list_param(xs)
*)
//
in
  auxmain(init, xs)
end // end of [list_fold_left]

(* ****** ****** *)

fun
<a:t0>
list_length
(
  xs: list(a)
) : int =
(
//
list_fold_left
  (xs, 0, lam(xs, x) => xs + 1)
//
) (* list_length *)

fun
<a:t0>
list_reverse
(
xs: list(a)
) : list(a) =
(
//
list_fold_left
( xs
, list_nil()
, lam(xs, x) => list_cons(x, xs) )
//
) (* list_reverse *)

(* ****** ****** *)
//
val
fact =
lam
{n:nat}
(n: int(n)) =>
list_fold_left
(
list_vt2t(xs), 1, lam(r, x) => (r)*x
) where
{
val xs =
map_list(n)
where
  impltmp map$fopr<int><int>(x) = x + 1
endwhr
} (* end-of-val *)
//
(* ****** ****** *)

val fact10 = fact(10)

(* ****** ****** *)

(* end of [test-2020-07-12.dats] *)
