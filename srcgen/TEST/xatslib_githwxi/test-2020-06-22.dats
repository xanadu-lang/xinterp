(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/basics.dats"
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
#staload
"xatslib/githwxi/DATS/mytest.dats"
(* ****** ****** *)
//
fun
fact(n: int): int =
if
(n > 0)
then
n * fact(pred(n)) else 1
//
fun
fibo(n: int): int =
if
(n >= 2)
then
fibo(n-1)+fibo(n-2) else n
//
(* ****** ****** *)

val
fact10 =
mytest_fun(fact) where
{
  impltmp rand<int>() = 10
}
val
fibo10 =
mytest_fun(fibo) where
{
  impltmp rand<int>() = 10
}

(* ****** ****** *)

(* end of [test-2020-06-22.dats] *)
