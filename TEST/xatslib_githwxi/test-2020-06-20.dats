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
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/mygist.dats"
(* ****** ****** *)
//
typedef
rat = double
abstype
rat_type == rat
//
typedef rat = rat_type
//
(* ****** ****** *)

local
absopen rat_type
in
//
impltmp
g_i<rat> = gflt_i_dflt<>
//
impltmp
g_abs<rat> = gflt_abs_dflt<>
//
impltmp
g_cmp<rat> = gflt_cmp_dflt_dflt<>
//
impltmp
g_add<rat> = gflt_add_dflt_dflt<>
impltmp
g_sub<rat> = gflt_sub_dflt_dflt<>
impltmp
g_mul<rat> = gflt_mul_dflt_dflt<>
impltmp
g_div<rat> = gflt_div_dflt_dflt<>
//
end // end of [local]

(* ****** ****** *)

datatype expr =
//
| Int of (int)
//
| Add of (expr, expr)
| Sub of (expr, expr)
| Mul of (expr, expr)
| Div of (expr, expr)
//
(* ****** ****** *)

fun
expr_eval
(x0: expr): rat =
(
case+ x0 of
| Int(i0) => g_i<rat>(i0)
| Add(x1, x2) =>
  expr_eval(x1) + expr_eval(x2)
| Sub(x1, x2) =>
  expr_eval(x1) - expr_eval(x2)
| Mul(x1, x2) =>
  expr_eval(x1) * expr_eval(x2)
| Div(x1, x2) =>
  expr_eval(x1) / expr_eval(x2)
)

(* ****** ****** *)

(*
val add23 =
expr_eval(Add(Int(2), Int(3)))
val sub23 =
expr_eval(Sub(Int(2), Int(3)))
val mul23 =
expr_eval(Mul(Int(2), Int(3)))
val div23 =
expr_eval(Div(Int(2), Int(3)))
*)

(* ****** ****** *)
val
EPSILON = 0.000001
fun
expr_iseqz
(x0: expr): bool =
abs(expr_eval(x0)) < EPSILON
//
#symload iseqz with expr_iseqz
//
fun
expr_iseq24
(x0: expr): bool =
abs
(expr_eval(x0)-g_i(24)) < EPSILON
//
(* ****** ****** *)

fun
fopr_expr_expr
( x1: expr
, x2: expr): list(expr) =
(
  xs
) where
{
//
val xs =
list_nil()
//
val xs =
if
expr_iseqz(x1)
then xs
else list_cons(Div(x2, x1), xs)
//
val xs =
if
iseqz(x2)
then xs
else list_cons(Div(x1, x2), xs)
//
val xs = list_cons(Mul(x1, x2), xs)
val xs = list_cons(Sub(x2, x1), xs)
val xs = list_cons(Sub(x1, x2), xs)
val xs = list_cons(Add(x1, x2), xs)
}

(* ****** ****** *)

typedef
node = list(expr)

(* ****** ****** *)

fun
node_childlst
( xs
: node
)
: stream_vt(node) =
stream_vt_concat<node>
(
  stream_vt_map0
  (list_nchoose2(xs, 2))
) where
{
typedef
x0 = expr
typedef
xs = list(x0)
typedef
xss = stream_vt(xs)
impltmp
map0$fopr
<(xs,xs)><xss>
  (pp) =
let
val xx = pp.0
val xs = pp.1
val-
list_cons
( x1
, list_cons(x2, _)) = xx
in
gseq_map_stream<x0><xs>
(fopr_expr_expr(x1, x2)) where
{
impltmp
map$fopr<x0><xs>(x0) = list_cons(x0, xs)
}
end // end of [map0$fopr]
} (* end of [node_childlst] *)
//
(* ****** ****** *)

fun
nodes_childlst
( xss
: stream_vt(node)
)
: stream_vt(node) =
$llazy
(
case+ !xss of
|
strmcon_vt_nil() =>
strmcon_vt_nil()
|
strmcon_vt_cons(xs, xss) => !
(
stream_vt_append
(node_childlst(xs), nodes_childlst(xss))
)
)

(* ****** ****** *)

fun
play
( n1: int
, n2: int
, n3: int
, n4: int)
: stream_vt(expr) =
(
let
val
xss = node_childlst(xs)
val
xss = nodes_childlst(xss)
val
xss = nodes_childlst(xss)
in
(
stream_vt_mapopt0<xs><x0>(xss)
) where
{
typedef x0 = expr
typedef xs = list(x0)
impltmp
mapopt0$fopr
<xs><x0>(xs) =
let
val-
list_cons(x0, _) = xs
in
if
expr_iseq24(x0)
then some_vt(x0) else none_vt()
end
}
end
) where
{
val xs = list_nil()
val xs = list_cons(Int(n4), xs)
val xs = list_cons(Int(n3), xs)
val xs = list_cons(Int(n2), xs)
val xs = list_cons(Int(n1), xs)
} (* end of [play] *)

(* ****** ****** *)
//
val
sol_3_3_8_8 =
let
val xs = play(3, 3, 8, 8)
val-cons_vt(x0, xs) = !xs in $free(xs); x0
end
//
val
sol_4_4_10_10 =
let
val xs = play(4, 4, 10, 10)
val-cons_vt(x0, xs) = !xs in $free(xs); x0
end
//
(* ****** ****** *)

(* end of [test-2020-06-20.dats] *)
