(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
dataprop
FIB(int, int) =
|
FIB0(0, 0) of ()
|
FIB1(1, 1) of ()
|
{n:nat}
{r0,r1:int}
FIB2(n+2, r0+r1) of
(FIB(n+0, r0), FIB(n+1, r1))
(* ****** ****** *)
//
#extern
fun
fact{n:nat}
( n0
: int(n)
)
:
[r:int] (FIB(n, r) | int(r))
//
(* ****** ****** *)

implfun
fact{n}(n0) =
(
if
(n0 = 0)
then (FIB0() | 0)
else
(
if
(n0 = 1)
then
(FIB1() | 1)
else
let
val (pf0 | r0) = fact(n0-2)
val (pf1 | r1) = fact(n0-1)
in
  (FIB2(pf0, pf1) | r0 + r1)
end
)
) (* end of [fact] *)

(* ****** ****** *)

(* end of [test01.dats] *)
