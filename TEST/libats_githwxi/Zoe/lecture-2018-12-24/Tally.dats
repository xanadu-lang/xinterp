(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fun
tally(n: int): int =
if n > 0 then n + tally(n-1) else 0

fun
iseven(n: int): bool =
if n = 0
  then true
  else
  (
    if n = 1 then false else iseven(n-2)
  ) (* end-of-else *)
// end-of-if

(* ****** ****** *)

local
//
// ZX: [n] is ASSUMED to be even
//
fun
tally2'
(n: int): int =
  if n >= 2
    then n + tally2'(n-2) else 0
  // end of [if]
  
in (* in-of-local *)

fun tally2(n: int): int =
  if iseven(n)
    then tally2'(n) else tally2'(n-1)
  // end of [if]

end // end of [local]

(* ****** ****** *)

implement
main0() =
(
println!("tally(1000) = ", tally(1000));
println!("tally2(1000) = ", tally2(1000));
)

(* ****** ****** *)

(* end of [Tally.dats] *)
