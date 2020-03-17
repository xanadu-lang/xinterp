(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/Xint/runtime.dats"
(* ****** ****** *)
//
#staload
"./../xanadu\
/prelude/DATS/gbas.dats"
#staload
"./../xanadu\
/prelude/DATS/gseq.dats"
#staload
"./../xanadu\
/prelude/DATS/unsafe.dats"
//
(* ****** ****** *)
//
#staload _ =
"./../xanadu\
/prelude/DATS/char.dats"
#staload _ =
"./../xanadu\
/prelude/DATS/gint.dats"
#staload _ =
"./../xanadu\
/prelude/DATS/string.dats"
//
#staload _ =
"./../xanadu\
/prelude/DATS/list.dats"
#staload _ =
"./../xanadu\
/prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)

val xs1 =
list_cons(1,
list_cons(2, list_nil()))
val xs2 =
list_cons(1,
list_cons(2, list_nil()))
val sgn = g_cmp(xs1, xs2)

(* ****** ****** *)

(* end of [lists.dats] *)
