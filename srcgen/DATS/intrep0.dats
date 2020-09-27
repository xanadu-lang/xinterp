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
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

local

absimpl
i0pat_tbox = $rec
{ i0pat_loc= loc_t
, i0pat_node= i0pat_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
i0pat_get_loc
  (x0) = x0.i0pat_loc
implement
i0pat_get_node
  (x0) = x0.i0pat_node
//  
implement
i0pat_make_node
(loc0, node) = $rec
{
i0pat_loc= loc0, i0pat_node= node
} (* i0pat_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
i0exp_tbox = $rec
{ i0exp_loc= loc_t
, i0exp_node= i0exp_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
i0exp_get_loc
  (x0) = x0.i0exp_loc
implement
i0exp_get_node
  (x0) = x0.i0exp_node
//  
implement
i0exp_make_node
(loc0, node) = $rec
{
i0exp_loc= loc0, i0exp_node= node
} (* i0exp_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
i0gua_tbox = $rec
{ i0gua_loc= loc_t
, i0gua_node= i0gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
i0gua_get_loc(x0) = x0.i0gua_loc
implement
i0gua_get_node(x0) = x0.i0gua_node

implement
i0gua_make_node
  (loc0, node) = $rec
{
  i0gua_loc= loc0, i0gua_node= node
} (* i0gua_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
i0clau_tbox = $rec
{ i0clau_loc= loc_t
, i0clau_node= i0clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
i0clau_get_loc(x0) = x0.i0clau_loc
implement
i0clau_get_node(x0) = x0.i0clau_node

implement
i0clau_make_node
  (loc0, node) = $rec
{
  i0clau_loc= loc0, i0clau_node= node
} (* i0clau_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
i0gpat_tbox = $rec
{ i0gpat_loc= loc_t
, i0gpat_node= i0gpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
i0gpat_get_loc(x0) = x0.i0gpat_loc
implement
i0gpat_get_node(x0) = x0.i0gpat_node

implement
i0gpat_make_node
  (loc0, node) = $rec
{
  i0gpat_loc= loc0, i0gpat_node= node
} (* i0gpat_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
i0dcl_tbox = $rec
{ i0dcl_loc= loc_t
, i0dcl_node= i0dcl_node
} (* end of [absimpl] *)

in(*in-of-local*)
//
implement
i0dcl_get_loc
  (x0) = x0.i0dcl_loc
implement
i0dcl_get_node
  (x0) = x0.i0dcl_node
//  
implement
i0dcl_make_node
(loc0, node) = $rec
{
i0dcl_loc= loc0, i0dcl_node= node
} (* i0dcl_make_node *)
//
end // end of [local]

(* ****** ****** *)

(* end of [intrep0.dats] *)
