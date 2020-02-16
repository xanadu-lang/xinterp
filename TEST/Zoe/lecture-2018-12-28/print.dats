(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fun
foo(x: int): void =
if
(x < 10)
then println!(x)
else (println!(x%10); foo(x/10))

(* ****** ****** *)

fun
bar(x: int): void =
if
(x < 10)
then println!(x)
else (bar(x/10); println!(x%10))

(* ****** ****** *)

implement main0() = bar(12345)

(* ****** ****** *)

(* end of [print.dats] *)
