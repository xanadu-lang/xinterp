(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: October, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-10-30:
// level-1 intermediate representation
//
(* ****** ****** *)
//
#define
XANADU_targetloc
"./../../xanadu/srcgen/xats"
//
(* ****** ****** *)
//
#staload
"{$XANADU}/SATS/basics.sats"
//
#staload
"{$XANADU}/SATS/label0.sats"
#staload
"{$XANADU}/SATS/filpath.sats"
#staload
"{$XANADU}/SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload
LEX = "{$XANADU}/SATS/lexing.sats"
//
(* ****** ****** *)
//
#staload
S1E = "{$XANADU}/SATS/staexp1.sats"
#staload
D1E = "{$XANADU}/SATS/dynexp1.sats"
//
#staload
S2E = "{$XANADU}/SATS/staexp2.sats"
#staload
S2T = "{$XANADU}/SATS/statyp2.sats"
#staload
D2E = "{$XANADU}/SATS/dynexp2.sats"
//
#staload
D3E = "{$XANADU}/SATS/dynexp3.sats"
//
(* ****** ****** *)

typedef g1exp = $S1E.g1exp
typedef d1exp = $D1E.d1exp

(* ****** ****** *)

typedef s2exp = $S2T.s2exp
typedef t2ype = $S2T.t2ype
typedef t2ypelst = $S2T.t2ypelst

(* ****** ****** *)

typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2var = $D2E.d2var
typedef f2arg = $D2E.f2arg

typedef f2arglst = $D2E.f2arglst

(* ****** ****** *)
//
typedef d3pat = $D3E.d3pat
typedef f3arg = $D3E.f3arg
typedef d3exp = $D3E.d3exp
typedef d3ecl = $D3E.d3ecl
//
typedef d3gua = $D3E.d3gua
typedef d3clau = $D3E.d3clau
typedef d3gpat = $D3E.d3gpat
//
typedef d3patlst = $D3E.d3patlst
typedef f3arglst = $D3E.f3arglst
//
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
//
typedef d3eclist = $D3E.d3eclist
//
typedef d3gualst = $D3E.d3gualst
typedef d3claulst = $D3E.d3claulst
//
(* ****** ****** *)

typedef ti2arg = $D2E.ti2arg
typedef ti3arg = $D3E.ti3arg
typedef ti2arglst = $D2E.ti2arglst

(* ****** ****** *)

abstype i0pat_tbox = ptr
typedef i0pat = i0pat_tbox
typedef i0patlst = List0(i0pat)

(* ****** ****** *)
//
abstype i0dcl_tbox = ptr
typedef i0dcl = i0dcl_tbox
typedef i0dclist = List0(i0dcl)
//
typedef i0dclistopt = Option(i0dclist)
//
(* ****** ****** *)

abstype i0exp_tbox = ptr
typedef i0exp = i0exp_tbox
typedef i0explst = List0(i0exp)
typedef i0expopt = Option(i0exp)

(* ****** ****** *)

abstype i0gua_tbox = ptr
typedef i0gua = i0gua_tbox
typedef i0gualst = List0(i0gua)

abstype i0clau_tbox = ptr
typedef i0clau = i0clau_tbox
typedef i0claulst = List0(i0clau)

abstype i0gpat_tbox = ptr
typedef i0gpat = i0gpat_tbox
typedef i0gpatlst = List0(i0gpat)

(* ****** ****** *)
//
typedef token = $LEX.token
//
(* ****** ****** *)

datatype
i0pat_node =
//
| I0Pnil of ()
| I0Pany of ()
//
| I0Pint of (int)
| I0Pbtf of (bool)
| I0Pchr of (char)
| I0Pstr of string
//
| I0Pvar of (d2var)
//
| I0Pbang of (i0pat)
| I0Pflat of (i0pat)
| I0Pfree of (i0pat)
//
| I0Pcapp of (d2con, i0patlst)
//
| I0Ptuple of (int(*knd*), i0patlst)
//
| I0Pnone0 of () | I0Pnone1 of (d3pat)
//
(* ****** ****** *)
//
fun
i0pat_get_loc
(x0: i0pat): loc_t
fun
i0pat_get_node
(x0: i0pat): i0pat_node
//
overload
.loc with i0pat_get_loc
overload
.node with i0pat_get_node
//
(* ****** ****** *)
//
fun
i0pat_make_node
(loc_t, i0pat_node): i0pat
//
(* ****** ****** *)
//
fun
print_i0pat: print_type(i0pat)
fun
prerr_i0pat: prerr_type(i0pat)
overload print with print_i0pat
overload prerr with prerr_i0pat
//
fun
fprint_i0pat: fprint_type(i0pat)
overload fprint with fprint_i0pat
//
(* ****** ****** *)
//
datatype
i0arg =
| I0ARGsome of
  (int(*npf*), i0patlst)
//
typedef
i0arglst = List0(i0arg)
typedef
i0arglstopt = Option(i0arglst)
//
(* ****** ****** *)
//
fun
print_i0arg: print_type(i0arg)
fun
prerr_i0arg: prerr_type(i0arg)
overload print with print_i0arg
overload prerr with prerr_i0arg
//
fun
fprint_i0arg: fprint_type(i0arg)
overload fprint with fprint_i0arg
//
(* ****** ****** *)
//
datatype
i0exp_node =
//
| I0Ei00 of (int)
| I0Es00 of string
//
| I0Eint of (token)
| I0Ebtf of (token)
| I0Echr of (token)
| I0Eflt of (token)
| I0Estr of (token)
//
| I0Etop of (token)
//
| I0Evar of (d2var)
//
| I0Econ1 of (d2con)
| I0Ecst1 of (d2cst)
//
| I0Efcon of (d2con)
| I0Efcst of (d2cst)
//
| I0Etcon of
  ( d2con
  , ti3arg, ti2arglst)
| I0Etcst of
  ( d2cst
  , ti3arg, ti2arglst)
//
| I0Etimp of
  ( i0exp, t2ypelst(*targ*)
  , i0dcl, t2ypelst(*tsub*))
//
| I0Edapp of
  ( i0exp
  , int(*npf*), i0explst)
//
| I0Epcon of
  ( i0exp, label(*proj*))
| I0Epbox of
  ( i0exp//rcd
  , label(*proj*), int(*index*))
//
| I0Eproj of
  ( i0exp//rcd
  , label(*proj*), int(*index*))
| I0Eplft of
  ( i0exp//rcd
  , label(*proj*), int(*index*))
| I0Epptr of
  ( i0exp//rcd
  , label(*proj*), int(*index*))
//
| I0Elet of (i0dclist, i0exp)
| I0Ewhere of (i0exp, i0dclist)
//
| I0Eseqn of
  (i0explst(*semi*), i0exp(*last*))
//
| I0Etuple of
  (int(*knd*), int(*npf*), i0explst)
//
| I0Eassgn of
  (i0exp(*left*), i0exp(*right*))
//
| I0Eif0 of
  ( i0exp(*cond*)
  , i0exp(*then*), i0expopt(*else*))
//
| I0Ecase of
  (int(*knd*), i0exp, i0claulst)
//
| I0Elam of
  (int(*knd*), i0arglst, i0exp)
| I0Efix of
  (int(*knd*), d2var, i0arglst, i0exp)
//
| I0Etry0 of (i0exp, i0claulst)
//
| I0Eaddr of (i0exp(*l-value*))
| I0Eflat of (i0exp(*l-value*))
| I0Etalf of (i0exp(*I0Eflat*))
//
| I0Efold of (i0exp(*open-con*))
//
(*
// HX-2019-12-18:
// knd=0: general
// knd=1: ptr-dref
// knd=2: lazy-eval
// knd=3: llazy-eval
*)
| I0Eeval of
    (int(*knd*), i0exp(*source*))
  // I0Eeval
//
(*
// HX-2020-09-26:
// knd=0: general
// knd=1: ptr-free
// knd=2: con-free
// knd=3: llazy-free
*)
| I0Efree of
    (int(*knd*), i0exp(*source*))
  // I0Efree
//
| I0Eraise of (i0exp(*lin-exn*))
//
| I0Elazy of
  (i0exp(*eval*))
| I0Ellazy of
  (i0exp(*eval*), i0explst(*frees*))
//
| I0Enone0 of () | I0Enone1 of d3exp
//
(* ****** ****** *)
//
datatype
i0gua_node =
| I0GUAexp of (i0exp)
| I0GUAmat of (i0exp, i0pat)
//
datatype
i0clau_node =
| I0CLAUpat of i0gpat
| I0CLAUexp of (i0gpat, i0exp)
and
i0gpat_node =
| I0GPATpat of (i0pat)
| I0GPATgua of (i0pat, i0gualst)
//
(* ****** ****** *)
//
fun
i0exp_get_loc
(x0: i0exp): loc_t
fun
i0exp_get_node
(x0: i0exp): i0exp_node
//
overload .loc with i0exp_get_loc
overload .node with i0exp_get_node
//
(* ****** ****** *)
//
fun
i0exp_make_node
(loc_t, i0exp_node): i0exp
//
(* ****** ****** *)
//
fun
print_i0exp: print_type(i0exp)
fun
prerr_i0exp: prerr_type(i0exp)
overload print with print_i0exp
overload prerr with prerr_i0exp
//
fun
fprint_i0exp: fprint_type(i0exp)
overload fprint with fprint_i0exp
//
(* ****** ****** *)
//
fun
i0gua_get_loc
(x0: i0gua): loc_t
fun
i0gua_get_node
(x0: i0gua): i0gua_node
//
overload .loc with i0gua_get_loc
overload .node with i0gua_get_node
//
(* ****** ****** *)
//
fun
i0gua_make_node
(loc_t, i0gua_node): i0gua
//
(* ****** ****** *)
//
fun
print_i0gua: print_type(i0gua)
fun
prerr_i0gua: prerr_type(i0gua)
overload print with print_i0gua
overload prerr with prerr_i0gua
//
fun
fprint_i0gua: fprint_type(i0gua)
overload fprint with fprint_i0gua
//
(* ****** ****** *)
//
fun
i0clau_get_loc
(x0: i0clau): loc_t
fun
i0clau_get_node
(x0: i0clau): i0clau_node
//
overload .loc with i0clau_get_loc
overload .node with i0clau_get_node
//
(* ****** ****** *)
//
fun
i0clau_make_node
(loc_t, i0clau_node): i0clau
//
(* ****** ****** *)
//
fun
i0gpat_get_loc
(x0: i0gpat): loc_t
fun
i0gpat_get_node
(x0: i0gpat): i0gpat_node
//
overload .loc with i0gpat_get_loc
overload .node with i0gpat_get_node
//
(* ****** ****** *)
//
fun
i0gpat_make_node
(loc_t, i0gpat_node): i0gpat
//
(* ****** ****** *)
//
fun
print_i0clau:print_type(i0clau)
fun
prerr_i0clau:prerr_type(i0clau)
overload print with print_i0clau
overload prerr with prerr_i0clau
//
fun
print_i0gpat:print_type(i0gpat)
fun
prerr_i0gpat:prerr_type(i0gpat)
overload print with print_i0gpat
overload prerr with prerr_i0gpat
//
fun
fprint_i0clau:fprint_type(i0clau)
overload fprint with fprint_i0clau
fun
fprint_i0gpat:fprint_type(i0gpat)
overload fprint with fprint_i0gpat
//
(* ****** ****** *)
//
datatype
i0valdecl =
I0VALDECL of @{
  loc= loc_t
, pat= i0pat
, def= i0expopt
}
//
typedef
i0valdeclist = List0(i0valdecl)
//
fun
print_i0valdecl(i0valdecl): void
fun
prerr_i0valdecl(i0valdecl): void
fun
fprint_i0valdecl: fprint_type(i0valdecl)
//
overload print with print_i0valdecl
overload prerr with prerr_i0valdecl
overload fprint with fprint_i0valdecl
//
(* ****** ****** *)
//
datatype
i0vardecl =
I0VARDECL of @{
  loc= loc_t
, d2v= d2var
, ini= i0expopt
}
//
typedef
i0vardeclist = List0(i0vardecl)
//
fun
print_i0vardecl(i0vardecl): void
fun
prerr_i0vardecl(i0vardecl): void
fun
fprint_i0vardecl: fprint_type(i0vardecl)
//
overload print with print_i0vardecl
overload prerr with prerr_i0vardecl
overload fprint with fprint_i0vardecl
//
(* ****** ****** *)
//
datatype
i0fundecl =
I0FUNDECL of @{
  loc= loc_t
//
, nam= d2var
, d2c= d2cst
//
, a2g=
  f2arglst
, a3g=
  i0arglstopt
//
, def= i0expopt
}
//
typedef
i0fundeclist = List0(i0fundecl)
//
fun
print_i0fundecl(i0fundecl): void
fun
prerr_i0fundecl(i0fundecl): void
fun
fprint_i0fundecl: fprint_type(i0fundecl)
//
overload print with print_i0fundecl
overload prerr with prerr_i0fundecl
overload fprint with fprint_i0fundecl
//
(* ****** ****** *)
//
datatype
i0dcl_node =
//
| I0Cstatic of
  (token(*STATIC*), i0dcl)
| I0Cextern of
  (token(*EXTERN*), i0dcl)
//
| I0Cinclude of
  ( token
  , g1exp // src
  , int(*knd*) // sta/dyn: 0/1
  , filpathopt
  , i0dclistopt) // file inclusion
//
| I0Clocal of
  (i0dclist, i0dclist)
//
| I0Cvaldecl of
  ( token(*knd*)
  , $D1E.decmodopt, i0valdeclist)
//
| I0Cvardecl of
  ( token(*knd*)
  , $D1E.decmodopt, i0vardeclist)
//
| I0Cfundecl of
  ( token(*knd*)
  , $D1E.decmodopt
  , $D2E.tq2arglst, i0fundeclist)
//
| I0Cimpdecl3 of
  ( token(*impkind*)
  , $D1E.decmodopt
  , $D2E.sq2arglst
  , $D2E.tq2arglst
  , $D2E.impld2cst
  , $D3E.ti3arg
  , $D2E.ti2arglst
  , i0arglst, i0exp)
//
| I0Cnone0 of () | I0Cnone1 of (d3ecl)
//
(* ****** ****** *)
//
fun
i0dcl_get_loc
(x0: i0dcl): loc_t
fun
i0dcl_get_node
(x0: i0dcl): i0dcl_node
//
overload
.loc with i0dcl_get_loc
overload
.node with i0dcl_get_node
//
(* ****** ****** *)
//
fun
i0dcl_make_node
(loc_t, i0dcl_node): i0dcl
//
(* ****** ****** *)
//
fun
print_i0dcl: print_type(i0dcl)
fun
prerr_i0dcl: prerr_type(i0dcl)
overload print with print_i0dcl
overload prerr with prerr_i0dcl
//
fun
fprint_i0dcl: fprint_type(i0dcl)
overload fprint with fprint_i0dcl
//
(* ****** ****** *)
//
fun
irerase_dpat(d3pat): i0pat
fun
irerase_dpatlst(d3patlst): i0patlst
//
(* ****** ****** *)
//
fun
irerase_farglst(f3arglst): i0arglst
//
(* ****** ****** *)
//
fun
irerase_dexp(d3exp): i0exp
fun
irerase_dexpopt(d3expopt): i0expopt
fun
irerase_dexplst(d3explst): i0explst
//
(* ****** ****** *)

fun
irerase_dgua(d3gua): i0gua
fun
irerase_dclau(d3clau): i0clau
fun
irerase_dgpat(d3gpat): i0gpat
fun
irerase_dgualst(d3gualst): i0gualst
fun
irerase_dclaulst(d3claulst): i0claulst

(* ****** ****** *)
//
fun
irerase_decl(d3ecl): i0dcl
fun
irerase_declist(d3eclist): i0dclist
//
(* ****** ****** *)
//
fun
irerase_valdecl
(irvd: $D3E.v3aldecl): i0valdecl
fun
irerase_valdeclist
(irvds: $D3E.v3aldeclist): i0valdeclist
//
(* ****** ****** *)
//
fun
irerase_vardecl
(irvd: $D3E.v3ardecl): i0vardecl
fun
irerase_vardeclist
(irvds: $D3E.v3ardeclist): i0vardeclist
//
(* ****** ****** *)
//
fun
irerase_fundecl
(irfd: $D3E.f3undecl): i0fundecl
fun
irerase_fundeclist
(irfds: $D3E.f3undeclist): i0fundeclist
//
(* ****** ****** *)

(* end of [intrep0.sats] *)
