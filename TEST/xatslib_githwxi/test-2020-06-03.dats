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
(cs: string) =
gseq_mergesort(cs)
//
(* ****** ****** *)

val cs0 = "13524"
val cs1 = string_mergesort(cs0)

(* ****** ****** *)

(* end of [test-2020-06-03.dats] *)
