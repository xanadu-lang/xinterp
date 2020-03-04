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

#staload
"./../xanadu/prelude/DATS/list.dats"
#staload
"./../xanadu/prelude/DATS/list_vt.dats"

(* ****** ****** *)
//
val xs1 =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4,
list_cons(5, list_nil())))))
//
(* ****** ****** *)

val xs2 = gseq_reverse(xs1)

(* ****** ****** *)

val xs3 =
(
gseq_map_list(xs1)
) where
{
impltmp
map$fopr<int><int>(x0) = x0 * x0
}

(* ****** ****** *)

val xs4 =
(
gseq_map_rlist(xs1)
) where
{
impltmp
map$fopr<int><int>(x0) = x0 * x0
}

(* ****** ****** *)

val xs5 = gseq_append(xs1, xs2)

(* ****** ****** *)

(* end of [gseq_test.dats] *)
