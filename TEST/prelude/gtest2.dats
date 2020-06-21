(* ****** ****** *)
(*
** for g-sequences
*)
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
//
(* ****** ****** *)
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafe.sats"
#staload
// UN =
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
#staload
"prelude/DATS/list.dats"
#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"
(* ****** ****** *)
//
val xs1 =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4,
list_cons(5, list_nil())))))
//
(* ****** ****** *)

val xs2 = gseq_reverse(xs1)

(* ****** ****** *)

val xs3 =
(
gseq_map_list(xs1)
) where
{
impltmp
map$fopr<int><int>(x0) = x0 * x0
}

(* ****** ****** *)

val xs4 =
(
gseq_map_rlist(xs1)
) where
{
impltmp
map$fopr<int><int>(x0) = x0 * x0
}

(* ****** ****** *)

val xs5 = gseq_append(xs1, xs2)

(* ****** ****** *)

val xs6 =
gseq_filter_list(xs5)
where
{
impltmp
filter$test<int>(x0) = x0 % 2 = 0 }

(* ****** ****** *)

val xs7 =
gseq_filter_rlist(xs5)
where
{
impltmp
filter$test<int>(x0) = x0 % 2 = 0 }

(* ****** ****** *)
//
val xs8 = gseq_drop(xs1, 1)
//
(* ****** ****** *)
//
val xs9 =
gseq_idropif(xs8) where
{
impltmp
idropif$test<int>(i0, x0) = x0 <= 3 }
//
(* ****** ****** *)

val xs10 =
gseq_z2map_list(xs1, xs1)
where
{
impltmp
z2map$fopr<int,int>(x0, y0) = x0 + y0 }

(* ****** ****** *)

(* end of [gtest2.dats] *)
