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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
//
#staload $S2T; #staload $S2E
#staload $D2E; #staload $D3E
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
(*
implement
fprint_val<filpath> =
$FP0.fprint_filpath_full1
*)
implement
fprint_val<filpath> =
$FP0.fprint_filpath_full2
//
(* ****** ****** *)
//
implement
fprint_val<t2ype> = fprint_t2ype
//
(* ****** ****** *)
//
implement
fprint_val<d2con> = fprint_d2con
implement
fprint_val<d2cst> = fprint_d2cst
implement
fprint_val<d2var> = fprint_d2var
//
(* ****** ****** *)
//
implement
fprint_val<f2arg> = fprint_f2arg
implement
fprint_val<f3arg> = fprint_f3arg
//
(* ****** ****** *)
//
implement
fprint_val<sq2arg> = fprint_sq2arg
implement
fprint_val<tq2arg> = fprint_tq2arg
//
implement
fprint_val<ti2arg> = fprint_ti2arg
//
(* ****** ****** *)

implement
fprint_val<i0pat> = fprint_i0pat
implement
fprint_val<i0arg> = fprint_i0arg
implement
fprint_val<i0exp> = fprint_i0exp
implement
fprint_val<i0dcl> = fprint_i0dcl

(* ****** ****** *)

(*
implement
fprint_val<i0arglst> = fprint_i0arglst
*)

(* ****** ****** *)
//
implement
fprint_val<i0gua> = fprint_i0gua
implement
fprint_val<i0clau> = fprint_i0clau
implement
fprint_val<i0gpat> = fprint_i0gpat
//
(* ****** ****** *)
//
implement
print_i0pat(x0) =
fprint_i0pat(stdout_ref, x0)
implement
prerr_i0pat(x0) =
fprint_i0pat(stderr_ref, x0)
//
implement
fprint_i0pat
  (out, x0) =
(
case+ x0.node() of
//
| I0Pnil() =>
  fprint!(out, "I0Pnil(", ")")
| I0Pany() =>
  fprint!(out, "I0Pany(", ")")
//
| I0Pint(tok) =>
  fprint!(out, "I0Pint(", tok, ")")
| I0Pbtf(tok) =>
  fprint!(out, "I0Pbtf(", tok, ")")
//
| I0Pvar(d2v) =>
  fprint!(out, "I0Pvar(", d2v, ")")
//
| I0Pbang(irp1) =>
  fprint!(out, "I0Pbang(", irp1, ")")
| I0Pflat(irp1) =>
  fprint!(out, "I0Pflat(", irp1, ")")
| I0Pfree(irp1) =>
  fprint!(out, "I0Pfree(", irp1, ")")
//
| I0Pcapp(d2c0, irps) =>
  fprint!
  ( out
  , "I0Pcapp(", d2c0, "; ", irps, ")")
//
| I0Ptuple(knd, irps) =>
  fprint!
  ( out
  , "I0Ptuple(", knd, "; ", irps, ")")
//
| I0Pnone0() =>
    fprint!(out, "I0Pnone0(", ")")
  // end of [I0Pnone0]
| I0Pnone1(d3p) =>
    fprint!(out, "I0Pnone1(", d3p, ")")
  // end of [I0Pnone1]
//
)
//
(* ****** ****** *)
//
implement
print_i0arg(x0) =
fprint_i0arg(stdout_ref, x0)
implement
prerr_i0arg(x0) =
fprint_i0arg(stderr_ref, x0)
//
implement
fprint_i0arg
  (out, x0) =
let
val+I0ARGsome(npf, irps) = x0
in
fprint!
(out, "I0ARGsome(", npf, "; ", irps, ")")
end // end of [fprint_i0arg]
//
(*
implement
fprint_i0arglst(out, xs) = fprint!(out, xs)
*)
//
(* ****** ****** *)
//
implement
print_i0exp(x0) =
fprint_i0exp(stdout_ref, x0)
implement
prerr_i0exp(x0) =
fprint_i0exp(stderr_ref, x0)
//
implement
fprint_i0exp
  (out, x0) =
