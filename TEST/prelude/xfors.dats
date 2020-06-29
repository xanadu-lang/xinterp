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
(* ****** ****** *)

#staload _ =
"prelude/DATS/xfor.dats"

(* ****** ****** *)
//
#staload _ =
"prelude/DATS/list.dats"
#staload _ =
"prelude/DATS/list_vt.dats"
#staload _ =
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)

val () =
x1for(3) where
{
impltmp
x1for$work<3>(i1) = print(i1)
}

(* ****** ****** *)

val () =
x2for(3,3) where
{
impltmp
x2for$work
<3,3>(i1,i2) = (print(i1); print(i2))
}

(* ****** ****** *)

val () =
x3for(3,3,3) where
{
impltmp
x3for$work
<3,3,3>
(i1,i2,i3) = (print(i1); print(i2); print(i3))
}

(* ****** ****** *)

(* end of [xfors.dats] *)
