(* ****** ****** *)

#define
XATSOPT_targetloc
"./../../xatsopt/srcgen/xats"

(* ****** ****** *)
//
#staload
"{$XATSOPT}/SATS/xlabel0.sats"
#staload
"{$XATSOPT}/SATS/xstamp0.sats"
#staload
"{$XATSOPT}/SATS/xsymbol.sats"
//
(* ****** ****** *)
//
#staload
"{$XATSOPT}/SATS/locinfo.sats"
//
#staload
"{$XATSOPT}/SATS/filsrch.sats"
//
(* ****** ****** *)
//
#staload
"{$XATSOPT}/SATS/lexing0.sats"
//
#staload
"{$XATSOPT}/SATS/staexp0.sats"
#staload
"{$XATSOPT}/SATS/dynexp0.sats"
#staload
"{$XATSOPT}/SATS/parsing.sats"
#staload
"{$XATSOPT}/SATS/synread.sats"
//
#staload
"{$XATSOPT}/SATS/staexp1.sats"
#staload
"{$XATSOPT}/SATS/dynexp1.sats"
#staload
"{$XATSOPT}/SATS/trans01.sats"
#staload
"{$XATSOPT}/SATS/tread01.sats"
//
#staload
"{$XATSOPT}/SATS/staexp2.sats"
#staload
"{$XATSOPT}/SATS/statyp2.sats"
#staload
"{$XATSOPT}/SATS/dynexp2.sats"
#staload
"{$XATSOPT}/SATS/trans12.sats"
#staload
"{$XATSOPT}/SATS/tread12.sats"
//
#staload
"{$XATSOPT}/SATS/dynexp3.sats"
//
#staload
"{$XATSOPT}/SATS/trans23.sats"
#staload
"{$XATSOPT}/SATS/tread23.sats"
//
#staload
"{$XATSOPT}/SATS/trans33.sats"
#staload
"{$XATSOPT}/SATS/tread33.sats"
//
#staload
"{$XATSOPT}/SATS/trans3t.sats"
#staload
"{$XATSOPT}/SATS/trans3x.sats"
#staload
"{$XATSOPT}/SATS/tread3x.sats"
//
(* ****** ****** *)
#staload
"{$XATSOPT}/SATS/xatsopt.sats"
(* ****** ****** *)
//
#staload LAB =
"{$XATSOPT}/SATS/xlabel0.sats"
//
#staload GLO =
"{$XATSOPT}/SATS/xglobal.sats"
//
#staload ERR =
"{$XATSOPT}/SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload FP0 =
"{$XATSOPT}/SATS/filpath.sats"
//
  typedef
  fpath_t = $FP0.filpath
  macdef
  dirbase =
  $FP0.filpath_dirbase
  macdef
  fpath_make = $FP0.filpath_make
//
(* ****** ****** *)
//
(*
#staload S2E =
  "{$XATSOPT}/SATS/staexp2.sats"
#staload D2E =
  "{$XATSOPT}/SATS/dynexp2.sats"
*)
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/staexp0_print.dats"
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/dynexp0_print.dats"
//
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/staexp1_print.dats"
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/dynexp1_print.dats"
//
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/staexp2_print.dats"
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/statyp2_print.dats"
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/dynexp2_print.dats"
//
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/dynexp3_print.dats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"{$XATSOPT}/DATS/trans12_envmap.dats"
//
(* ****** ****** *)

(* end of [libxatsopt.hats] *)
