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

val xss =
list_cons(xs1,
list_cons(xs2, list_nil()))

(* ****** ****** *)

val ans = (xss = xss)

(* ****** ****** *)

val xs3 = list_concat<int>(xss)

(* ****** ****** *)

val xs1 = list_copy_vt(xs1)
val xs2 = list_copy_vt(xs2)
val xs3 = list_vt_append(xs1, xs2)

(* ****** ****** *)

val ys1 =
list_vt_cons(1,
list_vt_cons(2,
list_vt_cons(3, list_vt_nil())))
val ys2 =
list_vt_cons(1,
list_vt_cons(2,
list_vt_cons(3, list_vt_nil())))

(* ****** ****** *)

val ys3 =
list_vt_rappend11<int>(ys1, ys2)

(* ****** ****** *)

val ln1 = list_vt_length<int>(ys1)
val ln2 = list_vt_length<int>(ys2)
val ln3 = list_vt_length<int>(ys3)

(* ****** ****** *)

val ys4 = list_vt_mergesort<int>(ys3)

(* ****** ****** *)

val zs1 =
list_vt_cons(1, list_vt_nil())
val zs2 =
list_vt_cons(2, list_vt_nil())
val zs3 =
list_vt_cons(3, list_vt_nil())
val zss =
list_vt_cons(zs1,
list_vt_cons(zs2,
list_vt_cons(zs3, list_vt_nil())))
val zs4 = list_vt_concat<int>(zss)

(* ****** ****** *)

val len =
stream_vt_length(list_vt_permutize<int>(zs4))

(* ****** ****** *)

(* end of [lists.dats] *)
