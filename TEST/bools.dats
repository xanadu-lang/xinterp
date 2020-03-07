(* ****** ****** *)

#staload
"./../xanadu/prelude/DATS/bool.dats"

(* ****** ****** *)

val b0 = true
val b1 = not(b0)
val () = g_print(b0)
val () = g_print(b1)
val () = g_print(b0 + b1)
val () = g_print(b0 * b1)

(* ****** ****** *)

(* end of [bools.dats] *)
