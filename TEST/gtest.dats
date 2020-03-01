(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"
#staload
// UN =
"./../xanadu/prelude/DATS/unsafe.dats"

(* ****** ****** *)

#staload
"./../xanadu/prelude/DATS/gint.dats"
#staload
"./../xanadu/prelude/DATS/gnum.dats"
#staload
"./../xanadu/prelude/DATS/gord.dats"

(* ****** ****** *)

#staload
"./../xanadu/prelude/DATS/gseq.dats"

(* ****** ****** *)

impltmp
{x0:type}
gseq_forall
<x0,list(x0)>
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

val xs =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4, list_nil()))))

(* ****** ****** *)
//
val ln =
gseq_length<int,list(int)>(xs)
//
(* ****** ****** *)
//
val add_xs = gseq_add<int,list(int)>(xs)
//
(* ****** ****** *)
//
val mul_xs = gseq_mul<int,list(int)>(xs)
//
(* ****** ****** *)

(* end of [gtest.dats] *)
