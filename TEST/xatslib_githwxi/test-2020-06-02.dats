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
#staload
"prelude/DATS/gseq_vt.dats"
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
"prelude/DATS/stream_vt.dats"
(* ****** ****** *)

#staload
"xatslib/githwxi/DATS/gtree1.dats"

(* ****** ****** *)

val N = 6

(* ****** ****** *)

fun
qtest
( xs
: list(int)
, x0: sint): bool =
(
iforall(xs) where
{
impltmp
iforall$test<sint>(i0, x1) =
if
(x1 != x0)
then abs(x1-x0) != (i0+1) else false
}
) (* qtest *)

(* ****** ****** *)

abstype
node_type == list(int)
typedef node = node_type

(* ****** ****** *)

local
absopen node_type
in(*in-of-local*)

val
the_root: node = list_nil()

fun
size
(xs: node): nint = list_length(xs)

fun
qextend
( xs
: node
) : list_vt(node) =
let
fun
auxlst
(x0: int) =
if
(x0 < N)
then
(
if
qtest(xs, x0)
then
list_vt_cons
(list_cons(x0, xs), auxlst(x0+1)) else auxlst(x0+1)
) else list_vt_nil((*void*))
//
in auxlst(0) end

end // end of [local]

(* ****** ****** *)

impltmp
gtree_node_childlst<node> = qextend

(* ****** ****** *)

val
the_sols =
stream_vt_filter0
(gtree_dfs_streamize(the_root))
where
{
impltmp
filter0$test<node>(xs) = size(xs) >= N
}

(* ****** ****** *)

val the_nsol = stream_vt_length(the_sols)

(* ****** ****** *)

(* end of [test-2020-06-02.dats] *)
