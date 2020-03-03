(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"
#staload
// UN =
"./../xanadu/prelude/DATS/unsafe.dats"

(* ****** ****** *)

#staload
"./../xanadu/prelude/DATS/gint.dats"
#staload
"./../xanadu/prelude/DATS/gnum.dats"
#staload
"./../xanadu/prelude/DATS/gord.dats"

(* ****** ****** *)

#staload
"./../xanadu/prelude/DATS/gseq.dats"

(* ****** ****** *)

#staload
"./../xanadu/prelude/DATS/list.dats"

(* ****** ****** *)
//
val xs =
list_cons(1,
list_cons(2,
list_cons(3,
list_cons(4, list_nil()))))
//
(* ****** ****** *)
//
impltmp
<x0,xs><y0>
gseq_map_list
  (xs) = let
//
typedef r0 =
p2tr(list_vt(x0))
//
impltmp
foldl$fopr
<x0><r0>
(p0, x0) =
let
//
val r1 = 
list_vt_cons
(map$fopr(x0), _)
//
val p1 = $addr(r1.1)
//
in
$UN.p2tr_set<r0>
(p0, $UN.castlin(r1)); (p1)
end // foldl$fopr
//
var r0: list_vt(y0)
val r1 =
gseq_foldl<x0,xs>(xs, $addr(r0))
//
in
$UN.p2tr_set(p1, list_vt_nil()); $UN.castlin(r0)
end // end of [gseq_map_list]
//
(* ****** ****** *)

val ys =
(
gseq_map_list<int,list(int)>(xs)
) where
{
impltmp map$fopr<int><int>(x0) = x0 + 1
}

(* ****** ****** *)

(* end of [gseq_map.dats] *)
