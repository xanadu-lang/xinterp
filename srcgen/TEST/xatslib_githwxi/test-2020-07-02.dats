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
//
val
idfst =
("_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
val
idrst =
("_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
//
(* ****** ****** *)

val
p_idfst
fp_sat
(p_token, fmemq(idfst))
val
p_idrst
fp_sat
(p_token, fmemq(idrst))

(* ****** ****** *)

val
p_ident =
fp_seq2map
(p_idfst, fp_repeat0(p_idrst)
,
lam(x0, xs) =>
string_make_list_vt(cons_vt(x0, xs)))

(* ****** ****** *)

val
p_COMMA = fp_lit(p_token, ',')
val
p_LPAREN = fp_sat(p_token, '(')
val
p_RPAREN = fp_sat(p_token, ')')

(* ****** ****** *)

val p_LAM = fp_lit(p_ident, "lam")

val p_EQGT = fp_lit(p_symbl, "=>")

(* ****** ****** *)

(* end of [test-2020-07-02.dats] *)
