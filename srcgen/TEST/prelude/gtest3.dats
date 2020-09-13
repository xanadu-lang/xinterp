(* ****** ****** *)
(*
** for g-sequences
*)
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
UN =
"prelude/SATS/unsafe.sats"
#staload
// UN =
"prelude/DATS/unsafe.dats"

(* ****** ****** *)

#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"

(* ****** ****** *)

#staload
"prelude/DATS/gios.dats"

(* ****** ****** *)

#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"

(* ****** ****** *)

#staload
"prelude/DATS/gseq.dats"

(* ****** ****** *)

#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"

(* ****** ****** *)
//
#staload
"xatslib/libc/DATS/stdio.dats"
//
(* ****** ****** *)

val cs =
g_inp_line_list<>()

(* ****** ****** *)

val cs = g_inp_cstream<>()
val ln = stream_vt_length(cs)

(* ****** ****** *)

(* end of [gtest3.dats] *)
