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
// HX-2019-11-02:
// level-1 interpreter for syncheck!
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#include
"./../HATS/libxatsopt.hats"

(* ****** ****** *)
//
overload
fprint with $LAB.fprint_label
//
overload
fprint with $D2E.fprint_d2var
overload
fprint with $D2E.fprint_d2con
overload
fprint with $D2E.fprint_d2cst
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/interp0.sats"
//
(* ****** ****** *)
//
implement
fprint_val<i0val> = fprint_i0val
//
(* ****** ****** *)
//
implement
print_i0val(x0) = 
fprint_i0val(stdout_ref, x0)
implement
prerr_i0val(x0) = 
fprint_i0val(stderr_ref, x0)
//
implement
fprint_i0val
  (out, x0) =
(
case+ x0 of
//
| I0Vnil() =>
  fprint!(out, "I0Vnil()")
//
| I0Vint(i0) =>
  fprint!(out, "I0Vint(", i0, ")")
| I0Vptr(p0) =>
  fprint!(out, "I0Vptr(", p0, ")")
//
| I0Vbtf(b0) =>
  fprint!(out, "I0Vbtf(", b0, ")")
| I0Vchr(c0) =>
  fprint!(out, "I0Vchr(", c0, ")")
//
| I0Vflt(f0) =>
  fprint!(out, "I0Vflt(", f0, ")")
| I0Vstr(s0) =>
  fprint!(out, "I0Vstr(", s0, ")")
//
| I0Vlft(x0) =>
  fprint!(out, "I0Vlft(", x0, ")")
//
| I0Vcon(d2c, arg) =>
  fprint!
  ( out
  , "I0Vcon(", d2c, "; ", arg, ")")
//
| I0Vfun(fopr) =>
  fprint!(out, "I0Vfun(", "...", ")")
//
| I0Vtuple(knd, irvs) =>
  fprint!
  ( out
  , "I0Vtuple(", knd, "; ", irvs, ")")
//
| I0Vlam
  (fenv, iras, ire1) =>
  fprint!(out, "I0Vlam(", "...", ")")
| I0Vfix
  (fenv, d2v0, iras, ire1) =>
  fprint!(out, "I0Vfix(", "...", ")")
| I0Vfixs
  (fenv, d2v0, iras, ire1, ires) =>
  fprint!(out, "I0Vfixs(", "...", ")")
//
| I0Vlazy(irlz) =>
  fprint!(out, "I0Vlazy(", "...", ")")
| I0Vllazy(_, _, _) =>
  fprint!(out, "I0Vllazy(", "...", ")")
//
| I0Verror() =>
  fprint!(out, "I0Verror(", ")")
| I0Vnone1(ire1) =>
  fprint!(out, "I0Vnone1(", ire1, ")")
//
) (* end of [fprint_i0val] *)
//
(* ****** ****** *)
//
implement
print_i0lftval(x0) = 
fprint_i0lftval(stdout_ref, x0)
implement
prerr_i0lftval(x0) = 
fprint_i0lftval(stderr_ref, x0)
//
implement
fprint_i0lftval
  (out, x0) =
(
case+ x0 of
| I0LVref(r0) =>
  fprint!
  ( out
  , "I0LVref(", ref_get_ptr(r0), ")")
//
| I0LVpcon
  (x1, lab) =>
  fprint!
  (out, "I0LVpcon(", x1, "; ", lab, ")")
//
| I0LVpbox
  (x1, lab, idx) =>
  fprint!
  ( out
  , "I0LVpbox(", x1, "; ", lab, "; ", idx, ")")
| I0LVpflt
  (x1, lab, idx) =>
  fprint!
  ( out
  , "I0LVpflt(", x1, "; ", lab, "; ", idx, ")")
//
) (* end of [fprint_i0lftval] *)
//
(* ****** ****** *)

(* end of [xint_interp0_print.dats] *)
