(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gord.dats"
#staload
"prelude/DATS/gseq.dats"
#staload
"prelude/DATS/unsafe.dats"
//
(* ****** ****** *)
//
#staload _ =
"prelude/DATS/char.dats"
#staload _ =
"prelude/DATS/gint.dats"
#staload _ =
"prelude/DATS/string.dats"
//
#staload _ =
"prelude/DATS/list.dats"
#staload _ =
"prelude/DATS/list_vt.dats"
#staload _ =
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)

val xs1 =
list_cons(1,
list_cons(2, list_nil()))
val xs2 =
list_cons(2,
list_cons(3, list_nil()))

val ans = (xs1 = xs2)
val sgn = g_cmp(xs1, xs2)

(* ****** ****** *)

val ys1 =
list_vt_cons(1,
list_vt_cons(2, list_vt_nil()))
val ys2 =
list_vt_cons(1,
list_vt_cons(2, list_vt_nil()))

(* ****** ****** *)

val ys3 =
list_vt_rappend10<int>(ys1, ys2)

(* ****** ****** *)

val ln1 = list_vt_length<int>(ys1)
val ln3 = list_vt_length<int>(ys3)

(* ****** ****** *)

(* end of [lists.dats] *)
