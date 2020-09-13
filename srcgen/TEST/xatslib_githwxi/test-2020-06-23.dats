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

(*
impltmp
{a:t0}
rand<list(a)>() =
let
fun
auxlst
( xs
: list_vt(a)): list(a) =
(
case+ xs of
| ~
list_vt_nil
() =>
(
  list_nil()
)
| ~
list_vt_cons
(x0, xs) =>
(
  list_cons(x0, auxlst(xs))
)
)
in
  auxlst(rand_list<a>((*void*)))
end
*)

(* ****** ****** *)

local
impltmp
rand<int>() =
rand_nint_limit<>(2)
in
val
test1 = // true
mytest_fun_asso(list_append<int>)
val
test2 = // false
mytest_fun_comm(list_append<int>)
end // end of [local]

(* ****** ****** *)

(* end of [test-2020-06-23.dats] *)
