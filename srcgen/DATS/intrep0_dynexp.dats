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
extern
fun
xatsopt_chrunq
( source // '<char>' -> <char>
: string) : char = "ext#xatsopt_chrunq"
extern
fun
xatsopt_strunq
( source // "<string>" -> <string>
: string) : string = "ext#xatsopt_strunq"
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxint
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
val-
D3Pint
(tok) = d3p0.node()
//
val
int = token2dint(tok)
//
in
i0pat_make_node(loc0, I0Pint(int))
end

(* ****** ****** *)

fun
auxbtf
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
val-
D3Pbtf
(tok) = d3p0.node()
//
val btf = token2sbtf(tok)
//
in
i0pat_make_node(loc0, I0Pbtf(btf))
end

(* ****** ****** *)

fun
auxchr
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
val-
D3Pchr
(tok) = d3p0.node()
//
val chr = token2dchr(tok)
//
in
i0pat_make_node(loc0, I0Pchr(chr))
end

(* ****** ****** *)

fun
auxstr
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
val-
D3Pstr
(tok) = d3p0.node()
//
val str = token2dstr(tok)
//
in
i0pat_make_node(loc0, I0Pstr(str))
end

(* ****** ****** *)

fun
auxbang
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
//
val-
D3Pbang
(d3p1) = d3p0.node()
//
val
irp1 = irerase_dpat(d3p1)
//
in
i0pat_make_node(loc0, I0Pbang(irp1))
end // end of [auxbang]

fun
auxflat
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
//
val-
D3Pflat
(d3p1) = d3p0.node()
//
val
irp1 = irerase_dpat(d3p1)
//
in
i0pat_make_node(loc0, I0Pflat(irp1))
end // end of [auxflat]

fun
auxfree
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
//
val-
D3Pfree
(d3p1) = d3p0.node()
//
val
irp1 = irerase_dpat(d3p1)
//
in
i0pat_make_node(loc0, I0Pfree(irp1))
end // end of [auxfree]

(* ****** ****** *)

fun
auxdapp
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
//
(*
val () =
println!
("auxdapp: loc0 = ", loc0)
val () =
println!
("auxdapp: d3p0 = ", d3p0)
*)
//
val-
D3Pdapp
( d3f0
, npf1, d3ps) = d3p0.node()
//
val d3ps =
(
auxnpf(npf1, d3ps)
) where
{
fun
auxnpf
( npf1
: int
, d3ps
: d3patlst) : d3patlst =
(
if
npf1 > 0
then let
//
val-
list_cons
(_, d3ps) = d3ps
in
auxnpf(npf1-1, d3ps)
end // end of [then]
else d3ps // end of [else]
)
}
//
val irps =
irerase_dpatlst(d3ps)
//
in
//
case-
d3f0.node() of
|
D3Pcon1(d2c0) =>
i0pat_make_node(loc0, I0Pcapp(d2c0, irps))
//
end // end of [auxdapp]

(* ****** ****** *)

fun
aux_tuple
( d3p0
: d3pat): i0pat =
let
//
val
loc0 = d3p0.loc()
//
val-
D3Ptuple
( knd0
, npf1
, d3ps) = d3p0.node()
//
val
irps =
(
  auxlst(npf1, d3ps)
) where
{
fun
auxlst
( npf1: int
, d3ps
: d3patlst): i0patlst =
(
case+ d3ps of
|
list_nil() =>
list_nil()
|
list_cons(d3p1, d3ps) =>
if
(npf1 > 0)
then
auxlst(npf1-1, d3ps)
else
let
val
irp1 = irerase_dpat(d3p1)
in
list_cons
(irp1, auxlst(npf1-1, d3ps))
end
) (* end of [auxlst] *)
} (* where *) // end-of-val
//
in
i0pat_make_node(loc0, I0Ptuple(knd0, irps))
end // end of [aux_tuple]

in(*in-of-local*)

implement
irerase_dpat
  (d3p0) =
let
//
val loc0 = d3p0.loc()
//
in
//
case+
d3p0.node() of
//
| D3Pnil() =>
  i0pat_make_node
  (loc0, I0Pnil())