(
case+
x0.node() of
//
| I0Eint(tok) =>
  fprint!(out, "I0Eint(", tok, ")")
| I0Ebtf(tok) =>
  fprint!(out, "I0Ebtf(", tok, ")")
| I0Echr(tok) =>
  fprint!(out, "I0Echr(", tok, ")")
| I0Eflt(tok) =>
  fprint!(out, "I0Eflt(", tok, ")")
| I0Estr(tok) =>
  fprint!(out, "I0Estr(", tok, ")")
//
| I0Etop(tok) =>
  fprint!(out, "I0Etop(", tok, ")")
//
| I0Evar(d2v) =>
  fprint!(out, "I0Evar(", d2v, ")")
//
| I0Econ1(d2c) =>
  fprint!(out, "I0Econ1(", d2c, ")")
| I0Ecst1(d2c) =>
  fprint!(out, "I0Ecst1(", d2c, ")")
//
| I0Efcon(d2c) =>
  fprint!(out, "I0Efcon(", d2c, ")")
| I0Efcst(d2c) =>
  fprint!(out, "I0Efcst(", d2c, ")")
//
| I0Etcon
  (d2c1, ti3a, ti2s) =>
  fprint!
  ( out
  , "I0Etcon("
  , d2c1, "; ", ti3a, "; ", ti2s, ")")
| I0Etcst
  (d2c1, ti3a, ti2s) =>
  fprint!
  ( out
  , "I0Etcst("
  , d2c1, "; ", ti3a, "; ", ti2s, ")")
//
| I0Etimp
  ( ire1
  , targ, irc2, tsub) =>
  fprint!
  ( out
  , "I0Etimp("
  , ire1, "; "
  , targ, "; ", irc2, "; ", tsub, ")")
//
| I0Edapp
  (irf0, npf1, ires) =>
  fprint!
  ( out
  , "I0Edapp("
  , irf0, "; ", npf1, "; ", ires, ")")
//
| I0Epcon
  (ire1, lab2) =>
  fprint!
  ( out
  , "I0Epcon(", ire1, "; ", lab2, ")")
| I0Epbox
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "I0Epbox("
  , ire1, "; ", lab2, "; ", idx2, ")")
//
| I0Eproj
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "I0Eproj("
  , ire1, "; ", lab2, "; ", idx2, ")")
| I0Eplft
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "I0Eplft("
  , ire1, "; ", lab2, "; ", idx2, ")")
| I0Epptr
  (ire1, lab2, idx2) =>
  fprint!
  ( out
  , "I0Epptr("
  , ire1, "; ", lab2, "; ", idx2, ")")
//
| I0Elet(irds, ire1) =>
  fprint!
  ( out
  , "I0Elet(", irds, "; ", ire1, ")")
| I0Ewhere(ire1, irds) =>
  fprint!
  ( out
  , "I0Ewhere(", ire1, "; ", irds, ")")
//
| I0Eseqn
  (ires, ire1) =>
  fprint!
  ( out
  , "I0Eseqn(", ires, "; ", ire1, ")")
//
| I0Etuple
  (knd0, npf1, ires) =>
  fprint!
  ( out
  , "I0Etuple("
  , knd0, "; ", npf1, "; ", ires, ")")
//
| I0Eassgn(irel, irer) =>
  fprint!
  ( out
  , "I0Eassgn(", irel, "; ", irer, ")")
//
| I0Eif0
  (ire1, ire2, opt3) =>
  fprint!
  ( out, "I0Eif0("
  , ire1, "; ", ire2, "; ", opt3, ")")
//
| I0Ecase
  (knd0, ire1, ircls) =>
  fprint!
  ( out, "I0Ecase("
  , knd0, "; ", ire1, "; ", "...", ")")
//
| I0Elam
  (knd0, farg, body) =>
  fprint!
  ( out, "I0Elam("
  , knd0, "; ", farg, "; ", body, ")")
