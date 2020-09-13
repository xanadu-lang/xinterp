(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/basics.dats"
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"
#staload
// UN =
"prelude/DATS/unsafe.dats"

(* ****** ****** *)

#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"

(* ****** ****** *)

#staload
"prelude/DATS/gseq.dats"

(* ****** ****** *)

impltmp
gseq_forall
<int><int>
  (xs) = loop(0) where
{
//
fun
loop(i: int): bool =
if i >= xs then true else
(if forall$test<int>(i) then loop(i+1) else false)
//
} (* gseq_forall *)

(* ****** ****** *)

impltmp
{x0:type}
gseq_forall
<list(x0)><x0>
  (xs) = loop(xs) where
{
//
fun
loop(xs: list(x0)): bool =
case+ xs of
| list_nil() => true
| list_cons(x0, xs) =>
  if forall$test<x0>(x0) then loop(xs) else false
//
} (* gseq_forall *)

(* ****** ****** *)
//
val x0 = 10
//
val xs =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4, list_nil()))))
//
(* ****** ****** *)

val y3 =
gseq_memberq(xs, 3)
val n5 =
gseq_memberq(xs, 5)

(* ****** ****** *)
//
val l0 = gseq_length(x0)
val ln = gseq_length(xs)
//
(* ****** ****** *)
//
val add_x0 = gseq_add(x0)
val mul_x0 = gseq_mul(x0)
//
(* ****** ****** *)
//
val add_xs = gseq_add(xs)
val mul_xs = gseq_mul(xs)
//
(* ****** ****** *)

val rev_x0 = gseq_copy_rlist(x0)
val rev_xs = gseq_copy_rlist(xs)

(* ****** ****** *)

(* end of [gtest1.dats] *)