| D3Pany() =>
  i0pat_make_node
  (loc0, I0Pany())
//
| D3Pvar(d2v) =>
  i0pat_make_node
  (loc0, I0Pvar(d2v))
//
| D3Pint _ => auxint(d3p0)
| D3Pbtf _ => auxbtf(d3p0)
| D3Pchr _ => auxchr(d3p0)
| D3Pstr _ => auxstr(d3p0)
//
| D3Pbang _ => auxbang(d3p0)
| D3Pflat _ => auxflat(d3p0)
| D3Pfree _ => auxfree(d3p0)
//
| D3Pdapp _ => auxdapp(d3p0)
//
| D3Ptuple _ => aux_tuple(d3p0)
//
| D3Panno
  (d3p1, _, _) => irerase_dpat(d3p1)
//
| _(*rest-of-d3pat*) =>
  i0pat_make_node(loc0, I0Pnone1(d3p0))
//
end // end of [irerase_dpat]

end // end of [local]

(* ****** ****** *)

implement
irerase_dpatlst
  (d3ps) =
list_vt2t(irps) where
{
val
irps =
list_map<d3pat><i0pat>
  (d3ps) where
{
implement
list_map$fopr<d3pat><i0pat>(d3p) = irerase_dpat(d3p)
}
} (* end of [irerase_dpatlst] *)

(* ****** ****** *)

implement
irerase_farglst
  (f3as) =
(
case+ f3as of
|
list_nil() =>
list_nil()
|
list_cons
(f3a0, f3as) =>
(
case+
f3a0.node() of 
//
| F3ARGsome_dyn
    (npf, d3ps) =>
  (
    list_cons(i0a, iras)
  ) where
  {
    val i0a =
    I0ARGsome
    (npf, irerase_dpatlst(d3ps))
    val iras = irerase_farglst(f3as)
  }
//
| F3ARGnone2 _ => irerase_farglst(f3as)
| F3ARGnone3 _ => irerase_farglst(f3as)
//
| F3ARGsome_sta _ => irerase_farglst(f3as)
| F3ARGsome_met _ => irerase_farglst(f3as)
)
) (* end of [irerase_farglst] *)


(* ****** ****** *)

implement
irerase_dexp
  (d3e0) =
let
//
val loc0 = d3e0.loc()
//
in
//
case+
d3e0.node() of
//
| D3Ei00(int) =>
  i0exp_make_node
  (loc0, I0Ei00(int))
| D3Es00(str) =>
  i0exp_make_node
  (loc0, I0Es00(str))
//
| D3Eint(tok) =>
  i0exp_make_node
  (loc0, I0Eint(tok))
| D3Ebtf(tok) =>
  i0exp_make_node
  (loc0, I0Ebtf(tok))
| D3Echr(tok) =>
  i0exp_make_node
  (loc0, I0Echr(tok))
| D3Eflt(tok) =>
  i0exp_make_node
  (loc0, I0Eflt(tok))
| D3Estr(tok) =>
  i0exp_make_node
  (loc0, I0Estr(tok))
//
| D3Etop(tok) =>
  i0exp_make_node
  (loc0, I0Etop(tok))
//
| D3Evar(d2v) =>
  i0exp_make_node
  (loc0, I0Evar(d2v))
| D3Ekvar
  ( knd, d2v ) =>
  i0exp_make_node
  (loc0, I0Evar(d2v))
//
| D3Econ1(d2c) =>
  i0exp_make_node
  (loc0, I0Econ1(d2c))
| D3Ecst1(d2c) =>
  i0exp_make_node
  (loc0, I0Ecst1(d2c))
//
| D3Efcon(d2c) =>
  i0exp_make_node
  (loc0, I0Efcon(d2c))
| D3Efcst(d2c) =>
  i0exp_make_node
  (loc0, I0Efcst(d2c))
//
| D3Etcon
  (d2c1, ti3a, ti2s) =>
  i0exp_make_node
  ( loc0
  , I0Etcon(d2c1, ti3a, ti2s))
