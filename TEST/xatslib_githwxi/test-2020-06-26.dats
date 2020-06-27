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
string_fexch_at
{n:nat}
( cs
: string(n)
, i0
: nintlt(n)
, c0: cgtz) : string_vt(n)

(* ****** ****** *)

#extern
fun
helper1
{n:nat}
( cs
: string(n)
)
: stream_vt(string_vt(n))
#extern
fun
helper2
{n:nat}
( cs
: string(n)
, i0
: nintlt(n)
) : list_vt( string_vt(n) )

(* ****** ****** *)

implfun
helper1
{n}(cs) =
stream_vt_maplst0
(
gint_streamize_nint(length(cs))
) where
{
typedef
x0 = nintlt(n)
typedef
y0 = string_vt(n)
impltmp
maplst0$fopr<x0><y0>(i0) = helper2(cs, i0)
}

(* ****** ****** *)

(* end of [test-2020-06-26.dats] *)
