(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
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

val N = 8

(* ****** ****** *)

fun
qtest
( xs
: list(int)
, x0: sint): bool =
(
gseq_iforall(xs) where
{
impltmp
iforall$test<int>(i0, x1) = (abs(x1-x0) = (i0+1))
}
) (* qtest *)

(* ****** ****** *)

(* end of [test-2020-05-17.dats] *)