| I0Efix
  (knd0, d2v0, farg, body) =>
  fprint!
  ( out, "I0Efix("
  , knd0, "; "
  , d2v0, "; ", farg, "; ", body, ")")
//
| I0Etry0(ire1, ircls) =>
  fprint!
  ( out
  , "I0Etry0(", ire1, "; ", "...", ")")
//
| I0Eaddr(ire1) =>
  (
    fprint!(out, "I0Eaddr(", ire1, ")")
  )
| I0Eflat(ire1) =>
  (
    fprint!(out, "I0Eflat(", ire1, ")")
  )
| I0Etalf(ire1) =>
  (
    fprint!(out, "I0Etalf(", ire1, ")")
  )
//
| I0Efold(ire1) =>
  (
    fprint!(out, "I0Efold(", ire1, ")")
  )
//
| I0Eeval
  (knd0, ire1) =>
  fprint!
  ( out
  , "I0Eeval(", knd0, "; ", ire1, ")")
| I0Efree
  (knd0, ire1) =>
  fprint!
  ( out
  , "I0Efree(", knd0, "; ", ire1, ")")
//
| I0Eraise(ire1) =>
  (
    fprint!(out, "I0Eraise(", ire1, ")")
  )
//
| I0Elazy(ire1) =>
  (
    fprint!(out, "I0Elazy(", ire1, ")")
  )
| I0Ellazy
  (ire1, ires(*frees*)) =>
  fprint!
  ( out
  , "I0Ellazy(", ire1, "; ", ires, ")")
//
| I0Enone0(   ) =>
  (
    fprint!(out, "I0Enone0(", ")")
  )
| I0Enone1(d3e1) =>
  (
    fprint!(out, "I0Enone1(", d3e1, ")")
  )
//
)
//
(* ****** ****** *)
//
implement
print_i0gua(x0) =
fprint_i0gua(stdout_ref, x0)
implement
prerr_i0gua(x0) =
fprint_i0gua(stderr_ref, x0)
//
implement
fprint_i0gua
  (out, x0) =
(
case+
x0.node() of
| I0GUAexp(i0e) =>
  fprint!
  (out, "I0GUAexp(", i0e, ")")
| I0GUAmat(i0e, i0p) =>
  fprint!
  (out, "I0GUAmat(", i0e, "; ", i0p, ")")
) (* end of [fprint_i0gua] *)
//
(* ****** ****** *)
//
implement
print_i0clau(x0) =
fprint_i0clau(stdout_ref, x0)
implement
prerr_i0clau(x0) =
fprint_i0clau(stderr_ref, x0)
//
implement
print_i0gpat(x0) =
fprint_i0gpat(stdout_ref, x0)
implement
prerr_i0gpat(x0) =
fprint_i0gpat(stderr_ref, x0)
//
implement
fprint_i0clau
  (out, x0) =
(
case+
x0.node() of
//
|
I0CLAUpat(i0gp) =>
fprint!
(out, "I0CLAUpat(", i0gp, ")")
//
|
I0CLAUexp(i0gp, d0e0) =>
fprint!
(out, "I0CLAUexp(", i0gp, "; ", d0e0, ")")
//
) (* end of [fprint_i0clau] *)
//
implement
fprint_i0gpat
  (out, x0) =
(
case+
x0.node() of
//
|
I0GPATpat(i0p) =>
fprint!
(out, "I0GPATpat(", i0p, ")")
//
|
I0GPATgua(i0p, i0gs) =>
fprint!
(out, "I0GPATgua(", i0p, "; ", i0gs, ")")
//
) (* end of [fprint_i0gpat] *)
//
(* ****** ****** *)
//
implement
print_i0dcl(x0) =
fprint_i0dcl(stdout_ref, x0)
implement
prerr_i0dcl(x0) =
fprint_i0dcl(stderr_ref, x0)
//
local

implement
fprint_val<i0valdecl> = fprint_i0valdecl
implement
fprint_val<i0vardecl> = fprint_i0vardecl
implement
fprint_val<i0fundecl> = fprint_i0fundecl

