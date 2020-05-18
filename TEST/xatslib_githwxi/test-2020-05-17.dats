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
#staload
"prelude/DATS/gseq.dats"
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
#staload
"prelude/DATS/list_vt.dats"
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
iforall$test<sint>(i0, x1) =
if x1 != x0 then abs(x1-x0) != (i0+1) else false
}
) (* qtest *)

(* ****** ****** *)

fun
qextend
( xs
: list(int)
)
: list_vt(list(int)) =
(
  auxlst(0)
) where
{
fun
auxlst(x0: int) =
if
(x0 < N)
then
(
if
qtest(xs, x0)
then cons_vt(cons(x0, xs), auxlst(x0+1)) else auxlst(x0+1)
)
else list_vt_nil((*void*))
} (* qextend *)

(* ****** ****** *)

fun
qextends
( xss
: list_vt(list(int))
)
: list_vt(list(int)) =
list_vt_concat
(
let
typedef xs = list(int)
typedef ys = list_vt(xs)
impltmp
map0$fopr<xs><ys>(xs) = qextend(xs)
in
  list_vt_map0<xs><ys>(xss)
end
)

(* ****** ****** *)

val
the_sols =
loop(xss, 0) where
{
typedef xs = list(int)
val
xss =
list_vt_sing(list_nil()) 
fun
loop
( xss
: list_vt(xs), i0: int) =
if i0 < N then loop(qextends(xss), i0+1) else xss
}

val the_nsol = list_vt_length(the_sols)

(* ****** ****** *)

(* end of [test-2020-05-17.dats] *)
