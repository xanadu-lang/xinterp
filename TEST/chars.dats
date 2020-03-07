(* ****** ****** *)

#staload
"./../xanadu\
/prelude/DATS/char.dats"
#staload
"./../xanadu\
/prelude/DATS/string.dats"

(* ****** ****** *)
//
#staload
"./../xanadu/prelude/DATS/gseq.dats"
#staload
"./../xanadu/prelude/DATS/unsafe.dats"
//
(* ****** ****** *)

val a = 'a'
val b = 'b'
val () = g_print(a)
val () = g_print(b)

(* ****** ****** *)

val ab =
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
val ((*void*)) = gseq_print(ab)

(* ****** ****** *)

(* end of [chars.dats] *)
