(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gios.dats"
(* ****** ****** *)
#staload
"prelude/DATS/rand.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/gflt.dats"
#staload
"prelude/DATS/string.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/dvdcnq.dats"
(* ****** ****** *)

fun
f91
(x0: int): int =
(
dvdcnq_solve<i><o>(x0)
) where
{
//
typedef i = int
typedef o = int
//
impltmp
dvdcnq_divide<i><o>
(x0) =
list_vt_sing(x0+11)
impltmp
dvdcnq_solve_cmb<i><o>(rs) =
(
f91(r1)
) where
{
val- ~
list_vt_cons(r1, rs) = rs
}
//
impltmp
dvdcnq_solve_rec<i><o>(x0) = f91(x0)
//
impltmp
dvdcnq_solve_try<i><o>(x0) =
if x0 <= 100 then either_l(x0) else either_r(x0-10)
//
} (* where *) // end of [f91]

(* ****** ****** *)

val f91_11 = f91(11)
val f91_23 = f91(23)

(* ****** ****** *)

(* end of [test-2020-06-27.dats] *)