| D3Etcst
  (d2c1, ti3a, ti2s) =>
  i0exp_make_node
  ( loc0
  , I0Etcst(d2c1, ti3a, ti2s))
//
| D3Etimp
  ( stmp
  , d3e1(*tcst*), targ
  , d3cl(*impl*), tsub) =>
  let
  val ire1 = irerase_dexp(d3e1)
  val ircl = irerase_decl(d3cl)
  in
    i0exp_make_node
    ( loc0
    , I0Etimp
      (ire1, targ, ircl, tsub))
  end
//
| D3Esap0 // error
  (d3e1, _) => irerase_dexp(d3e1)
| D3Esap1 // checked
  (d3e1, _) => irerase_dexp(d3e1)
//
(*
| D3Edap0 // no such case
*)
| D3Edapp
  (d3f0, npf1, d3es) =>
  let
  val irf0 = irerase_dexp(d3f0)
  val ires = irerase_dexplst(d3es)
  in
    i0exp_make_node
    ( loc0
    , I0Edapp(irf0, npf1, ires))
  end
//
| D3Epcon
  (d3e1, lab2) => let
    val
    ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node
      (loc0, I0Epcon(ire1, lab2))
    // i0exp_make_node
  end
| D3Epbox
  (d3e1, lab2, idx2) => let
    val
    ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node
    (loc0, I0Epbox(ire1, lab2, idx2))
  end
//
| D3Eproj
  (d3e1, lab2, idx2) => let
    val
    ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node
    (loc0, I0Eproj(ire1, lab2, idx2))
  end
| D3Eplft
  (d3e1, lab2, idx2) => let
    val
    ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node
    (loc0, I0Eplft(ire1, lab2, idx2))
  end
| D3Epptr
  (d3e1, lab2, idx2) => let
    val
    ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node
    (loc0, I0Epptr(ire1, lab2, idx2))
  end
//
| D3Elet(d3cs, d3e1) =>
  let
    val
    ircs =
    irerase_declist(d3cs)
  in
    let
    val
    ire1 = irerase_dexp(d3e1)
    in
      i0exp_make_node
      (loc0, I0Elet(ircs, ire1))
    end
  end
| D3Ewhere(d3e1, d3cs) =>
  let
    val
    ire1 = irerase_dexp(d3e1)
    val
    ircs = irerase_declist(d3cs)
  in
    i0exp_make_node
    (loc0, I0Ewhere(ire1, ircs))
  end
//
| D3Eseqn
  ( d3es(*semi*)
  , d3e1(*last*)) =>
  let
  val
  ire1 = irerase_dexp(d3e1)
  val
  ires = irerase_dexplst(d3es)
  in
    i0exp_make_node
    (loc0, I0Eseqn(ires, ire1))
  end
//
| D3Etuple
  (knd0, npf1, d3es) =>
  let
    val
    ires = irerase_dexplst(d3es)
  in
    i0exp_make_node
    ( loc0
    , I0Etuple(knd0, npf1, ires))
  end
//
| D3Eassgn(d3el, d3er) =>
  let
    val
    irel = irerase_dexp(d3el)
    val
    irer = irerase_dexp(d3er)
  in
    i0exp_make_node
    ( loc0, I0Eassgn(irel, irer))
  end
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  let
    val
    ire1 = irerase_dexp(d3e1)
    val
    ire2 = irerase_dexp(d3e2)
    val
    opt3 = irerase_dexpopt(opt3)
  in
    i0exp_make_node
    (loc0, I0Eift1(ire1, ire2, opt3))
  end
| D3Eif1
  ( d3e1
  , d3e2, opt3, tinv) =>
  let
    val
    ire1 = irerase_dexp(d3e1)
    val
    ire2 = irerase_dexp(d3e2)
    val
    opt3 = irerase_dexpopt(opt3)
  in
    i0exp_make_node
    (loc0, I0Eift1(ire1, ire2, opt3))
  end
