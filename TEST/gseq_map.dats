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

(* ****** ****** *)
//
val xs =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4,
list_cons(5, list_nil())))))
//
(* ****** ****** *)

val ys =
(
gseq_map_list<int,list(int)>(xs)
) where
{
impltmp map$fopr<int><int>(x0) = x0 * x0
}

(* ****** ****** *)

(* end of [gseq_map.dats] *)
