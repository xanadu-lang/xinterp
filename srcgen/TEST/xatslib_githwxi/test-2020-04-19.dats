(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/basics.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/gint.dats"
//
#staload
"prelude/DATS/unsafe.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/list.dats"
(* ****** ****** *)
#staload
"prelude/DATS/stream_vt.dats"
(* ****** ****** *)

#staload
"xatslib/githwxi/DATS/mygist.dats"

(* ****** ****** *)

val xs =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4,
list_cons(5, list_nil())))))

(* ****** ****** *)

val xss = list_nchoose1(xs, 2)
val len = stream_vt_length(xss)

(* ****** ****** *)

val xss2 = list_nchoose2(xs, 2)
val len2 = stream_vt_length(xss2)

(* ****** ****** *)

(* end of [test-2020-04-19.dats] *)