//
| D3Ecas0
  (knd0, d3e1, dcls) =>
  let
    val ire1 = irerase_dexp(d3e1)
    val ircls = irerase_dclaulst(dcls)
  in
    i0exp_make_node
    (loc0, I0Ecase(knd0, ire1, ircls))
  end
| D3Ecas1
  ( knd0
  , d3e1, dcls, tinv) =>
  let
    val ire1 = irerase_dexp(d3e1)
    val ircls = irerase_dclaulst(dcls)
  in
    i0exp_make_node
    (loc0, I0Ecase(knd0, ire1, ircls))
  end
//
| D3Elam
  ( tok0
  , f3as, res1, arrw, body) =>
  let
//
    val-
    T_LAM(knd0) = tok0.node()
//
    val
    iras = irerase_farglst(f3as)
//
  in
    let
      val
      body = irerase_dexp(body)
    in
      i0exp_make_node
      ( loc0
      , I0Elam(knd0, iras, body))
    end
  end
| D3Efix
  ( tok0
  , d2v0
  , f3as, res1, arrw, body) =>
  let
    val-
    T_FIX(knd0) = tok0.node()
//
    val
    iras = irerase_farglst(f3as)
//
  in
    let
      val
      body = irerase_dexp(body)
    in
      i0exp_make_node
      ( loc0
      , I0Efix(knd0, d2v0, iras, body))
    end
  end
//
| D3Etry0
  (tok0, d3e1, d3cls) =>
  let
    val ire1 = irerase_dexp(d3e1)
    val ircls = irerase_dclaulst(d3cls)
  in
    i0exp_make_node
    (loc0, I0Etry0(ire1, ircls))
  end
//
| D3Eaddr(d3e1) =>
  let
    val ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node(loc0, I0Eaddr(ire1))
  end // end of [D3Eaddr]
//
| D3Eflat(d3e1) =>
  let
    val ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node(loc0, I0Eflat(ire1))
  end // end of [D3Eflat]
| D3Etalf(d3e1) =>
  let
    val ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node(loc0, I0Etalf(ire1))
  end // end of [D3Etalf]
//
| D3Efold(d3e1) =>
  let
    val ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node(loc0, I0Efold(ire1))
  end // end of [D3Efold]
//
| D3Eeval
  ( knd0, d3e1 ) =>
  let
    val ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node(loc0, I0Eeval(knd0, ire1))
  end // end of [D3Eeval]
//
| D3Efree
  ( knd0, d3e1 ) =>
  let
    val ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node(loc0, I0Efree(knd0, ire1))
  end // end of [D3Efree]
//
| D3Eraise(d3e1) =>
  let
    val ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node(loc0, I0Eraise(ire1))
  end // end of [D3Eraise]
//
| D3Elazy(d3e1) =>
  let
    val ire1 = irerase_dexp(d3e1)
  in
    i0exp_make_node(loc0, I0Elazy(ire1))
  end // end of [D3Elazy]
| D3Ellazy(d3e1, d3es) =>
  let
    val ire1 = irerase_dexp(d3e1)
    val ires = irerase_dexplst(d3es)
  in
    i0exp_make_node(loc0, I0Ellazy(ire1, ires))
  end // end of [D3Ellazy]
//
| D3Eanno
  (d3e1, _, _) => irerase_dexp(d3e1)
  // end of [D3Eanno]
//
| D3Enone0((*void*)) =>
  (
    i0exp_make_node(loc0, I0Enone0())
  )
//
| _(*rest-of-d3exp*) =>
  (
    i0exp_make_node(loc0, I0Enone1(d3e0))
  )
//
end // end of [irerase_dexp]

(* ****** ****** *)

implement
irerase_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d3e) => Some(irerase_dexp(d3e))
) (* end of [irerase_dexpopt] *)

implement
irerase_dexplst
  (d3es) =
list_vt2t(ires) where
{
val
ires =
list_map<d3exp><i0exp>
  (d3es) where
{
implement
list_map$fopr<d3exp><i0exp>(d3e) = irerase_dexp(d3e)
}
} (* end of [irerase_dexplst] *)

(* ****** ****** *)

implement
irerase_dgua
  (d3g0) =
