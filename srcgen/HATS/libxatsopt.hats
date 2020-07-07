(* ****** ****** *)

#define
XANADU_targetloc
"./../../xanadu/srcgen/xats"

(* ****** ****** *)
//
#staload
"{$XANADU}/SATS/label0.sats"
#staload
"{$XANADU}/SATS/stamp0.sats"
#staload
"{$XANADU}/SATS/symbol.sats"
//
(* ****** ****** *)
//
#staload
"{$XANADU}/SATS/locinfo.sats"
//
#staload
"{$XANADU}/SATS/filsrch.sats"
//
(* ****** ****** *)
//
#staload
"{$XANADU}/SATS/lexing.sats"
//
#staload
"{$XANADU}/SATS/parsing.sats"
//
#staload
"{$XANADU}/SATS/staexp0.sats"
#staload
"{$XANADU}/SATS/dynexp0.sats"
#staload
"{$XANADU}/SATS/synread.sats"
//
#staload
"{$XANADU}/SATS/trans01.sats"
#staload
"{$XANADU}/SATS/staexp1.sats"
#staload
"{$XANADU}/SATS/dynexp1.sats"
#staload
"{$XANADU}/SATS/tread01.sats"
//
#staload
"{$XANADU}/SATS/trans12.sats"
#staload
"{$XANADU}/SATS/tread12.sats"
//
#staload
"{$XANADU}/SATS/trans23.sats"
#staload
"{$XANADU}/SATS/tread23.sats"
//
#staload
"{$XANADU}/SATS/trans33.sats"
#staload
"{$XANADU}/SATS/tread33.sats"
//
#staload
"{$XANADU}/SATS/trans3t.sats"
//
#staload
"{$XANADU}/SATS/trans3x.sats"
#staload
"{$XANADU}/SATS/tread3x.sats"
//
(* ****** ****** *)
//
#staload
GLO =
"{$XANADU}/SATS/global.sats"
//
#staload
ERR =
"{$XANADU}/SATS/xerrory.sats"
//
(* ****** ****** *)
//
#staload
FP0 =
"{$XANADU}/SATS/filpath.sats"
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
#staload S2E =
"{$XANADU}/SATS/staexp2.sats"
#staload D2E =
"{$XANADU}/SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"{$XANADU}/DATS/staexp0_print.dats"
#staload
_(*TMP*) =
"{$XANADU}/DATS/dynexp0_print.dats"
//
#staload
_(*TMP*) =
"{$XANADU}/DATS/staexp1_print.dats"
#staload
_(*TMP*) =
"{$XANADU}/DATS/dynexp1_print.dats"
//
#staload
_(*TMP*) =
"{$XANADU}/DATS/staexp2_print.dats"
#staload
_(*TMP*) =
"{$XANADU}/DATS/statyp2_print.dats"
#staload
_(*TMP*) =
"{$XANADU}/DATS/dynexp2_print.dats"
//
#staload
_(*TMP*) =
"{$XANADU}/DATS/dynexp3_print.dats"
//
(* ****** ****** *)
//
#staload
_(*TMP*) =
"{$XANADU}/DATS/trans12_envmap.dats"
//
(* ****** ****** *)

(* end of [libxatsopt.hats] *)
