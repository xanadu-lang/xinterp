(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// HX-2019-11-02: level-1 interpreter
//
(* ****** ****** *)

#define
XATSOPT_targetloc
"./../../xatsopt/srcgen/xats"

(* ****** ****** *)

#staload
LAB =
"{$XATSOPT}/SATS/xlabel0.sats"
#staload
D2E =
"{$XATSOPT}/SATS/dynexp2.sats"

(* ****** ****** *)

typedef label = $LAB.label

(* ****** ****** *)

typedef d2var = $D2E.d2var
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst

(* ****** ****** *)

#staload INT = "./intrep0.sats"

(* ****** ****** *)

typedef i0pat = $INT.i0pat
typedef i0arg = $INT.i0arg
typedef i0exp = $INT.i0exp
typedef i0dcl = $INT.i0dcl

typedef i0gua = $INT.i0gua
typedef i0gpat = $INT.i0gpat
typedef i0clau = $INT.i0clau

typedef i0patlst = $INT.i0patlst
typedef i0arglst = $INT.i0arglst
typedef i0explst = $INT.i0explst
typedef i0expopt = $INT.i0expopt
typedef i0dclist = $INT.i0dclist

typedef i0gualst = $INT.i0gualst
typedef i0claulst = $INT.i0claulst

typedef i0valdecl = $INT.i0valdecl
typedef i0vardecl = $INT.i0vardecl
typedef i0fundecl = $INT.i0fundecl
typedef i0valdeclist = $INT.i0valdeclist
typedef i0vardeclist = $INT.i0vardeclist
typedef i0fundeclist = $INT.i0fundeclist

(* ****** ****** *)

abstype i0env_tbox = ptr
typedef i0env = i0env_tbox

(* ****** ****** *)
//
datatype
i0val =
//
| I0Vnil of ()
//
| I0Vint of int
| I0Vptr of ptr
//
| I0Vbtf of bool
| I0Vchr of char
//
| I0Vflt of double
| I0Vstr of string
//
(*
| I0Vvar of d2var
| I0Vcon of d2con
| I0Vcst of d2cst
*)
//
| I0Vlft of i0lftval
//
| I0Vcon of
    (d2con, i0valist)
//
| I0Vfun of i0valfun
//
| I0Vtuple of
  (int(*knd*), i0valist)
//
| I0Vlam of
  (i0env, i0arglst, i0exp)
| I0Vfix of
  (i0env, d2var, i0arglst, i0exp)
(*
| I0Vfix2 of
  ( i0env
  , d2var(*f*)
  , i0arglst, i0exp, i0exp)
*)
| I0Vfixs of
  ( i0env
  , d2var(*f*)
  , i0arglst, i0exp, i0explst)
//
| I0Vlazy of ref(i0lazval)
| I0Vllazy of
  ( i0env
  , i0exp(*eval*), i0explst(*frees*))
//
| I0Verror of () | I0Vnone1 of (i0exp)
//
and
i0lftval =
| I0LVref of ref(i0valopt)
//
| I0LVpcon of (i0val, label)
//
| I0LVpbox of
  (i0val, label, int(*index*))
| I0LVpflt of
  (i0lftval, label, int(*index*))
//
and
i0lazval =
| I0LVval of i0val(*value*)
| I0LVexp of (i0env, i0exp) // thunk
//
where
//
i0valist = List0(i0val)
and
i0valopt = Option(i0val)
and
i0valfun = (i0valist -<cloref1> i0val)
//
(* ****** ****** *)
//
fun
print_i0val: print_type(i0val)
fun
prerr_i0val: prerr_type(i0val)
overload print with print_i0val
overload prerr with prerr_i0val
//
fun
fprint_i0val: fprint_type(i0val)
overload fprint with fprint_i0val
//
(* ****** ****** *)
//
fun
print_i0lftval(i0lftval): void
fun
prerr_i0lftval(i0lftval): void
fun
fprint_i0lftval: fprint_type i0lftval
//
overload print with print_i0lftval
overload prerr with prerr_i0lftval
overload fprint with fprint_i0lftval
//
(* ****** ****** *)

exception I0EXN of i0val

(* ****** ****** *)

absvtype intpenv_vtbox = ptr
vtypedef intpenv = intpenv_vtbox

(* ****** ****** *)
//
fun
i0env_make_nil(): i0env
//
fun
intpenv_make_nil(): intpenv
fun
intpenv_make_fenv(i0env): intpenv
//
(* ****** ****** *)
//
fun
intpenv_take_fenv(!intpenv): i0env
//
(* ****** ****** *)
//
fun
intpenv_bind_fix(!intpenv, i0val): void
fun
intpenv_bind_fixs(!intpenv, i0val): void
//
(* ****** ****** *)
//
fun
intpenv_pop0_let1(!intpenv): void
fun
intpenv_push_let1(!intpenv): void
//
(* ****** ****** *)
//
fun
intpenv_pop0_try1(!intpenv): void
fun
intpenv_push_try1(!intpenv): void
//
(* ****** ****** *)
//
fun
intpenv_free_nil(env: intpenv): void
fun
intpenv_free_fenv(env: intpenv): void
//
(* ****** ****** *)

fun
interp0_search_d2cst
( env
: !intpenv
, d2c: d2cst): Option_vt(i0val)
fun
interp0_search_d2var
( env
: !intpenv
, d2v: d2var): Option_vt(i0val)

(* ****** ****** *)
//
fun
interp0_insert_d2cst
( env
: !intpenv
, d2c: d2cst, irv: i0val): void
//
fun
interp0_insert_d2var
( env
: !intpenv
, d2v: d2var, irv: i0val): void
//
(* ****** ****** *)
//
fun
interp0_irdcl
(env: !intpenv, irc: i0dcl): void
fun
interp0_irdclist
(env: !intpenv, ircs: i0dclist): void
//
fun
interp0_irexp
(env: !intpenv, ire: i0exp): i0val
fun
interp0_irexplst
(env: !intpenv, ires: i0explst): i0valist
fun
interp0_irexpopt
(env: !intpenv, opt0: i0expopt): i0valopt
//
(* ****** ****** *)
//
fun
interp0_fcall_lam
(irf0: i0val, irvs: i0valist): i0val
fun
interp0_fcall_fix
(irf0: i0val, irvs: i0valist): i0val
fun
interp0_fcall_fixs
(irf0: i0val, irvs: i0valist): i0val
//
(* ****** ****** *)
//
fun
interp0_irpat_ck0
(irp0: i0pat, irv0: i0val): bool
fun
interp0_irpatlst_ck0
(irps: i0patlst, irvs: i0valist): bool
//
fun
interp0_irpat_ck1
( env
: !intpenv
, irp0: i0pat, irv0: i0val): void
fun
interp0_irpatlst_ck1
( env
: !intpenv
, irps: i0patlst, irvs: i0valist): void
//
(* ****** ****** *)
//
fun
interp0_irgpat_ck2
( env
: !intpenv
, irgp: i0gpat, irv0: i0val): bool
//
fun
interp0_irgua_ck2
(env: !intpenv, irg0: i0gua): bool
fun
interp0_irgualst_ck2
(env: !intpenv, irgs: i0gualst): bool
//
(* ****** ****** *)
//
fun
interp0_irclau
( env
: !intpenv
, irv0: i0val
, ircl: i0clau): Option_vt(i0val)
fun
interp0_irclaulst
( env
: !intpenv
, irv0: i0val
, ircls: i0claulst): Option_vt(i0val)
//
(* ****** ****** *)

fun
interp0_i0valdecl
(env: !intpenv, irvd: i0valdecl): void
fun
interp0_i0valdeclist
(env: !intpenv, irvds: i0valdeclist): void

(* ****** ****** *)

fun
interp0_i0vardecl
(env: !intpenv, irvd: i0vardecl): void
fun
interp0_i0vardeclist
(env: !intpenv, irvds: i0vardeclist): void

(* ****** ****** *)

fun
interp0_i0fundecl
(env: !intpenv, irfd: i0fundecl): void
fun
interp0_i0fundeclist
(env: !intpenv, irfds: i0fundeclist): void

(* ****** ****** *)
//
fun
interp0_i0impdecl3
(env: !intpenv, irdcl: i0dcl(*impdecl3*)): void
//
(* ****** ****** *)

//
fun
interp0_initize(): void
//
fun
interp0_initize_gint(): void
//
(* ****** ****** *)

fun
interp0_program(xs: i0dclist): void

(* ****** ****** *)
//
fun
interp0_fprint_d2cstmap(FILEref): void
fun
interp0_fprint_d2varmap(FILEref): void
//
(* ****** ****** *)

(* end of [xint_interp0.sats] *)