let
val loc0 = d3g0.loc()
in
case+
d3g0.node() of
|
D3GUAexp(d3e1) =>
(
  i0gua_make_node
  (loc0, I0GUAexp(ire1))
) where
{
  val ire1 = irerase_dexp(d3e1)
}
|
D3GUAmat(d3e1, d3p2) =>
(
  i0gua_make_node
  (loc0, I0GUAmat(ire1, irp2))
) where
{
  val ire1 = irerase_dexp(d3e1)
  val irp2 = irerase_dpat(d3p2)
}
end // end of [irerase_dgua]

implement
irerase_dgualst
  (d3gs) =
list_vt2t(irgs) where
{
val
irgs =
list_map<d3gua><i0gua>
  (d3gs) where
{
implement
list_map$fopr<d3gua><i0gua>(d3g) = irerase_dgua(d3g)
}
} (* end of [irerase_dgualst] *)

(* ****** ****** *)

implement
irerase_dgpat
  (d3gp) =
let
val loc0 = d3gp.loc()
in
case+
d3gp.node() of
|
D3GPATpat(d3p1) =>
(
  i0gpat_make_node
  (loc0, I0GPATpat(irp1))
) where
{
  val irp1 = irerase_dpat(d3p1)
}
|
D3GPATgua(d3p1, d3gs) =>
(
  i0gpat_make_node
  (loc0, I0GPATgua(irp1, irgs))
) where
{
  val irp1 = irerase_dpat(d3p1)
  val irgs = irerase_dgualst(d3gs)
}
end // end of [irerase_dgpat]

(* ****** ****** *)

implement
irerase_dclau
  (d3cl) =
let
val loc0 = d3cl.loc()
in
case+
d3cl.node() of
|
D3CLAUpat(d3gp) =>
(
  i0clau_make_node
  (loc0, I0CLAUpat(irgp))
) where
{
  val
  irgp = irerase_dgpat(d3gp)
}
|
D3CLAUexp(d3gp, d3e2) =>
(
  i0clau_make_node
  (loc0, I0CLAUexp(irgp, ire2))
) where
{
//
  val
  irgp = irerase_dgpat(d3gp)
//
  val ire2 = irerase_dexp(d3e2)
//
}
end // end of [irerase_dclau]

implement
irerase_dclaulst
  (d3cls) =
list_vt2t(ircls) where
{
val
ircls =
list_map<d3clau><i0clau>
  (d3cls) where
{
implement
list_map$fopr<d3clau><i0clau>(d3cl) = irerase_dclau(d3cl)
}
} (* end of [irerase_dclaulst] *)

(* ****** ****** *)

local

fun
aux_include
( d3cl
: d3ecl): i0dcl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cinclude
( tok
, src, knd
, fopt, dopt) = d3cl.node()
//
val
iropt =
(
case+ dopt of
| None() =>
  None()
| Some(d3cs) =>
  Some(irerase_declist(d3cs))
) : i0dclistopt
in
i0dcl_make_node
( loc0
, I0Cinclude(tok, src, knd, fopt, iropt)
)
end // end of [aux_include]

in(*in-of-local*)

implement
irerase_decl
  (d3cl) =
let
//
val loc0 = d3cl.loc()
//
in
//
case+
d3cl.node() of
//
| D3Cstatic
  (tok, d3c1) =>
  (
  i0dcl_make_node
    (loc0, I0Cstatic(tok, irc1))
  ) where
  {
    val irc1 = irerase_decl(d3c1)
  }
| D3Cextern
  (tok, d3c1) =>
  (
  i0dcl_make_node
    (loc0, I0Cextern(tok, irc1))
  ) where
  {
    val irc1 = irerase_decl(d3c1)
  }
//
| D3Cinclude _ => aux_include(d3cl)
//
| D3Clocal
  (head, body) =>
  let
  val head = irerase_declist(head)
  val body = irerase_declist(body)
  in
    i0dcl_make_node
      (loc0, I0Clocal(head, body))
    // i0dcl_make_node
  end
