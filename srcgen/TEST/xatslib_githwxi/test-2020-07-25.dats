(* ****** ****** *)
(*
** A solution to Hanoi Towers
*)
(* ****** ****** *)

(*
** Ported from:
** EFFECTIVATS: HanoiTowers-2.dats
*)

(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gfor.dats"
#staload
"prelude/DATS/gfun.dats"
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gios.dats"
(* ****** ****** *)
#staload
"prelude/DATS/rand.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/gflt.dats"
#staload
"prelude/DATS/string.dats"
#staload
"prelude/DATS/string_vt.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/list.dats"
#staload
"prelude/DATS/array.dats"
#staload
"prelude/DATS/stream.dats"
//
#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
//
abstype pole(n:int)
//
(* ****** ****** *)
//
#extern
fun
pole_make
{n:nat}
( name
: string
, ndisk: int(n)): pole(n)
//
#extern
fun
move_1
{p1,p2:nat | p1 > 0}
(
  P1: pole(p1), P2: pole(p2)
) : (pole(p1-1), pole(p2+1))
//
#extern
fun
move_n{n:nat}
{p1,p2,p3:nat | p1 >= n}
(
  n: int(n)
, P1: pole(p1), P2: pole(p2), P3: pole(p3)
) : (pole(p1-n), pole(p2+n), pole(p3))
//
(* ****** ****** *)

fun
list_make_intrange
{ i0
, i1:int
| i0 <= i1}
( i0: int(i0)
, i1: int(i1))
: list_vt(int, i1-i0) =
if
i0 >= i1
then
list_vt_nil()
else
list_vt_cons
(i0, list_make_intrange(i0+1, i1))

(* ****** ****** *)

local

datatype
pole_(n:int) =
Pole of
(
  string, list(int, n)
) (* end of [pole_] *)

absimpl pole(n:int) = pole_(n)

in (* in-of-local *)

implfun
pole_make(name, ndisk) =
Pole(
  name
, list_vt2t(list_make_intrange(1, ndisk+1))
) (* end of [pole_make] *)

implfun
move_1(P1, P2) = let
//
  val Pole(n1, r1) = P1
  val+list_cons(x, xs) = r1
  val Pole(n2, r2) = P2
//
(*
  val () =
  println!
  (
    "Move [", x, "] from [", n1, "] to [", n2, "]"
  ) (* end of [val] *)
*)
//
in
  (Pole(n1, xs), Pole(n2, list_cons(x, r2)))
end // end of [move_1]

end // end of [local]

(* ****** ****** *)

implfun
move_n
(
  n, P1, P2, P3
) = (
//
if
n > 0
then
(
  P1, P2, P3
) where
{
  val n1 = n - 1
  val (P1, P3, P2) = move_n(n1, P1, P3, P2)
  val (P1, P2)     = move_1(P1, P2)
  val (P3, P2, P1) = move_n(n1, P3, P2, P1)
}
else (P1, P2, P3)
//
) (* end of [move_n] *)

(* ****** ****** *)
//
val A =
  pole_make("A", 4)
val B =
  pole_make("B", 0)
val C =
  pole_make("C", 0)
//
val (A, B, C) = move_n(4, A, B, C)
//
(* ****** ****** *)

(* end of [test-2020-07-25.dats] *)
