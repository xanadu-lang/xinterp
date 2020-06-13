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
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
#staload
"prelude/DATS/gseq.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
//
#staload _ =
"prelude/DATS/char.dats"
#staload _ =
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/array.dats"
#staload _ =
"prelude/DATS/string.dats"
//
(* ****** ****** *)
//
val A0 =
a0ref_make(0)
val x0 =
a0ref_get<int>(A0)
val () = print(A0)
val () =
a0ref_set<int>(A0, 1)
val x1 =
a0ref_get<int>(A0)
val () = print(A0)
//
(* ****** ****** *)

val B1 =
a1ref_make_nval<int>(10, 0)
val y0 = sub(B1, 0)
val () = sub(B1, 1, 1)
val y1 = sub(B1, 1)
val () = sub(B1, 2, 2)
val y2 = sub(B1, 2)

(* ****** ****** *)

(* end of [array.dats] *)