//
| D3Cvaldecl
  (tok, mopt, v3ds) =>
  let
    val
    irds = irerase_valdeclist(v3ds)
  in
    i0dcl_make_node
    (loc0, I0Cvaldecl(tok, mopt, irds))
  end
//
| D3Cvardecl
  (tok, mopt, v3ds) =>
  let
    val
    irds = irerase_vardeclist(v3ds)
  in
    i0dcl_make_node
    (loc0, I0Cvardecl(tok, mopt, irds))
  end
//
| D3Cfundecl
  (tok, mopt, tqas, f3ds) =>
  let
    val
    irds = irerase_fundeclist(f3ds)
  in
    i0dcl_make_node
    ( loc0
    , I0Cfundecl(tok, mopt, tqas, irds))
  end
//
| D3Cimpdecl3
  ( tok
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s, f3as, res0, body) =>
  let
    val
    iras =
    irerase_farglst(f3as)
    val
    body = irerase_dexp(body)
  in
    i0dcl_make_node
    ( loc0
    , I0Cimpdecl3
      ( tok, mopt, sqas, tqas
      , id2c, ti3a, ti2s, iras, body))
  end
//
| _(*rest-of-d3ecl*) =>
  i0dcl_make_node(loc0, I0Cnone1(d3cl))
//
end // end of [irerase_decl]

end // end of [local]

(* ****** ****** *)

implement
irerase_declist
  (d3cs) =
list_vt2t(ircs) where
{
val
ircs =
list_map<d3ecl><i0dcl>
  (d3cs) where
{
implement
list_map$fopr<d3ecl><i0dcl>(d3c) = irerase_decl(d3c)
}
} (* end of [irerase_declist] *)

(* ****** ****** *)

implement
irerase_valdecl
  (v3d0) =
let
val+
V3ALDECL(rcd) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
//
val pat = irerase_dpat(pat)
val def = irerase_dexpopt(def)
//
in
I0VALDECL(@{loc=loc,pat=pat,def=def})
end // end of [irerase_valdecl]

implement
irerase_valdeclist
  (v3ds) =
list_vt2t(irds) where
{
val
irds =
list_map<v3aldecl><i0valdecl>
  (v3ds) where
{
implement
list_map$fopr<v3aldecl><i0valdecl>(v3d) = irerase_valdecl(v3d)
}
} (* end of [irerase_valdeclist] *)

(* ****** ****** *)

implement
irerase_vardecl
  (v3d0) =
let
val+
V3ARDECL(rcd) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val ini = rcd.ini
//
val ini = irerase_dexpopt(ini)
//
in
I0VARDECL(@{loc=loc,d2v=d2v,ini=ini})
end // end of [irerase_vardecl]

implement
irerase_vardeclist
  (v3ds) =
list_vt2t(irds) where
{
val
irds =
list_map<v3ardecl><i0vardecl>
  (v3ds) where
{
implement
list_map$fopr<v3ardecl><i0vardecl>(v3d) = irerase_vardecl(v3d)
}
} (* end of [irerase_vardeclist] *)

(* ****** ****** *)

implement
irerase_fundecl
  (f3d0) =
let
val+
F3UNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val a2g = rcd.a2g
val a3g = rcd.a3g
val def = rcd.def
//
val a3g =
(
case+ a3g of
| None() =>
  None()
| Some(f3as) =>
  Some(irerase_farglst(f3as))
) : i0arglstopt
//
val def = irerase_dexpopt(def)
//
in
I0FUNDECL(
@{
 loc=loc
,nam=nam,d2c=d2c,a2g=a2g, a3g=a3g,def=def}
)(*I0FUNDECL*)
end // end of [irerase_fundecl]

implement
irerase_fundeclist
  (f3ds) =
list_vt2t(irds) where
{
val
irds =
list_map<f3undecl><i0fundecl>
  (f3ds) where
{
implement
list_map$fopr<f3undecl><i0fundecl>(v3d) = irerase_fundecl(v3d)
}
} (* end of [irerase_fundeclist] *)

(* ****** ****** *)

(* end of [intrep0_dynexp.dats] *)