in(*in-of-local*)

implement
fprint_i0dcl
  (out, x0) =
(
case+ x0.node() of
//
| I0Cstatic
  (tok, irc1) =>
  fprint!
  ( out
  , "I0Cstatic("
  , tok, "; ", irc1, ")")
| I0Cextern
  (tok, irc1) =>
  fprint!
  ( out
  , "I0Cextern("
  , tok, "; ", irc1, ")")
//
| I0Cinclude
  ( tok
  , src, knd
  , fopt, body) =>
  (
  fprint!
  ( out
  , "I0Cinclude("
  , "src= ", src, "; "
  , "knd= ", knd, "; "
  , fopt, "; ", body, ")")
  ) where
  {
    val body =
    (
    case+ body of
    | None _ => "None()"
    | Some _ => "Some(<irdcls>)"): string
  }
//
| I0Clocal
  (head, body) =>
  fprint!
  ( out
  , "I0Clocal("
  , head, "; ", body, ")")
//
| I0Cvaldecl
  (knd, mopt, irds) =>
  fprint!
  ( out
  , "I0Cvaldecl("
  , knd, "; ", mopt, "; ", irds, ")")
//
| I0Cvardecl
  (knd, mopt, irds) =>
  fprint!
  ( out
  , "I0Cvardecl("
  , knd, "; ", mopt, "; ", irds, ")")
//
| I0Cfundecl
  (knd, mopt, tqas, irds) =>
  fprint!
  ( out
  , "I0Cfundecl("
  , knd, "; ", mopt, "; ", tqas, "; ", irds, ")")
//
| I0Cimpdecl3
  ( knd, mopt
  , sqas, tqas, id2c
  , ti3a, ti2s, iras, body) =>
  fprint!
  ( out
  , "I0Cimpdecl3("
  , knd, "; ", mopt, "; "
  , sqas, "; ", tqas, "; ", id2c, "; "
  , ti3a, "; ", ti2s, "; ", iras, "; ", body, ")")
//
| I0Cnone0() =>
    fprint!(out, "I0Cnone0(", ")")
| I0Cnone1(d3cl) =>
    fprint!(out, "I0Cnone1(", d3cl, ")")
//
)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
print_i0valdecl(x0) =
fprint_i0valdecl(stdout_ref, x0)
implement
prerr_i0valdecl(x0) =
fprint_i0valdecl(stderr_ref, x0)
//
implement
fprint_i0valdecl
  (out, x0) = let
//
val+I0VALDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "I0VALDECL@{"
  , ", pat=", rcd.pat
  , ", def=", rcd.def, "}")
end // end of [fprint_i0valdecl]
//
(* ****** ****** *)
//
implement
print_i0vardecl(x0) =
fprint_i0vardecl(stdout_ref, x0)
implement
prerr_i0vardecl(x0) =
fprint_i0vardecl(stderr_ref, x0)
//
implement
fprint_i0vardecl
  (out, x0) = let
//
val+I0VARDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "I0VARDECL@{"
  , ", d2v=", rcd.d2v
  , ", ini=", rcd.ini, "}")
end // end of [fprint_i0vardecl]
//
(* ****** ****** *)
//
implement
print_i0fundecl(x0) =
fprint_i0fundecl(stdout_ref, x0)
implement
prerr_i0fundecl(x0) =
fprint_i0fundecl(stderr_ref, x0)
//
implement
fprint_i0fundecl
  (out, x0) = let
//
val+I0FUNDECL(rcd) = x0
//
in
  fprint!
  ( out
  , "I0FUNDECL@{"
  , ", nam=", rcd.nam
  , ", d2c=", rcd.d2c
  , ", a2g=", rcd.a2g
(*
  , ", a3g=", rcd.a3g
*)
  , ", def=", rcd.def, "}")
end // end of [fprint_i0fundecl]
//
(* ****** ****** *)

(* end of [intrep0_print.dats] *)
