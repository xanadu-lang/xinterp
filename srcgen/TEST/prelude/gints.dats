(* ****** ****** *)
//
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gord.dats"
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
#staload _ =
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/Xint/basics.dats"
(* ****** ****** *)

val n0 = length(10)

(* ****** ****** *)

val mx = max2(10, 0)
val mn = min2(10, 10)

(* ****** ****** *)

val xs1 = listize(10)
val xs2 = rlistize(10)

(* ****** ****** *)

val xs3 =
map_list(10) where
{
impltmp
map$fopr<nint><nint>(x) = x + 1
}
val xs4 =
map_rlist(10) where
{
impltmp
map$fopr<nint><nint>(x) = x + 1
}

(* ****** ****** *)

(* end of [gints.dats] *)
