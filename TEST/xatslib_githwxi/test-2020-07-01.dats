(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
#staload _ =
"xatslib\
/libc/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gfor.dats"
#staload
"prelude/DATS/gfun.dats"
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
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream.dats"
#staload
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
#staload
"xatslib/libc/DATS/stdio.dats"
(* ****** ****** *)
#staload
"xatslib/githwxi/DATS/parcmbr1.dats"
(* ****** ****** *)
//
val
the_cstream =
g_inp_cstream<>()
val
the_cstream =
(
stream_vt_map0
<x0><y0>(the_cstream)
) where
{
typedef x0 = sint
typedef y0 = char
impltmp
map0$fopr
<x0><y0>(i0) = char(i0)
}
//
val
the_input =
parcmbr_input
(stream_vt2t(the_cstream))
//
(* ****** ****** *)
//
typedef tok = char
//
(* ****** ****** *)

impltmp
<x0,xs>
gseq_append
(xs, ys) =
gseq_unlist_vt
(append
(listize(xs), listize(ys))
) (* end of [gseq_append] *)

(* ****** ****** *)
//
val
alpha =
gseq_append
(
"abcdefghijklmnopqrstuvwxyz"
,
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
)
//
(* ****** ****** *)

val
p_token =
parcmbr_token<tok>()
val
fp_sat =
parcmbr_sat<tok><tok>

(* ****** ****** *)
//
val
p_ltr0 =
fp_sat
(p_token, fmemq(alpha))
val
p_nltr =
fp_sat
(p_token, fnot(fmemq(alpha)))
//
(* ****** ****** *)

#symload
fp_map with parcmbr_map
#symload
fp_ignore with parcmbr_ignore
#symload
fp_repeat0 with parcmbr_repeat0
#symload
fp_repeat1 with parcmbr_repeat1

(* ****** ****** *)

val
p_word =
parcmbr_map
(
fp_ignore(p_nltr)
>>
fp_repeat1(p_ltr0)
,
lam(cs) =>
string_make_list_vt(cs)
)
val
p_words = fp_repeat0(p_word)

(* ****** ****** *)

typedef
word = string
vwtpdef
words = list_vt(word)

(* ****** ****** *)
//
val words =
let
val
(inp, res) =
parser_apply
(*
<tok><words>
*)
(p_words, the_input)
in
  case-
  res of ~some_vt(words) => words
end // end of [val words]
//
(* ****** ****** *)

(* end of [test-2020-07-01.dats] *)
