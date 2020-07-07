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
#staload
"prelude/DATS/string_vt.dats"
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

extern
fun
string_fset_at
{n:nat}
( cs
: string(n)
, i0
: nintlt(n)
, c0: cgtz): string_vt(n)
implfun
string_fset_at
  (cs, i0, c0) =
(
string_vt_tabulate(length(cs))
) where
{
impltmp
tabulate$fopr<cgtz>(i1) =
if
(i0 = i1)
then c0 else string_get_at(cs, i1)
} (* end of [string_fset_at] *)

(* ****** ****** *)

#extern
fun
helper1
{n:nat}
( cs
: string(n)
)
: stream_vt(string_vt(n))

(* ****** ****** *)

val
alpha =
"abcdefghijklmnopqrstuvwxyz"

(* ****** ****** *)
//
implfun
helper1
{n}(cs) =
let
typedef x0 = cgtz
typedef xs = string
typedef y0 = cgtz
typedef ys = string
impltmp
x2imap$fopr
<x0,y0>
( i, c0
, j, c1 ) =
string_fset_at(cs, i, c1)
impltmp
x2ifilter$test<x0,y0>
(_, c0, _, c1) = (c0 != c1)
in
  gseq_x2imapopt_stream(cs, alpha)
end (* end of [helper1] *)
//
(* ****** ****** *)
//
(*
local
impltmp
g_free<string_vt>(cs) = () // leak!
in
val nword = length(helper1("water"))
end
*)
val words = listize(helper1("water"))
//
(* ****** ****** *)

(* end of [test-2020-06-28.dats] *)
