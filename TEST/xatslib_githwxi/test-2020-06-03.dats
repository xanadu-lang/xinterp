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
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"
//
#staload
"prelude/DATS/unsafe.dats"
//
(* ****** ****** *)

#staload _ =
"prelude/DATS/string.dats"

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
"xatslib/githwxi/DATS/mygist.dats"

(* ****** ****** *)
//
fun
string_mergesort
( cs
: string): string =
gseq_mergesort<cgtz,string>(cs)
//
(* ****** ****** *)
//
fun
string_permutize
( cs
: string)
: stream_vt(string) =
gseq_permutize<cgtz,string>(cs)
//
(* ****** ****** *)

val cs0 = "13524"
val cs0 = string_mergesort(cs0)

(* ****** ****** *)

val cs1 = "12345"
val css = string_permutize(cs1)
val css = stream_vt_listize(css)

(* ****** ****** *)

(* end of [test-2020-06-03.dats] *)
