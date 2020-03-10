(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
//
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
(* ****** ****** *)

val a = 'a'
val b = 'b'
val () = g_print(a)
val () = g_print(b)

(* ****** ****** *)

val
alphabet =
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
val () = gseq_print(alphabet)

(* ****** ****** *)

val ai = gseq_indexof(alphabet, 'a')
val Ai = gseq_indexof(alphabet, 'A')
val Zi = gseq_indexof(alphabet, 'Z')

(* ****** ****** *)

val rai = gseq_rindexof(alphabet, 'a')
val rAi = gseq_rindexof(alphabet, 'A')
val rZi = gseq_rindexof(alphabet, 'Z')

(* ****** ****** *)

(* end of [chars.dats] *)
