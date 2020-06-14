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
#staload
"prelude/DATS/gseq_vt.dats"
//
(* ****** ****** *)
#staload _ =
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
#staload _ =
"prelude/DATS/list.dats"
#staload _ =
"prelude/DATS/list_vt.dats"
#staload _ =
"prelude/DATS/stream_vt.dats"
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

val () =
rforeach(length(B1)) where
{
impltmp
a1ref_length<int>(B1) = 10
impltmp
rforeach$work<int>(i0) = sub(B1, i0, i0+1)
}

(* ****** ****** *)

val
bs =
gseq_map_list(B1) where
{
  impltmp
  a1ref_length<int>(B1) = 10
  impltmp
  map$fopr<int><int>(x) = (x)
}

(* ****** ****** *)

val
sum = gseq_add(B1) where
{
  impltmp a1ref_length<int>(B1) = 10
}

(* ****** ****** *)

val B2 =
a1ref_make_list(xs) where
{
  val xs =
  list_cons
  (1,list_cons(2, list_nil()))
}

(* ****** ****** *)

val B3 =
a1ref_make_list_vt(xs) where
{
  val xs =
  list_vt_cons(1,
  list_vt_cons(2,
  list_vt_cons(3, list_vt_nil())))
}

(* ****** ****** *)

val xss =
gseq_permutize(B3) where
{
impltmp a1ref_length<int>(B1) = 3
}
val len = length(xss)

(* ****** ****** *)

(* end of [array.dats] *)
