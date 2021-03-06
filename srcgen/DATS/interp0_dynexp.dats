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
// HX-2019-11-10:
// level-1 interpreter for syncheck!
//
(* ****** ****** *)
//
#include
"share\
/atspre_staload.hats"
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
//
overload
print with $D2E.print_d2con
overload
print with $D2E.print_d2cst
overload
print with $D2E.print_d2var
//
overload
print with $D2E.print_impld2cst
//
overload = with $D2E.eq_d2con_d2con
overload = with $D2E.eq_d2cst_d2cst
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
extern
fun
xatsopt_chrunq
( source // '<char>' -> <char>
: string
) : char = "ext#xatsopt_chrunq"
extern
fun
xatsopt_strunq
( source//"<string>" -> <string>
: string
) : string = "ext#xatsopt_strunq"
//
(* ****** ****** *)
//
extern
fun
pcon_lab2idx
(lab2: label): int(*index*)
//
implement
pcon_lab2idx
  (lab2) =
let
val
opt = lab2.int()
in
case- opt of ~Some_vt(idx2) => idx2
end // end of [pcon_lab2idx]
//
(* ****** ****** *)
local
//
fun
auxget_at
( irvs
: i0valist
, i0: int): i0val =
(
case- irvs of
(*
|
list_nil
() => I0Verror()
*)
|
list_cons
(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)
//
in(* in-of-local *)
//
fun
i0val_con_arg
( irv0
: i0val, i0: int): i0val =
(
  auxget_at(irvs, i0)
) where
{
val-I0Vcon(d2c1, irvs) = irv0
}
//
fun
i0val_tup_arg
( irv0
: i0val, i0: int): i0val =
(
  auxget_at(irvs, i0)
) where
{
val-I0Vtuple(knd0, irvs) = irv0
}
//
end // end of [local]
(* ****** ****** *)

implement
interp0_program
  (dcls) =
let
//
val () =
interp0_initize()
//
val
env0 =
intpenv_make_nil()
//
val () =
interp0_irdclist(env0, dcls)
//
val () = intpenv_free_nil(env0)
//
in
  // nothing
end // end of [interp0_program]

(* ****** ****** *)
//
extern
fun
interp0_irexp_fun
(env: !intpenv, ire: i0exp): i0val
//
implement
interp0_irexp_fun
  (env0, ire0) =
let
val env0 =
$UN.castvwtp1{ptr}(env0)
in
try
irv0 where
{
val
env0 =
$UN.castvwtp0{intpenv}(env0)
val
irv0 = interp0_irexp(env0, ire0)
prval
((*void*)) = $UN.cast2void(env0)
}
with exn =>
let
val
env0 =
$UN.castvwtp0{intpenv}(env0)
val () = intpenv_free_fenv(env0) in $raise(exn)
end
end // end of [interp0_irexp_fun]
//
(* ****** ****** *)
//
extern
fun
interp0_irexp_try0
(env: !intpenv, ire: i0exp): i0val
//
implement
interp0_irexp_try0
  (env0, ire0) =
let
val env0 =
$UN.castvwtp1{ptr}(env0)
in
try
irv0 where
{
val
env0 =
$UN.castvwtp0{intpenv}(env0)
val
irv0 = interp0_irexp(env0, ire0)
prval
((*void*)) = $UN.cast2void(env0)
}
with exn =>
let
val
env0 =
$UN.castvwtp1{intpenv}(env0)
val () = intpenv_pop0_try1(env0)
prval
((*void*)) = $UN.cast2void(env0) in $raise(exn)
end
end // end of [interp0_irexp_try0]
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxi00
( ire0
: i0exp): i0val =
I0Vint(int) where
{
val-
I0Ei00(int) = ire0.node()
} (* end of [auxi00] *)

fun
auxs00
( ire0
: i0exp): i0val =
I0Vstr(str) where
{
val-
I0Es00(str) = ire0.node()
} (* end of [auxs00] *)

(* ****** ****** *)

fun
auxint
( ire0
: i0exp): i0val =
(
I0Vint(token2dint(tok))
) where
{
val-
I0Eint(tok) = ire0.node()
} (* end of [auxint] *)

(* ****** ****** *)

(*
fun
auxbtf
( ire0
: i0exp): i0val =
let
val-
I0Ebtf(tok) = ire0.node()
in(*in-of-let*)
//
case-
tok.node() of
|
T_IDENT_alp(rep) =>
(
//
// HX-2019-11-18:
// [rep] is "true" or "false"
//
I0Vbtf
(ifval(c0 = 't', true, false))
) where
{
  val p0 = string2ptr(rep)
  val c0 = $UN.ptr0_get<char>(p0)
}
//
end // end of [auxbtf]
*)
fun
auxbtf
( ire0
: i0exp): i0val =
(
I0Vbtf(token2dbtf(tok))
) where
{
val-I0Ebtf(tok) = ire0.node()
} (* end of [auxbtf] *)

(* ****** ****** *)

fun
auxchr
( ire0
: i0exp): i0val =
(
I0Vchr(token2dchr(tok))
) where
{
val-I0Echr(tok) = ire0.node()
} (* end of [auxchr] *)

(* ****** ****** *)

fun
auxflt
( ire0
: i0exp): i0val =
(
I0Vflt(token2dflt(tok))
) where
{
val-I0Eflt(tok) = ire0.node()
} (* end of [auxflt] *)

fun
auxstr
( ire0
: i0exp): i0val =
(
I0Vstr(token2dstr(tok))
) where
{
val-I0Estr(tok) = ire0.node()
} (* end of [auxstr] *)

(* ****** ****** *)

fun
auxtop
( ire0
: i0exp): i0val =
(
  I0Vnil() ) where
{
val-I0Etop(tok) = ire0.node()
}

(* ****** ****** *)

fun
auxvar
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
val-
I0Evar(d2v) = ire0.node()
val
opt =
interp0_search_d2var(env0, d2v)
//
(*
val () =
println!("auxvar: d2v = ", d2v)
*)
//
in
case- opt of ~Some_vt(irv) => irv
end // end of [auxvar]

(* ****** ****** *)

fun
auxcon1
( env0
: !intpenv
, ire0
: i0exp): i0val =
I0Vfun
(
lam(arg) => I0Vcon(d2c0, arg)
) where
{
val-I0Econ1(d2c0) = ire0.node()
}

(* ****** ****** *)

fun
auxfcon
( env0
: !intpenv
, ire0
: i0exp): i0val =
I0Vfun
(
lam(arg) => I0Vcon(d2c0, arg)
) where
{
val-I0Efcon(d2c0) = ire0.node()
}

(* ****** ****** *)

fun
auxfcst
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
// (*
val () =
println!
("auxfcst: ire0 = ", ire0)
// *)
//
val-
I0Efcst(d2c) = ire0.node()
//
in
//
if
$D2E.d2cst_fcastq(d2c)
then
I0Vfun
(
lam(vs) =>
let
val-
list_cons(v0, _) = vs in v0 
end
) (* end of [then] *)
else
(
  case-
  opt of ~Some_vt(irf) => irf
) where
{
val
opt =
interp0_search_d2cst(env0, d2c)
} (* end of [else] *)
//
end // end of [auxfcst]

(* ****** ****** *)

fun
auxtcon
( env0
: !intpenv
, ire0
: i0exp): i0val =
I0Vfun
(
lam(arg) => I0Vcon(d2c0, arg)
) where
{
val-I0Etcon(d2c0, _, _) = ire0.node()
}

(* ****** ****** *)

fun
auxtimp
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Etimp
( ire1, targ
, ircl, tsub) = ire0.node()
val-
I0Etcst
( d2c0
, ti3a, ti2s) = ire1.node()
//
(*
val () =
println!("auxtimp: ire0 = ", ire0)
val () =
println!("auxtimp: ire1 = ", ire1)
*)
//
fun
auxirfd0
( fenv
: i0env
, irfd0
: i0fundecl): i0val =
let
//
val-
I0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
//
val-
Some(iras) = rcd.a3g
val-
Some(body) = rcd.def
//
in
//
case+ iras of
|
list_nil _ =>
(
case-
body.node() of
|
I0Elam
(knd, iras, body) =>
I0Vfix(fenv, nam, iras, body)
)
|
list_cons _ =>
I0Vfix(fenv, nam, iras, body)
//
end // end of [auxirfd0]
//
fun
auxfixs
( irfds
: i0fundeclist
) : i0explst =
(
case+
irfds of
|
list_nil() =>
list_nil()
|
list_cons
(irfd0, irfds) =>
let
val+
I0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
//
in
//
case+ a3g of
|
None() =>
auxfixs(irfds)
|
Some(iras) =>
(
case+ def of
|
None() =>
auxfixs(irfds)
|
Some(body) =>
(
case+ iras of
|
list_nil _ =>
(
case+
body.node() of
|
I0Elam
(knd, iras, ire2) =>
let
val ire1 =
i0exp_make_node
(
body.loc()
,
I0Efix(knd, nam, iras, ire2)
) (* end of [val] *)
in
list_cons(ire1, auxfixs(irfds))
end // end of [I0Elam]
//
(*
|
I0Efix
(knd, d2v, iras, ire2) =>
let
val irdf =
i0exp_make_node
(
body.loc()
,
I0Efix(knd, nam, iras, ire2)
)
in
list_cons
( irdf
, list_cons(body, auxfixs(irfds)))
end
*)
//
| _(*rest-of-i0exp*) =>
  list_cons(body, auxfixs(irfds))
)
|
list_cons _ =>
let
val ire1 =
i0exp_make_node
(
rcd.loc
,
I0Efix
(0(*knd*), nam, iras, body)
) (* end of [val] *)
in
  list_cons(ire1, auxfixs(irfds))
end 
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end (* end of [list_cons] *) ) (*auxfixs*)
//
fun
auxirfds
( fenv
: i0env
, irdfs
: i0explst
, irfds
: i0fundeclist
) : i0val =
(
case-
irfds of
(*
|
list_nil() =>
I0Verror()
*)
|
list_cons
(irfd0, irfds) =>
let
val+
I0FUNDECL
  (rcd) = irfd0
in
//
if
(d2c0 = rcd.d2c)
then let
//
val nam = rcd.nam
//
val-
Some(iras) = rcd.a3g
val-
Some(body) = rcd.def
//
in
//
case+
iras of
|
list_nil() =>
(
case-
body.node() of
I0Elam
(knd, iras, body) =>
I0Vfixs
(fenv, nam, iras, body, irdfs)
) (* end of [list_nil] *)
|
list_cons _ =>
I0Vfixs
(fenv, nam, iras, body, irdfs)
//
end // end of [then]
else auxirfds(fenv, irdfs, irfds)
//
end // end of [list_cons]
)
//
in
//
case-
ircl.node() of
|
I0Cfundecl
( knd0, mopt
, tqas, irfds) =>
let
//
val
fenv =
intpenv_take_fenv(env0)
//
val-
list_cons(irfd0, xs) = irfds
//
in
//
case- xs of
| list_nil _ =>
  auxirfd0(fenv, irfd0)
| list_cons _ =>
  let
  val
  irdfs = auxfixs(irfds)
  in
  auxirfds(fenv, irdfs, irfds)
  end
//
end
|
I0Cimpdecl3
( knd0, mopt
, sqas, tqas, id2c
, ti3a, ti2s, iras, body
) =>
(
//
case+ iras of
|
list_nil _ =>
interp0_irexp(env0, body)
|
list_cons _ =>
let
val
fenv =
intpenv_take_fenv(env0)
in
  I0Vlam(fenv, iras, body)
end
//
) (* I0Cimpdecl3 *)
//
end // end of [auxtimp]

(* ****** ****** *)

fun
auxdapp
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Edapp
( irf0
, npf1
, ires) = ire0.node()
//
val
irf0 =
auxdfun(env0, irf0)
val
irvs =
auxdarg(env0, npf1, ires)
//
// (*
//
val loc0 = ire0.loc()
//
val () =
println!
("auxdapp: loc0 = ", loc0)
val () =
println!
("auxdapp: ire0 = ", ire0)
val () =
println!
("auxdapp: irf0 = ", irf0)
val () =
println!
("auxdapp: irvs = ", irvs)
// *)
//
in
//
case- irf0 of
//
| I0Vfun(fopr) => fopr(irvs)
//
| I0Vlam(_, _, _) =>
  interp0_fcall_lam(irf0, irvs)
| I0Vfix(_, _, _, _) =>
  interp0_fcall_fix(irf0, irvs)
| I0Vfixs(_, _, _, _, _) =>
  interp0_fcall_fixs(irf0, irvs)
//
end // end of [auxdapp]

and
auxdfun
( env0
: !intpenv
, irf0
: i0exp): i0val = 
(
  interp0_irexp(env0, irf0)
)

and
auxdarg
( env0
: !intpenv
, npf1: int
, ires
: i0explst): i0valist = 
(
case+ ires of
| list_nil() =>
  list_nil()
| list_cons(ire1, ires) =>
  (
  if
  npf1 >= 1
  then
  (
    auxdarg(env0, npf1-1, ires)
  )
  else let
    val irv1 =
    interp0_irexp(env0, ire1)
  in
    list_cons
    ( irv1
    , auxdarg(env0, npf1, ires))
  end // end of [else]    
  )
) (* end of [auxdarg] *)

(* ****** ****** *)

local

fun
auxget_at
( irvs
: i0valist
, i0: int): i0val =
(
case-
irvs of
(*
|
list_nil
() => I0Verror()
*)
|
list_cons(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)

in(* in-of-local*)

fun
auxpcon
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
val-
I0Epcon
( ire1
, lab2) = ire0.node()
val
irv1 =
interp0_irexp(env0, ire1)
in
case- irv1 of
|
I0Vcon
(d2c1, irvs) =>
(
  auxget_at(irvs, idx2)
) where
{
  val
  idx2 = pcon_lab2idx(lab2)
}
end // end of [auxpcon]

fun
auxpbox
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
val-
I0Epbox
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
interp0_irexp(env0, ire1)
in
//
case- irv1 of
|
I0Vtuple
(knd, irvs) =>
auxget_at(irvs, idx2)
//
end // end of [auxpbox]

fun
auxproj
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val
loc0 = ire0.loc()
val () =
println!
("auxproj: loc0 = ", loc0)
val () =
println!
("auxproj: ire0 = ", ire0)
//
val-
I0Eproj
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
interp0_irexp(env0, ire1)
in
//
case- irv1 of
|
I0Vtuple
(knd, irvs) => auxget_at(irvs, idx2)
//
end // end of [auxproj]

fun
auxplft
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
val-
I0Eplft
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
interp0_irexp(env0, ire1)
in
//
case- irv1 of
|
I0Vlft(irlv) =>
I0Vlft(I0LVpflt(irlv, lab2, idx2))
//
end // end of [auxplft]

fun
auxpptr
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
val-
I0Epptr
( ire1
, lab2
, idx2) = ire0.node()
val
irv1 =
interp0_irexp(env0, ire1)
in
//
case- irv1 of
|
I0Vlft(irlv) =>
I0Vlft(I0LVpflt(irlv, lab2, idx2))
//
end // end of [auxpptr]

end // end of [local]

(* ****** ****** *)

fun
aux_let
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Elet
( ircs
, ire1) = ire0.node()
//
val () =
intpenv_push_let1(env0)
//
val () =
interp0_irdclist(env0, ircs)
//
val
irv0 = interp0_irexp(env0, ire1)
//
in
let
val () =
intpenv_pop0_let1(env0) in irv0 end
end // end of [aux_let]

fun
aux_where
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Ewhere
( ire1
, ircs) = ire0.node()
//
val () =
intpenv_push_let1(env0)
//
val () =
interp0_irdclist(env0, ircs)
//
val
irv0 = interp0_irexp(env0, ire1)
//
in
let
val () =
intpenv_pop0_let1(env0) in irv0 end
end // end of [aux_where]

(* ****** ****** *)

fun
aux_seqn
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Eseqn
( ires
, ire1) = ire0.node()
//
in
let
fun
auxlst
( env0
: !intpenv
, ires
: i0explst): void =
(
case+ ires of
| list_nil() => ()
| list_cons
  (irea, ires) =>
  (
  auxlst(env0, ires)
  ) where
  {
(*
  val () =
  println!
  ("auxlst: irea = ", irea)
*)
  val-
  I0Vnil() = irva where
  {
  val irva =
  interp0_irexp(env0, irea)
(*
  val ((*void*)) =
  println!("auxlst: irva = ", irva)
*)
  }
//
  } (* where *)
) (* end of [auxlst] *)
val () =
  auxlst(env0, ires)
in
  interp0_irexp(env0, ire1)
end
end // end of [aux_seqn]

(* ****** ****** *)

fun
aux_tuple
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Etuple
( knd0
, npf1
, ires) = ire0.node()
//
fun
auxlst
( env0
: !intpenv
, npf1: int
, ires
: i0explst
) : i0valist =
(
case+ ires of
|
list_nil() =>
list_nil()
|
list_cons
(ire1, ires) =>
(
if
(npf1 > 0)
then
auxlst(env0, npf1-1, ires)
else
(
list_cons
( irv1
, auxlst(env0, npf1-1, ires))
) where
{
val
irv1 = interp0_irexp(env0, ire1)
}
) (* end of [list_cons] *)
)
//
in
(
if
(knd0 > 0)
then
I0Vtuple(knd0, irvs)
else
(
case+ irvs of
|
list_nil _ => I0Vnil()
|
list_cons _ => I0Vtuple(knd0, irvs)
)
) where
{
  val irvs = auxlst(env0, npf1, ires)
}
end // end of [aux_tuple]

(* ****** ****** *)

local

fun
auxget_at
( irvs
: i0valist
, i0: int): i0val =
(
case-
irvs of
(*
|
list_nil
() => I0Verror()
*)
|
list_cons(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)

(* ****** ****** *)

fun
auxfset_at
( irvs
: i0valist
, i0: int
, irvr: i0val): i0valist =
(
case+ irvs of
|
list_nil() => list_nil()
|
list_cons
(irv0, irvs) =>
(
if
(i0 <= 0)
then
list_cons(irvr, irvs)
else
list_cons
(
irv0
,
let
val i1 = i0 - 1
in
auxfset_at(irvs, i1, irvr)
end
)
)
//
) (* end of [auxfset_at] *)

(* ****** ****** *)

fun
auxlset_at
( xs
: !List0_vt(i0val)
, i0: int, y0: i0val): void =
(
case+ xs of
|list_vt_nil() => ()
|
@list_vt_cons(x0, xs1) =>
(
 if
 (i0 <= 0)
 then 
 fold@(xs) where
 {
   val () = (x0 := y0)
 }
 else
 fold@(xs) where
 {
   val () = auxlset_at(xs1, i0-1, y0)
 }
) (* list_vt_cons *)
) (* end of [auxlset_at] *)

in(*in-of-local*)

fun
aux_assgn
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Eassgn
( irel
, irer) = ire0.node()
val
irvl = 
interp0_irexp(env0, irel)
val
irvr = 
interp0_irexp(env0, irer)
//
val () =
println!
("aux_assgn: ire0 = ", ire0)
val () =
println!
("aux_assgn: irvl = ", irvl)
val () =
println!
("aux_assgn: irvr = ", irvr)
//
in
case- irvl of
|
I0Vlft(irlv) =>
(
case+ irlv of
|
I0LVref(r0) =>
(
  I0Vnil(*void*)
) where
{
  val () =
  ( r0[] := Some(irvr) )
} (* end of [I0LVref] *)
|
//
I0LVpcon
(_, lab2) =>
(
  I0Vnil(*void*)
) where
{
val () =
aux_assgn_pcon(irvr, irlv)
}
//
|
I0LVpbox
(_, _, _) =>
(
  I0Vnil(*void*)
) where
{
val () =
aux_assgn_pbox(irvr, irlv)
}
|
I0LVpflt
(_, _, _) =>
(
  I0Vnil(*void*)
) where
{
val () =
aux_assgn_pflt(irvr, irlv)
}
)
|
I0Vptr(p0) =>
(
  I0Vnil()
) where
{
val () =
$UN.ptr0_set<i0val>(p0, irvr)
}
//
end // end of [aux_assgn]
//
and
aux_assgn_pcon
( irvr: i0val
, irlv: i0lftval): void =
let
//
val-
I0LVpcon
(irv1, lab2) = irlv
val
idx2 = pcon_lab2idx(lab2)
//
val-
I0Vcon(d2c1, irvs) = irv1
//
in
{
//
typedef x0 = i0val
//
val
irvs =
$UN.castvwtp0
{List0_vt(x0)}(irvs)
//
val () =
auxlset_at(irvs, idx2, irvr)
//
prval () = $UN.cast2void(irvs)
//
}
end
// end of [aux_assgn_pcon]
//
and
aux_assgn_pbox
( irvr: i0val
, irlv: i0lftval): void =
let
//
val-
I0LVpbox
(irv1, _, idx2) = irlv
//
val-
I0Vtuple(knd, irvs) = irv1
val () = assertloc(knd > 0)
//
in
{
//
typedef x0 = i0val
//
val
irvs =
$UN.castvwtp0
{List0_vt(x0)}(irvs)
//
val () =
auxlset_at(irvs, idx2, irvr)
//
prval () = $UN.cast2void(irvs)
//
}
end
// end of [aux_assgn_pbox]
and
aux_assgn_pflt
( irvr: i0val
, irlv: i0lftval) : void =
let
val
irvs = auxlst_up(irlv)
val-
list_cons(_, irvs) = irvs
in
auxlst_dn(irvr, irvs, irlv)
end where
{
//
fun
auxlst_up
( irlv
: i0lftval): i0valist =
(
case- irlv of
| I0LVref(r0) =>
  (
    list_sing(x0)
  ) where
  {
    val-Some(x0) = r0[]
  }
| I0LVpflt
  (irlv, lab2, idx2) =>
  let
  val
  irvs = auxlst_up(irlv)
  val-
  list_cons(irv1, _) = irvs
  in
  //
  case- irv1 of
  | I0Vtuple
    (knd, xs) =>
    list_cons
    (auxget_at(xs, idx2), irvs)
  //
  end // end of [I0Vproj]
)
//
fun
auxlst_dn
( irvr: i0val
, irvs: i0valist
, irlv: i0lftval): void =
(
case- irlv of
|
I0LVref(r0) =>
(r0[] := Some(irvr))
|
I0LVpflt
(irlv, lab2, idx2) =>
auxlst_dn
(irvr, irvs, irlv) where
{
  val-
  list_cons
  (irv1, irvs) = irvs
  val irvr = 
  let
  val-
  I0Vtuple(knd, xs) = irv1
  in
  I0Vtuple
  ( knd
  , auxfset_at(xs, idx2, irvr))
  end
}
) (* end of [auxlst_dn] *)
//
} (* end of [aux_assgn_pflt] *)

end // end of [local]

(* ****** ****** *)

fun
aux_ift1
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Eift1
( ire1
, ire2
, opt3) = ire0.node()
//
val
irv1 =
interp0_irexp(env0, ire1)
//
(*
val () =
println!
("aux_ift1: ire1 = ", ire1)
val () =
println!
("aux_ift1: irv1 = ", irv1)
*)
//
in
//
case- irv1 of
|
I0Vbtf(btf) =>
if
btf
then
interp0_irexp(env0, ire2)
else
(
case+ opt3 of
| None() => I0Vnil()
| Some(ire3) =>
  interp0_irexp(env0, ire3)
)
//
end // end of [aux_ift1]

(* ****** ****** *)

fun
aux_case
( env0
: !intpenv
, ire0
: i0exp): i0val =
(
case- opt2 of
(*
| ~None_vt() =>
   I0Verror((*void*))
*)
| ~Some_vt(irv2) => irv2
) where
{
//
val-
I0Ecase
( knd
, ire1
, ircls) = ire0.node()
//
// (*
//
val loc0 = ire0.loc()
//
val () =
println!("aux_case: loc0 = ", loc0)
val () =
println!("aux_case: ire0 = ", ire0)
// *)
//
val
irv1 =
interp0_irexp(env0, ire1)
//
(*
val () =
println!("aux_case: irv1 = ", irv1)
*)
//
val
opt2 =
interp0_irclaulst(env0, irv1, ircls)
//
} (* end of [aux_case] *)

(* ****** ****** *)

fun
aux_lam
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
val-
I0Elam
( knd0
, iras, body) = ire0.node()
in
(
  I0Vlam
  (fenv, iras(*arg*), body)
) where
{
  val
  fenv = intpenv_take_fenv(env0)
}
end // end of [aux_lam]

fun
aux_fix
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
val-
I0Efix
( knd0
, d2v0
, iras, body) = ire0.node()
in
(
I0Vfix
( fenv
, d2v0(*fid*), iras(*arg*), body)
) where
{
  val
  fenv = intpenv_take_fenv(env0)
}
end // end of [aux_fix]

(* ****** ****** *)

fun
aux_try0
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Etry0
( ire1
, ircls) = ire0.node()
//
val () =
intpenv_push_try1(env0)
//
val env0 =
$UN.castvwtp1{ptr}(env0)
//
in
//
try
let
val
env0 =
$UN.castvwtp0{intpenv}(env0)
val
irv1 =
interp0_irexp_try0(env0, ire1)
val () = intpenv_pop0_try1(env0)
//
prval
((*void*)) = $UN.cast2void(env0)
in
  irv1
end
with
~I0EXN(irx1) =>
let
val
env0 =
$UN.castvwtp0{intpenv}(env0)
val
opt2 =
interp0_irclaulst(env0, irx1, ircls)
prval ((*void*)) = $UN.cast2void(env0)
in
case- opt2 of
(*
| ~None_vt() =>
   I0Verror((*void*))
*)
| ~Some_vt(irv2) => irv2
end
//
end (* end of [aux_try0] *)

(* ****** ****** *)
//
fun
aux_addr
( env0
: !intpenv
, ire0: i0exp): i0val =
let
//
(*
val () =
println!
("aux_addr: ire0 = ", ire0)
*)
//
val-
I0Eaddr(ire1) = ire0.node()
//
in
//
case-
ire1.node() of
|
I0Eflat(ire2) => 
(
  interp0_irexp(env0, ire2)
)
|
I0Eeval(1(*ptr*), ire2) =>
(
  interp0_irexp(env0, ire2)
)
|
I0Epcon
(ire2, lab2) =>
let
val
irv2 =
interp0_irexp(env0, ire2)
in
I0Vlft(I0LVpcon(irv2, lab2))
end
|
I0Epbox
(ire2, lab2, idx2) =>
let
val
irv2 =
interp0_irexp(env0, ire2)
in
I0Vlft(I0LVpbox(irv2, lab2, idx2))
end
//
end // end of [aux_addr]
//
(* ****** ****** *)

fun
aux_eval
( env0
: !intpenv
, ire0: i0exp): i0val =
let
//
val loc0 = ire0.loc()
//
val-
I0Eeval
(knd0, ire1) = ire0.node()
//
val
irv1 = interp0_irexp(env0, ire1)
//
// (*
val () =
println!("aux_eval: loc0 = ", loc0)
val () =
println!("aux_eval: ire1 = ", ire1)
val () =
println!("aux_eval: irv1 = ", irv1)
// *)
//
in
//
case- irv1 of
//
| I0Vlft
  (irlv) =>
  aux_eval_left(irlv)
//
| I0Vptr
  (ptr0) =>
  $UN.ptr0_get<i0val>(ptr0)
//
| I0Vlazy
  (ref0) => aux_eval_lazy(ref0)
//
| I0Vllazy
  (fenv, ire1, ires) =>
  aux_eval_llazy(fenv, ire1, ires)
//
end // end of [aux_eval]
//
and
aux_eval_left
(x0: i0lftval): i0val =
let
//
fun
auxget_at
( irvs
: i0valist
, i0: int): i0val =
(
case-
irvs of
(*
|
list_nil
() => I0Verror()
*)
|
list_cons(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)
in
case- x0 of
|
I0LVref(r0) =>
let
  val-Some(irv0) = r0[] in irv0
end
|
I0LVpcon
(irv1, lab2) =>
let
val-
I0Vcon
(d2c1, irvs) = irv1
in
(
  auxget_at(irvs, idx2)
) where
{
  val idx2 = pcon_lab2idx(lab2)
}
end
|
I0LVpflt
(x1, lab2, idx2) =>
let
val
irv1 = aux_eval_left(x1)
in
//
case- irv1 of
|
I0Vtuple(knd, irvs) =>
let
val () = // flat
assertloc(knd=0) in auxget_at(irvs, idx2)
end
//
end
end (* end of [aux_eval_left] *)
//
and
aux_eval_lazy
( r0
: ref(i0lazval)): i0val =
(
case+ r0[] of
//
|
I0LVval(irv2) => irv2
//
|
I0LVexp(fenv, ire2) =>
let
  val env0 =
  intpenv_make_fenv(fenv)
  val
  irv2 =
  interp0_irexp_fun(env0, ire2)
in
  r0[] := I0LVval(irv2);
  let
  val () = intpenv_free_fenv(env0) in irv2
  end
end // I0LVexp(fenv, ire2)
) (* end of [aux_eval_lazy] *)

and
aux_eval_llazy
( fenv: i0env
, ire1: i0exp
, ires: i0explst): i0val =
let
  val env0 =
  intpenv_make_fenv(fenv)
  val
  irv1 = interp0_irexp_fun(env0, ire1)
in
  let
  val () = intpenv_free_fenv(env0) in irv1
  end
end

(* ****** ****** *)
fun
aux_fold
( env0
: !intpenv
, ire0: i0exp): i0val =
( I0Vnil() ) where
{
val-
I0Efold(ire1) = ire0.node()
}
//
fun
aux_free
( env0
: !intpenv
, ire0: i0exp): i0val =
( I0Vnil() ) where
{
val-
I0Efree(knd0, ire1) = ire0.node()
}
//
(* ****** ****** *)

fun
aux_raise
( env0
: !intpenv
, ire0: i0exp): i0val =
let
//
val-
I0Eraise(ire1) = ire0.node()
//
val
irv1 = interp0_irexp(env0, ire1)
in
let
val () =
($raise I0EXN(irv1)){void} in I0Verror()
end
end

(* ****** ****** *)
//
fun
aux_lazy
( env0
: !intpenv
, ire0: i0exp): i0val =
let
//
val-
I0Elazy(ire1) = ire0.node()
//
val
fenv = intpenv_take_fenv(env0)
//
in
I0Vlazy(ref(I0LVexp(fenv, ire1)))
end
//
fun
aux_llazy
( env0
: !intpenv
, ire0: i0exp): i0val =
let
//
val-
I0Ellazy
( ire1
, opt2(*free*)) = ire0.node()
//
in
(
  I0Vllazy(fenv, ire1, opt2)
) where
{
  val fenv = intpenv_take_fenv(env0)
}
end
//
(* ****** ****** *)

local

fun
auxget_at
( irvs
: i0valist
, i0: int): i0val =
(
case-
irvs of
(*
|
list_nil
() => I0Verror()
*)
|
list_cons
(irv0, irvs) =>
(
if
(i0 <= 0)
then irv0
else auxget_at(irvs, i0-1)
)
) (* end of [auxget_at] *)

in(*in-of-local*)

fun
aux_flat
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
val-
I0Eflat
  (ire1) = ire0.node()
//
in
  aux_flat_main(env0, ire1)
end
and
aux_flat_main
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
(*
val () =
println!
("aux_flat_main: ire0 = ", ire0)
*)
//
in
case-
ire0.node() of
|
I0Evar _ =>
let
val
irv0 = auxvar(env0, ire0)
in
//
case- irv0 of
|
I0Vlft
( irlv ) =>
(
case- irlv of
|
I0LVref(r0) =>
let
val-Some(irv1) = r0[] in irv1
end
|
I0LVpcon
(irv1, lab2) =>
let
val-
I0Vcon(d2c1, irvs) = irv1
in
(
  auxget_at( irvs, idx2 )
) where
{
  val idx2 = pcon_lab2idx(lab2)
}
end // end of [I0LVpcon]
//
|
I0LVpbox
(irv1, lab2, idx2) =>
(
  auxget_at(irvs, idx2)
) where
{
val-I0Vtuple(knd0, irvs) = irv1
} (* end of [I0LVpbox] *)
//
(*
|
I0LVpflt _ => // can it happen?
*)
//
) (* end of [I0Vlft] *)
//
end (* end of [I0Evar] *)
|
I0Eplft
(ire1, lab2, idx2) =>
let
val
irv1 = aux_flat_main(env0, ire1)
in
case- irv1 of
|
I0Vtuple
(knd, irvs) => auxget_at(irvs, idx2)
end // end of [I0Eplft]
//
end (* let *) // end of [aux_flat_main]

end // end of [local]

(* ****** ****** *)

fun
aux_talf
( env0
: !intpenv
, ire0
: i0exp): i0val =
let
//
val-
I0Etalf(ire1) = ire0.node()
//
// (*
val () =
println!("aux_talf: ire1 = ", ire1)
// *)
//
in
case-
ire1.node() of
|
I0Eflat
(ire1) =>
interp0_irexp(env0, ire1)
|
I0Epcon
(ire1, lab2) =>
let
val
irv1 =
interp0_irexp(env0, ire1)
in
I0Vlft(I0LVpcon(irv1, lab2))
end // end of [I0Epcon]
|
I0Epbox
(ire1, lab2, idx2) =>
let
val
irv1 = interp0_irexp(env0, ire1)
in
I0Vlft(I0LVpbox(irv1, lab2, idx2))
end // end of [I0Epbox]
|
I0Eeval(knd0, ire1) =>
let
val () =
assertloc(knd0=1) in interp0_irexp(env0, ire1)
end // end of [I0Eeval]
//
end // end of [aux_talf]

(* ****** ****** *)

in (* in-of-local *)

implement
interp0_irexp
  (env0, ire0) =
let
//
(*
val () =
println!
("interp0_irexp: ire0 = ", ire0)
*)
//
in
//
case+
ire0.node() of
//
| I0Ei00 _ => auxi00(ire0)
| I0Es00 _ => auxs00(ire0)
//
| I0Eint _ => auxint(ire0)
| I0Ebtf _ => auxbtf(ire0)
| I0Echr _ => auxchr(ire0)
| I0Eflt _ => auxflt(ire0)
| I0Estr _ => auxstr(ire0)
//
| I0Etop _ => auxtop(ire0)
//
| I0Evar _ => auxvar(env0, ire0)
//
| I0Econ1 _ => auxcon1(env0, ire0)
//
| I0Efcon _ => auxfcon(env0, ire0)
| I0Efcst _ => auxfcst(env0, ire0)
//
| I0Etcon _ => auxtcon(env0, ire0)
(*
| I0Etcst _ => auxtcst(env0, ire0)
*)
//
| I0Etimp _ => auxtimp(env0, ire0)
//
| I0Edapp _ => auxdapp(env0, ire0)
//
| I0Epcon _ => auxpcon(env0, ire0)
| I0Epbox _ => auxpbox(env0, ire0)
| I0Eproj _ => auxproj(env0, ire0)
| I0Eplft _ => auxplft(env0, ire0)
| I0Epptr _ => auxpptr(env0, ire0)
//
| I0Elet
  (ircs, ire1) => aux_let(env0, ire0)
| I0Ewhere
  (ire1, ircs) => aux_where(env0, ire0)
//
| I0Eseqn
  (ires, ire1) => aux_seqn(env0, ire0)
//
| I0Etuple
  (_, _, ires) => aux_tuple(env0, ire0)
//
| I0Eassgn
  (irel, irer) => aux_assgn(env0, ire0)
//
| I0Eift1
    (_, _, _) => aux_ift1(env0, ire0)
  // I0Eift1
| I0Ecase
    (_, _, _) => aux_case(env0, ire0)
  // I0Ecase
//
| I0Elam
  ( _, _, _ ) => aux_lam(env0, ire0)
  // I0Elam
| I0Efix
  (_, _, _, _) => aux_fix(env0, ire0)
  // I0Efix
//
| I0Etry0
  (ire1, ircls) => aux_try0(env0, ire0)
  // I0Etry0
//
| I0Eaddr(ire1) => aux_addr(env0, ire0)
| I0Eflat(ire1) => aux_flat(env0, ire0)
| I0Etalf(ire1) => aux_talf(env0, ire0)
//
| I0Efold(ire1) => aux_fold(env0, ire0)
//
| I0Eeval(_, _) => aux_eval(env0, ire0)
| I0Efree(_, _) => aux_free(env0, ire0)
//
| I0Eraise(ire1) => aux_raise(env0, ire0)
//
| I0Elazy(ire1) => aux_lazy(env0, ire0)
| I0Ellazy(_, _) => aux_llazy(env0, ire0)
//
| I0Enone0((*void*)) => I0Vnil(*void*)
//
| _(* rest-of-i0exp *) => I0Vnone1(ire0)
//
end // end of [interp0_irexp]

end // end of [local]

(* ****** ****** *)

implement
interp0_irexplst
  (env0, ires) =
(
case+ ires of
| list_nil() =>
  list_nil()
| list_cons(ire0, ires) =>
  (
    list_cons(irv0, irvs)
  ) where
  {
    val irv0 =
    interp0_irexp(env0, ire0)
    val irvs =
    interp0_irexplst(env0, ires)
  }
) (* end of [interp0_irexplst] *)

(* ****** ****** *)

implement
interp0_irexpopt
  (env0, opt1) =
(
case+ opt1 of
| None() =>
  None(*void*)
| Some(ire1) =>
  Some(interp0_irexp(env0, ire1))
) (* end of [interp0_irexpopt] *)

(* ****** ****** *)

local

fun
auxnpf
( npf1: int
, irps
: i0patlst): i0patlst =
if
(npf1 >= 1)
then
let
val-
list_cons
(_, irps) = irps in auxnpf(npf1-1, irps)
end
else irps // end of [if]

in(*in-of-local*)

implement
interp0_fcall_lam
  (irf0, irvs) =
let
val-
I0Vlam
( fenv
, iras, body) = irf0
val env0 =
intpenv_make_fenv(fenv)
in
let
//
val-
list_cons
(ira0, iras) = iras
val+
I0ARGsome
(npf1, irps) = ira0
//
val
irps = auxnpf(npf1, irps)
//
val () =
interp0_irpatlst_ck1(env0, irps, irvs)
//
val irv0 =
(
case+ iras of
|
list_nil() =>
( irv0 ) where
{
  val irv0 =
  interp0_irexp_fun(env0, body)
}
|
list_cons _ =>
(
  I0Vlam(fenv, iras, body)
) where
{
  val fenv = intpenv_take_fenv(env0)
}
) : i0val // end of [val]
//
in
  let
  val () = intpenv_free_fenv(env0) in irv0
  end
end // end of [let]
//
end // end of [interp0_fcall_lam]

(* ****** ****** *)

implement
interp0_fcall_fix
  (irf0, irvs) =
let
val-
I0Vfix
( fenv
, d2v0
, iras, body) = irf0
val env0 =
intpenv_make_fenv(fenv)
val ((*void*)) =
intpenv_bind_fix(env0, irf0)
in
let
  val-
  list_cons
  (ira0, iras) = iras
  val+
  I0ARGsome
  (npf1, irps) = ira0
  val
  irps = auxnpf(npf1, irps)
  val () =
  interp0_irpatlst_ck1(env0, irps, irvs)
  val irv0 =
  (
  case+ iras of
  | list_nil _ =>
    ( irv0 ) where
    {
      val irv0 =
      interp0_irexp_fun(env0, body)
    }
  | list_cons _ =>
    (
    I0Vlam(fenv, iras, body)
    ) where
    {
      val fenv = intpenv_take_fenv(env0)
    }
  ) : i0val // end of [val]
in
  let
  val () = intpenv_free_fenv(env0) in irv0
  end
end // end of [let]
//
end // end of [interp0_fcall_fix]

(* ****** ****** *)

implement
interp0_fcall_fixs
  (irf0, irvs) =
let
val-
I0Vfixs
( fenv
, d2v0
, iras
, body, irdfs) = irf0
//
val env0 =
intpenv_make_fenv(fenv)
val ((*void*)) =
intpenv_bind_fixs(env0, irf0)
//
in
let
  val-
  list_cons
  (ira0, iras) = iras
  val+
  I0ARGsome
  (npf1, irps) = ira0
  val
  irps = auxnpf(npf1, irps)
  val () =
  interp0_irpatlst_ck1(env0, irps, irvs)
  val irv0 =
  (
  case+ iras of
  | list_nil _ =>
    ( irv0 ) where
    {
      val irv0 =
      interp0_irexp_fun(env0, body)
    }
  | list_cons _ =>
    (
    I0Vlam(fenv, iras, body)
    ) where
    {
      val fenv = intpenv_take_fenv(env0)
    }
  ) : i0val // end of [val]
in
  let
  val () = intpenv_free_fenv(env0) in irv0
  end
end // end of [let]
//
end // end of [interp0_fcall_fixs]

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_include
( env0
: !intpenv
, irdcl: i0dcl): void =
let
//
val-
I0Cinclude
( tok
, src(*d1exp*)
, knd(*stadyn*)
, fopt(*fpathopt*)
, iropt) = irdcl.node()
//
in
case+ iropt of
| None() => ()
| Some(xs) =>
  interp0_irdclist(env0, xs)
end // end of [aux_include]

(* ****** ****** *)

fun
aux_valdecl
( env0
: !intpenv
, irdcl: i0dcl): void =
let
val-
I0Cvaldecl
( knd
, mopt
, irvds) = irdcl.node()
in
  interp0_i0valdeclist(env0, irvds)
end // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_vardecl
( env0
: !intpenv
, irdcl: i0dcl): void =
let
val-
I0Cvardecl
( knd
, mopt
, irvds) = irdcl.node()
in
  interp0_i0vardeclist(env0, irvds)
end // end of [aux_vardecl]

(* ****** ****** *)

fun
aux_fundecl
( env0
: !intpenv
, irdcl: i0dcl): void =
let
val-
I0Cfundecl
( knd
, mopt
, tqas
, irfds) = irdcl.node()
//
val
istmp = list_is_cons(tqas)
in
//
if
istmp
then
((*nothing*))
else
interp0_i0fundeclist(env0, irfds)
//
end // end of [aux_fundecl]

(* ****** ****** *)

in(*in-of-local*)

implement
interp0_irdcl
  (env0, x0) =
let
//
(*
val () =
println!
("interp0_irdcl: x0 = ", x0)
*)
//
in
case+
x0.node() of
//
|
I0Cinclude _ =>
(
  aux_include(env0, x0)
)
//
| I0Clocal
  (head, body) =>
{
  val () =
  interp0_irdclist(env0, head)
  val () =
  interp0_irdclist(env0, body)
}
//
| I0Cvaldecl _ =>
  aux_valdecl(env0, x0)
//
| I0Cvardecl _ =>
  aux_vardecl(env0, x0)
//
| I0Cfundecl _ =>
  aux_fundecl(env0, x0)
//
| I0Cimpdecl3 _ =>
  interp0_i0impdecl3(env0, x0)
//
| _(* rest-of-i0dcl *) => ()
//
end // end of [interp0_irdcl]

end // end of [local]

(* ****** ****** *)

implement
interp0_irdclist
  (env0, xs) =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
let
  val () =
  interp0_irdcl(env0, x0)
in
  interp0_irdclist(env0, xs)
end // end of [list_cons]
) (* end of [interp0_irdclist] *)

(* ****** ****** *)

fun
interp0_d2con_ck0
( d2c1
: d2con
, d2c2
: d2con ) : bool =
let
val tag1 = d2c1.tag((*void*))
in
if
(tag1 < 0)
then (d2c1 = d2c2)
else (tag1 = d2c2.tag((*void*)))
// end of [if]
end // end of [interp0_d2con_ck0]

(* ****** ****** *)

implement
interp0_irpat_ck0
  (irp0, irv0) =
let
//
(*
val () =
println!
("interp0_irpat_ck0: irp0 = ", irp0)
val () =
println!
("interp0_irpat_ck0: irv0 = ", irv0)
*)
//
in
case-
irp0.node() of
//
|
I0Pany _ => true
|
I0Pvar _ => true
//
|
I0Pint
( int1 ) =>
(
case- irv0 of
|
I0Vint(int0) => (int0=int1)
)
|
I0Pbtf
( btf1 ) =>
(
case- irv0 of
|
I0Vbtf(btf0) => (btf0=btf1)
)
|
I0Pchr
( chr1 ) =>
(
case- irv0 of
|
I0Vchr(chr0) => (chr0=chr1)
)
//
|
I0Pbang
( irp1 ) =>
interp0_irpat_ck0(irp1, irv0)
|
I0Pflat
( irp1 ) =>
interp0_irpat_ck0(irp1, irv0)
|
I0Pfree
( irp1 ) =>
interp0_irpat_ck0(irp1, irv0)
//
|
I0Pcapp
(d2c0, irps) =>
(
case- irv0 of
|
I0Vcon(d2c1, irvs) =>
if
(
interp0_d2con_ck0(d2c0, d2c1)
)
then
interp0_irpatlst_ck0(irps, irvs)
else false
)
//
|
I0Ptuple(knd0, irps) =>
(
case- irv0 of
|
I0Vtuple(knd1, irvs) =>
let
val () =
assertloc(knd0 = knd1)
in
interp0_irpatlst_ck0(irps, irvs)
end
)
//
end (* end of [interp0_irpat_ck0] *)

implement
interp0_irpatlst_ck0
  (irps, irvs) =
(
case+ irps of
|
list_nil() => true
|
list_cons(irp0, irps) =>
let
  val-
  list_cons(irv0, irvs) = irvs
  val ans =
  interp0_irpat_ck0(irp0, irv0)  
in
//
  if ans
  then interp0_irpatlst_ck0(irps, irvs)
  else false
//
end // end of [list_cons]
) (* end of [interp0_irpatlst_ck0] *)

(* ****** ****** *)

fun
i0pat_flatq
(irp0: i0pat) =
(
case+
irp0.node() of
//
|
I0Pcapp
(d2c0, irps) => auxlst(irps)
//
|
I0Ptuple
(knd0, irps) =>
if
(knd0 != 0)
then auxlst(irps) else false
//
| _ (* non-con-tup *) => false
) where
{
fun
auxlst
( xs
: i0patlst): bool =
(
case+ xs of
| list_nil() => false
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | I0Pbang _ => true | _ => auxlst(xs)
  )
)
} (* end of [i0pat_flatq] *)

(* ****** ****** *)
//
(*
HX-2020-07-10:
Lefitization needs to
be annotated explicitly;
in the following patterns,
[x0] is a val but [xs] is a var:
//
@list_cons(x0, !xs) // xs: read-only
@list_vt_cons(x0, !xs) // xs: writable
//
*)
(*
fun
i0pat_leftize0
( env0
: !intpenv
, irp1: i0pat
, irv0: i0val): void =
(
case+
irp1.node() of
|
I0Pcapp
(d2c1, irps) =>
auxirps(env0, 0(*index*), irps)
|
_ (*non-I0Pcapp*) => ((*void*))
) where
{
fun
auxirp1
( env0
: !intpenv
, i0: int
, irp1: i0pat): void =
(
case+
irp1.node() of
|
I0Pvar(d2v1) =>
(
interp0_insert_d2var
  (env0, d2v1, irv1)
) where
{
  val lab2 =
  label_make_int(i0)
  val irv1 =
  I0Vlft(I0LVpcon(irv0, lab2))
}
|
_(*non-I0Pvar*) =>
let
val
irv1 = i0val_con_arg(irv0, i0)
in
interp0_irpat_ck1(env0, irp1, irv1)
end
)
and
auxirps
( env0
: !intpenv
, i0: int
, irps: i0patlst): void =
(
case+ irps of
| list_nil() => ()
| list_cons
  (irp1, irps) =>
  (
    auxirps(env0, i0+1, irps)
  ) where
  {
    val () = auxirp1(env0, i0, irp1)
  }
)
} (* end of [i0pat_leftize0] *)
*)
//
(* ****** ****** *)

fun
i0pat_leftize1_con
( env0
: !intpenv
, irp1: i0pat
, irv0: i0val): void =
(
case+
irp1.node() of
|
I0Pcapp
(d2c1, irps) =>
auxirps(env0, 0(*index*), irps)
|
_ (*non-I0Pcapp*) => ((*void*))
) where
{
fun
auxirp1
( env0
: !intpenv
, i0: int
, irp1: i0pat): void =
(
case+
irp1.node() of
|
I0Pbang(irp2) =>
(
case+
irp2.node() of
|
I0Pvar(d2v1) =>
(
interp0_insert_d2var
  (env0, d2v1, irv1)
) where
{
  val lab2 =
  label_make_int(i0)
  val irv1 =
  I0Vlft(I0LVpcon(irv0, lab2))
}
|
_(*non-I0Pvar*) =>
let
val
irv1 = i0val_con_arg(irv0, i0)
in
interp0_irpat_ck1(env0, irp1, irv1)
end
)
|
_(*non-I0Pbang*) =>
let
val
irv1 = i0val_con_arg(irv0, i0)
in
interp0_irpat_ck1(env0, irp1, irv1)
end
)
and
auxirps
( env0
: !intpenv
, i0: int
, irps: i0patlst): void =
(
case+ irps of
| list_nil() => ()
| list_cons
  (irp1, irps) =>
  (
    auxirps(env0, i0+1, irps)
  ) where
  {
    val () = auxirp1(env0, i0, irp1)
  }
)
} (* end of [i0pat_leftize1_con] *)

(* ****** ****** *)

fun
i0pat_leftize1_tup
( env0
: !intpenv
, irp1: i0pat
, irv0: i0val): void =
(
case+
irp1.node() of
|
I0Ptuple
(knd0, irps) =>
auxirps(env0, 0(*i0*), irps)
|
_ (*non-I0Pcapp*) => ((*void*))
) where
{
fun
auxirp1
( env0
: !intpenv
, i0: int
, irp1: i0pat): void =
(
case+
irp1.node() of
|
I0Pbang(irp2) =>
(
case+
irp2.node() of
|
I0Pvar(d2v1) =>
(
interp0_insert_d2var
  (env0, d2v1, irv1)
) where
{
val lab2 =
label_make_int(i0)
val irv1 =
I0Vlft(I0LVpbox(irv0, lab2, i0))
}
|
_(*non-I0Pvar*) =>
let
val
irv1 = i0val_tup_arg(irv0, i0)
in
interp0_irpat_ck1(env0, irp1, irv1)
end
)
|
_(*non-I0Pbang*) =>
let
val
irv1 = i0val_tup_arg(irv0, i0)
in
interp0_irpat_ck1(env0, irp1, irv1)
end
)
and
auxirps
( env0
: !intpenv
, i0: int
, irps: i0patlst): void =
(
case+ irps of
| list_nil() => ()
| list_cons
  (irp1, irps) =>
  (
    auxirps(env0, i0+1, irps)
  ) where
  {
    val () = auxirp1(env0, i0, irp1)
  }
)
} (* end of [i0pat_leftize1_tup] *)

(* ****** ****** *)

implement
interp0_irpat_ck1
( env0
, irp0, irv0 ) = let
//
(*
val () =
println!
("interp0_irpat_ck1: irp0 = ", irp0)
val () =
println!
("interp0_irpat_ck1: irv0 = ", irv0)
*)
//
in
case-
irp0.node() of
//
|
I0Pnil() =>
(
case- irv0 of
|
I0Vnil() => ()
)
|
I0Pany() => ()
|
I0Pvar(d2v0) =>
{
val () =
interp0_insert_d2var
  (env0, d2v0, irv0)
} (* end of [I0Pvar] *)
//
|
I0Pint(int1) =>
(
case- irv0 of
| I0Vint(int0) => ()
)
|
I0Pbtf(btf1) =>
(
case- irv0 of
| I0Vbtf(btf0) => ()
)
|
I0Pchr(chr1) =>
(
case- irv0 of
| I0Vchr(chr0) => ()
)
|
I0Pstr(str1) =>
(
case- irv0 of
| I0Vstr(str0) => ()
)
//
|
I0Pflat(irp1) =>
(
(*
i0pat_leftize0(env0, irp1, irv0)
*)
) where
{
val () =
interp0_irpat_ck1(env0, irp1, irv0)
}
|
I0Pbang(irp1) =>
interp0_irpat_ck1(env0, irp1, irv0)
|
I0Pfree(irp1) =>
interp0_irpat_ck1(env0, irp1, irv0)
//
|
I0Pcapp(d2c0, irps) =>
(
let
val
test =
i0pat_flatq(irp0)
in
if
test
then
(
i0pat_leftize1_con(env0, irp0, irv0)
)
else
(
case- irv0 of
|
I0Vcon(d2c1, irvs) =>
interp0_irpatlst_ck1(env0, irps, irvs)
)
end // end of [let]
)
//
|
I0Ptuple(knd0, irps) =>
(
let
val
test =
i0pat_flatq(irp0)
in
if
test
then
(
i0pat_leftize1_tup(env0, irp0, irv0)
)
else
(
case- irv0 of
|
I0Vtuple(knd1, irvs) =>
let
val () = assertloc(knd0 = knd1)
in
interp0_irpatlst_ck1(env0, irps, irvs)
end
)
end
)
//
end (* end of [interp0_irpat_ck1] *)

implement
interp0_irpatlst_ck1
  (env0, irps, irvs) =
(
case+ irps of
|
list_nil() => ()
|
list_cons(irp0, irps) =>
let
  val-
  list_cons(irv0, irvs) = irvs
  val () =
  interp0_irpat_ck1(env0, irp0, irv0)  
in
  interp0_irpatlst_ck1(env0, irps, irvs)
end // end of [list_cons]
) (* end of [interp0_irpatlst_ck1] *)

(* ****** ****** *)

implement
interp0_irgpat_ck2
  (env0, irgp, irv0) =
(
case+
irgp.node() of
|
I0GPATpat(irp0) =>
(
  test
) where
{
val
test =
interp0_irpat_ck0(irp0, irv0)
val () =
if test then
interp0_irpat_ck1(env0, irp0, irv0)
}
|
I0GPATgua(irp0, irgs) =>
let
val
test =
interp0_irpat_ck0(irp0, irv0)
val () =
if test then
interp0_irpat_ck1(env0, irp0, irv0)
in
if
test
then
interp0_irgualst_ck2(env0, irgs) else false
end // end of [let]
) (* end of [interp0_irgpat_ck2] *)

(* ****** ****** *)
//
implement
interp0_irgua_ck2
  (env0, irg0) =
(
case+
irg0.node() of
|
I0GUAexp(ire1) =>
let
val irv1 =
interp0_irexp(env0, ire1)
in
case- irv1 of I0Vbtf(tf) => tf
end
|
I0GUAmat(ire1, irp1) =>
let
val irv1 =
interp0_irexp(env0, ire1)
val test =
interp0_irpat_ck0(irp1, irv1)
in
if
test
then
interp0_irpat_ck1(env0, irp1, irv1); test
end
)
//
implement
interp0_irgualst_ck2
  (env0, irgs) =
(
case+ irgs of
|
list_nil() => true
|
list_cons(irg0, irgs) =>
if
interp0_irgua_ck2(env0, irg0)
then
interp0_irgualst_ck2(env0, irgs) else false
) (* end of [interp0_irgualst_ck2] *)
//
(* ****** ****** *)

implement
interp0_irclau
(env0, irv0, ircl) =
let
//
(*
val () =
println!
("interp0_irclau: irv0 = ", irv0)
val () =
println!
("interp0_irclau: ircl = ", ircl)
*)
//
in
//
case+
ircl.node() of
|
I0CLAUpat(irgp) =>
let
val () =
intpenv_push_let1(env0)
val test =
interp0_irgpat_ck2(env0, irgp, irv0)
val opt0 =
(
  if
  test
  then
  Some_vt(I0Verror()) else None_vt()
) : Option_vt(i0val)
in
let
val () = intpenv_pop0_let1(env0) in opt0
end
end
|
I0CLAUexp(irgp, ire1) =>
let
val () =
intpenv_push_let1(env0)
val test =
interp0_irgpat_ck2(env0, irgp, irv0)
val opt0 =
(
if
test
then
(
Some_vt(irv1)
) where
{
val
irv1 = interp0_irexp(env0, ire1)
}
else
(
  None_vt(*void*)
)
) : Option_vt(i0val)
in
  let
  val () = intpenv_pop0_let1(env0) in opt0
  end
end // end of [I0CLAUexp]
//
end (* end of [interp0_irclau] *)

(* ****** ****** *)

implement
interp0_irclaulst
(env0, irv0, ircls) =
(
case+ ircls of
|
list_nil() =>
(
  None_vt(*void*)
)
|
list_cons
(ircl, ircls) =>
let
val opt =
interp0_irclau(env0, irv0, ircl)
in
case+ opt of
|  Some_vt _ => opt
| ~None_vt _ =>
   interp0_irclaulst(env0, irv0, ircls)
end // end of [list_cons]
)

(* ****** ****** *)

implement
interp0_i0valdecl
  (env0, x0) =
let
//
val+
I0VALDECL(rcd) = x0
//
val pat = rcd.pat
val def = rcd.def
//
val def =
interp0_irexpopt(env0, def)
//
in
//
case+ def of
|
None() => ()
|
Some(irv) =>
interp0_irpat_ck1(env0, pat, irv)
//
end // end of [interp0_i0valdecl]

implement
interp0_i0valdeclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    interp0_i0valdeclist(env0, xs)
  ) where
  {
    val () = interp0_i0valdecl(env0, x0)
  }
) (* end of [interp0_i0valdeclist] *)

(* ****** ****** *)

implement
interp0_i0vardecl
  (env0, x0) =
let
//
val+
I0VARDECL(rcd) = x0
//
val d2v = rcd.d2v
val ini = rcd.ini
//
val ini =
interp0_irexpopt(env0, ini)
//
(*
val ( ) =
println!
("interp0_i0vardecl: d2v = ", d2v)
val ( ) =
println!
("interp0_i0vardecl: ini = ", ini)
*)
//
in
//
interp0_insert_d2var
( env0
, d2v, I0Vlft(I0LVref(ref(ini))))
//
end // end of [interp0_i0vardecl]

implement
interp0_i0vardeclist
  (env0, xs) =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  (
    interp0_i0vardeclist(env0, xs)
  ) where
  {
    val () = interp0_i0vardecl(env0, x0)
  }
) (* end of [interp0_i0vardeclist] *)

(* ****** ****** *)

implement
interp0_i0fundecl
(env0, irfd0) =
let
//
val+
I0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
//
in
//
case+ a3g of
|
None() => ()
|
Some(iras) =>
(
case+ def of
|
None() => ()
|
Some(body) =>
(
case+ iras of
|
list_nil _ =>
let
val irv0 =
(
case-
body.node() of
|
I0Elam
(knd, iras, body) =>
let
val fenv =
intpenv_take_fenv(env0)
in
I0Vfix(fenv, nam, iras, body)
end // end of [I0Elam]
//
(*
|
I0Efix
(knd, d2v, iras, ire2) =>
let
//
val
fenv =
intpenv_take_env(env0)
//
val
irdf =
i0exp_make_node
( body.loc()
, I0Efix(0, nam, iras, ire2)
)
val
irdfs = list_pair(irdf, body)
//
in
I0Vfixs
(fenv, nam, iras, ire2, irdfs)
end
*)
//
) : i0val // end of [let]
in
  interp0_insert_d2cst(env0, d2c, irv0)
end
|
list_cons _ =>
let
val fenv =
intpenv_take_fenv(env0)
val irv0 =
I0Vfix(fenv, nam, iras, body)
in
  interp0_insert_d2cst(env0, d2c, irv0)
end
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end // end of [interp0_i0fundecl]

(* ****** ****** *)

local

fun
auxfixs
(
irfds
:
i0fundeclist
) : i0explst =
(
case+
irfds of
|
list_nil() =>
list_nil()
|
list_cons
(irfd0, irfds) =>
let
val+
I0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
//
in
//
case+ a3g of
|
None() =>
auxfixs(irfds)
|
Some(iras) =>
(
case+ def of
|
None() =>
auxfixs(irfds)
|
Some(body) =>
(
case+ iras of
|
list_nil _ =>
(
case+
body.node() of
|
I0Elam
(knd, iras, ire2) =>
let
val ire1 =
i0exp_make_node
(
body.loc()
,
I0Efix(knd, nam, iras, ire2)
) (* end of [val] *)
in
list_cons(ire1, auxfixs(irfds))
end // end of [I0Elam]
//
(*
|
I0Efix
(knd, d2v, iras, ire2) =>
let
val irdf =
i0exp_make_node
(
body.loc()
,
I0Efix(knd, nam, iras, ire2)
)
in
list_cons
( irdf
, list_cons(body, auxfixs(irfds)))
end
*)
//
| _(*rest-of-i0exp*) =>
  list_cons(body, auxfixs(irfds))
)
|
list_cons _ =>
let
val ire1 =
i0exp_make_node
(
rcd.loc
,
I0Efix
(0(*knd*), nam, iras, body)
) (* end of [val] *)
in
  list_cons(ire1, auxfixs(irfds))
end 
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end (* end of [list_cons] *) ) (*auxfixs*)

fun
auxirfds
( env0
: !intpenv
, fenv
: i0env
, irdfs
: i0explst
, irfds
: i0fundeclist
) : void =
(
case+
irfds of
|
list_nil() => ()
|
list_cons
(irfd0, irfds) =>
let
val+
I0FUNDECL
  (rcd) = irfd0
//
val nam = rcd.nam
val d2c = rcd.d2c
val a3g = rcd.a3g
val def = rcd.def
//
in
//
case+ a3g of
|
None() => ()
|
Some(iras) =>
(
case+ def of
|
None() => ()
|
Some(body) =>
(
case+ iras of
|
list_nil _ =>
let
val irv0 =
(
case-
body.node() of
|
I0Elam
(knd, iras, body) =>
I0Vfixs
(fenv, nam, iras, body, irdfs)
(*
|
I0Efix
(knd, d2v, iras, ire2) =>
I0Vfixs
(fenv, nam, iras, ire2, irdfs)
*)
//
) : i0val // end-of-let
in
(
auxirfds(env0, fenv, irdfs, irfds)
) where
{
val () =
interp0_insert_d2cst(env0, d2c, irv0)
}
end
|
list_cons _ =>
let
val irv0 =
I0Vfixs
(fenv, nam, iras, body, irdfs)
in
(
auxirfds(env0, fenv, irdfs, irfds)
) where
{
val () =
interp0_insert_d2cst(env0, d2c, irv0)
}
end
) (* end of [Some(body)] *)
) (* end of [Some(iras)] *)
//
end (* end of [list_cons] *) ) (* auxirfds *)

in (*in-of-local*)

implement
interp0_i0fundeclist
(env0, irfds) =
(
case+ irfds of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
case+ xs of
| list_nil _ =>
  interp0_i0fundecl(env0, x0)
| list_cons _ =>
  let
//
  val fenv =
  intpenv_take_fenv(env0)
//
  val irdfs = auxfixs(irfds)
//
  in
    auxirfds(env0, fenv, irdfs, irfds)
  end
) (* end of [list_cons] *)
) (* interp0_i0fundeclist *)

end // end of [local]

(* ****** ****** *)

implement
interp0_i0impdecl3
  (env0, irdcl) =
let
//
val-
I0Cimpdecl3
( knd, mopt
, sqas, tqas
, id2c, ti3a
, ti2s, iras, body) = irdcl.node()
//
(*
val () =
println!
("interp0_i0impdecl3: id2c = ", id2c)
*)
//
in
//
case+ ti2s of
|
list_nil() =>
let
//
val fenv =
intpenv_take_fenv(env0)
val d2c0 =
(
case+ id2c of
|
$D2E.IMPLD2CST1
(dqid, d2cs) =>
let
val-
list_cons
(d2c0, _) = d2cs in d2c0 end
|
$D2E.IMPLD2CST2
(dqid, d2cs, opt3) =>
let
val-
Some(d2c0) = opt3 in d2c0 end
) : d2cst // end of [val]
//
val
irv0 = I0Vlam(fenv, iras, body)
//
in
interp0_insert_d2cst(env0, d2c0, irv0)
end
//
|
list_cons(_, _) => ((*template*))
//
end (* end of [interp0_i0impdecl3] *)

(* ****** ****** *)

(* end of [xint_interp0_dynexp.dats] *)
