(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/basics.dats"
(* ****** ****** *)
#staload _ =
"xatslib\
/libc/DATS/CATS\
/Xint/basics.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gfor.dats"
#staload
"prelude/DATS/gfun.dats"
#staload
"prelude/DATS/gseq.dats"
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
"prelude/DATS/list.dats"
#staload
"prelude/DATS/array.dats"
#staload
"prelude/DATS/stream.dats"
//
#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
#staload
"xatslib/libc/DATS/stdio.dats"
(* ****** ****** *)
sexpdef
array = a1ref
(* ****** ****** *)
#extern
fun
<a:t0>
<n:i0>
dotprodn
( xs: array(a, n)
, ys: array(a, n)): a
(* ****** ****** *)

(*
impltmp
<a><n>
dotprodn(xs, ys) =
z2foldl
(xs, ys, r0) where
{
//
typedef x0 = a
typedef y0 = a
typedef r0 = a
//
val r0 = g_0<r0>()
impltmp
z2foldl$fopr<x0,y0><r0>(r0, x0, y0) = r0 + x0 * y0
}
*)

impltmp
<a><n>
dotprodn(xs, ys) =
(
let
val () =
g_x1forint
(
a1ref_length(xs)) in r0 end
) where
{
//
var r0: ?a
val () =
(r0 := g_0<a>())
val p0 = $addr(r0)
//
implement
x1forint$work<n>(i0) =
let
val r0 = $UN.p2tr_get(p0)
in
$UN.p2tr_set(p0, r0+xs[i0]*ys[i0])
end
//
} (* end of [dotprodn] *)

(* ****** ****** *)
abstype Z
abstype S(type)
(* ****** ****** *)
#extern
fun
<a:t0>
<N:t0>
<n:i0>
dotprodN
( xs: array(a, n)
, ys: array(a, n)): a
(* ****** ****** *)
impltmp
{a:t0}
dotprodN
<a><Z><0>(_, _) = g_0<a>()
(* ****** ****** *)
impltmp
{a:t0}
{N:t0}
{n:i0}
dotprodN
<a><S(N)><n+1>
{n >= 0}(xs, ys) =
head(xs)*head(ys)+
dotprodN<a><N><n>(tail(xs),tail(ys))
(* ****** ****** *)
#extern
fun
<a:t0>
<N:t0>
<n:i0>
dotprodN2
( xs: array(a, n)
, ys: array(a, n)): a
(* ****** ****** *)
#extern
fun
<a:t0>
<D:t0> // D = n-i
<n:i0
,i:i0>
dotprodN2_
( i0: int(i)
, xs: array(a, n)
, ys: array(a, n)): a
(* ****** ****** *)
impltmp
{a:t0}
{N:t0}
{n:i0}
dotprodN2<a><N><n>(xs, ys) =
dotprodN2_<a><N><n,0>(0, xs, ys)
(* ****** ****** *)
impltmp
{a:t0}
{n:i0
,i:i0}
dotprodN2_
<a><Z><n,i>(_, _, _) = g_0<a>()
(* ****** ****** *)
impltmp
{a:t0}
{D:t0}
{n:i0
,i:i0}
dotprodN2_
<a><S(D)><n,i>
{n-i >= 1}
(i0, xs, ys) =
xs[i0]*ys[i0]+
dotprodN2_<a><D><n,i+1>(i0+1, xs, ys)
(* ****** ****** *)

val B3 =
a1ref_make_list(xs) where
{
val xs =
list_cons(1,
list_cons(2,
list_cons(3, list_nil())))
}

(* ****** ****** *)
val ans1 =
(
dotprodn<int>(B3, B3)
) where
{
impltmp a1ref_length<_><3>() = 3
}
(* ****** ****** *)
val ans2 =
dotprodN<int><S(S(S(Z)))>(B3, B3)
(* ****** ****** *)
val ans3 =
dotprodN2<int><S(S(S(Z)))>(B3, B3)
(* ****** ****** *)

(* end of [test-2020-07-03.dats] *)
