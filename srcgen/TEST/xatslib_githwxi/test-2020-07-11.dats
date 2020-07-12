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

#extern
fun
<a:t0
,b:t0>
list_fold_right
(
  xs: list(a)
, fopr: (a, b) -<cfr> b, sink: b
) : b // end-of-function

(* ****** ****** *)

implement
<a,b>(*tmp*)
list_fold_right
  (xs, fopr, sink) = let
//
fun
auxmain
{n:nat} .<n>.
(
  xs: list(a, n)
) : b = (
//
case+ xs of
| list_nil() => sink
| list_cons(x, xs) => fopr(x, auxmain(xs))
//
) (* auxmain *)
//
(*
val () = lemma_list_param(xs)
*)
//
in
  auxmain(xs)
end // end of [list_fold_right]

(* ****** ****** *)

fun
<a:t0>
list_length
(
  xs: list(a)
) : int =
(
//
list_fold_right<a,int>
  (xs, lam(x, xs) => xs + 1, 0)
//
) (* list_length *)

fun
<a:t0>
list_append
(
xs: list(a)
,
ys: list(a)
) : list(a) = let
//
(*
val () = lemma_list_param(ys)
*)
//
in
//
list_fold_right<a,list(a)>
  (xs, lam(x, xs) => list_cons(x, xs), ys)
//
end (* list_append *)

fun
<a:t0>
list_reverse
(
xs: list(a)
) : list(a) =
(
//
list_fold_right<a,list(a)>
( xs
, lam(x, xs) =>
  list_append<a>(xs, list_cons(x, list_nil()))
, list_nil((*void*))
) (* end of [list_fold_right] *)
//
) (* list_reverse *)

(* ****** ****** *)

fun
<a:t0>
list_find_rightmost
(
  xs: list(a)
, p0: (a) -<cfr> bool
) : optn(a) = let
//
excptcon FoundExn of (a)
//
in
//
try
let
//
val _ =
list_fold_right<a,int>
( xs
, lam(x, xs) =>
  if p0(x) then $raise(FoundExn(x)) else (0)
, 0(*nominal*)
)
//
in
  none((*void*))
end
with ~FoundExn(x) => some(x)
end
//
end (* end of [list_find_rightmost] *)

(* ****** ****** *)
//
val
fact =
lam
{n:nat}(n: int(n)) =>
list_fold_right<int,int>
(list_vt2t(listize(n)), lam(x, r) => (x+1)*r, 1)
//
(* ****** ****** *)

val fact10 = fact(10)

(* ****** ****** *)

(* end of [test-2020-07-11.dats] *)
