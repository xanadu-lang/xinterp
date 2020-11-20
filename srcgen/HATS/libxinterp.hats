(* ****** ****** *)

#define
XANADU_targetloc
"./../../xanadu/srcgen/xats"

(* ****** ****** *)
#staload STM =
"{$XANADU}/SATS/xstamp0.sats"
(* ****** ****** *)
#staload SYM =
"{$XANADU}/SATS/xsymbol.sats"
(* ****** ****** *)
#staload LAB =
"{$XANADU}/SATS/xlabel0.sats"
(* ****** ****** *)
#staload GLO =
"{$XANADU}/SATS/xglobal.sats"
(* ****** ****** *)
#staload ERR =
"{$XANADU}/SATS/xerrory.sats"
(* ****** ****** *)
#staload FP0 =
"{$XANADU}/SATS/filpath.sats"
(* ****** ****** *)
#staload LOC =
"{$XANADU}/SATS/locinfo.sats"
(* ****** ****** *)
//
#staload LEX =
"{$XANADU}/SATS/lexing0.sats"
#staload PAR =
"{$XANADU}/SATS/parsing.sats"
//
(* ****** ****** *)
#staload S1E =
  "{$XANADU}/SATS/staexp1.sats"
#staload S2E =
  "{$XANADU}/SATS/staexp2.sats"
(* ****** ****** *)
//
#staload INTREP0 =
  "{$XANADU}/SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload XATSOPT =
  "{$XANADU}/SATS/xatsopt.sats"
//
(* ****** ****** *)

(* end of [libxinterp.hats] *)
