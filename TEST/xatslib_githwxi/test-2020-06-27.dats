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
dvdcnq_solved_cmb<i><o>(rs) =
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
if
(x0 <= 100)
then either_l(x0) else either_r(x0-10)
//
} (* where *) // end of [f91]

(* ****** ****** *)

val f91_11 = f91(11)
val f91_23 = f91(23)

(* ****** ****** *)

fun
fibo(n: int) =
(
dvdcnq_solve<i><o>(n)
) where
{
//
typedef i = int
typedef o = int
//
impltmp
dvdcnq_divide<i><o>
(x0) =
list_vt_pair(x0-1, x0-2)
impltmp
dvdcnq_solved_cmb<i><o>(rs) =
(
r1 + r2
) where
{
val- ~
list_vt_cons(r1, rs) = rs
val- ~
list_vt_cons(r2, rs) = rs
}
//
impltmp
dvdcnq_solve_rec<i><o> =
lam(x0) => fibo(x0)
impltmp
dvdcnq_solve_try<i><o> =
lam(x0) =>
if
(x0 >= 2)
then either_l(x0) else either_r(x0)
//
} (* where *) // end of [fibo]

(* ****** ****** *)

val fibo10 = fibo(10)

(* ****** ****** *)

fun
<a:vt>
mergesort
( xs
: list_vt(a)
)
: list_vt(a) =
let
//
typedef
xs = list_vt(a)
//
fun
split
( ys
: &xs >> xs
, n1: nint): xs =
(
if
(n1 >= 2)
then
split(ys.1, n1-1)
else
let
val zs = ys.1
in 
  ys.1 := list_vt_nil(); zs
end // end of [else]
)
//
and
merge
( ys: ~xs
, zs: ~xs
, xs: &(?xs) >> xs): void =
(
case+ ys of
| ~
list_vt_nil() =>
( xs := zs )
| @
list_vt_cons(y0, ys1) =>
(
case+ zs of
| ~
list_vt_nil() =>
($fold(ys); xs := ys)
| @
list_vt_cons(z0, zs1) =>
let
val sgn = g_cmp<a>(y0, z0)
in
if
(sgn <= 0)
then
let
val nd = ys
val ys = ys1
val () = $fold(zs)
in
  xs := nd;
  merge(ys, zs, xs.1); $fold(xs)
end
else
let
val nd = zs
val zs = zs1
val () = $fold(ys)
in
  xs := nd;
  merge(ys, zs, xs.1); $fold(xs)
end
end // list_vt_cons
) (* list_vt_cons] *)
) (* end of [merge] *)
//
in
let
//
typedef
out = xs
datavtype
inp = T of (xs, nint)
//
fun
amain
(t0: inp): out =
(
dvdcnq_solve<inp><out>(t0)
) where
{
//
impltmp
dvdcnq_divide<inp><out>
(t0) =
let
val+ ~
T(xs, n0) = t0
val n2 = n0 / 2
val n1 = n0 - n2
var ys = xs
val zs = split(ys, n1)
val t1 = T(ys, n1)
val t2 = T(zs, n2)
in
  list_vt_pair<inp>(t1, t2)
end
//
impltmp
dvdcnq_solve_rec<inp><out>
(t0) = amain(t0)
//
impltmp
dvdcnq_solve_try<inp><out>
(t0) =
let
val+
T(xs, n0) = t0
in
if
(n0 >= 2)
then
(
  either_l(t0)
)
else
(
  $free(t0); either_r(xs)
)
end
//
impltmp
dvdcnq_solved_cmb<inp><out>
(rs) =
let
val- ~
list_vt_cons(r1, rs) = rs
val- ~
list_vt_cons(r2, rs) = rs
//
val- ~
list_vt_nil((*void*)) = rs
//
in
  let
    var xs: ?xs
  in
    merge(r1, r2, xs); xs
  end
end
//
} // end of [where] // [amain]
in
  amain( T(xs, length(xs)) )
end // end of [let]
end (* end of [mergesort] *)

(* ****** ****** *)

val xs =
list_vt_cons(2,
list_vt_cons(7,
list_vt_cons(3,
list_vt_cons(5,
list_vt_cons(8,
list_vt_cons(6,
list_vt_cons(4,
list_vt_cons(0,
list_vt_cons(9,
list_vt_cons(1,
list_vt_nil()))))))))))
val
xs_sorted = mergesort<int>(xs)

(* ****** ****** *)

val
ys_sorted = mergesort<int>(rand())

(* ****** ****** *)

(* end of [test-2020-06-27.dats] *)
