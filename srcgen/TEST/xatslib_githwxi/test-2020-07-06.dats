(* ****** ****** *)
//
// Author: Hongwei Xi (May 2007)
//
(* ****** ****** *)
//
// HX-2012-06-21:
// compiled to
// run with ATS/Postiats
//
(* ****** ****** *)
//
// HX-2012-07-20: ported to ATS2
//
(* ****** ****** *)
//
// HX-2020-07-06: ported to ATS3
//
(* ****** ****** *)
(*
// An implementation of string matching in continuation-passing style.
// The code is translated by Hongwei Xi from an earlier version in DML,
// which was originally adopted by him from a version by Frank Pfenning
// (fp+ AT cs DOT cmu DOT edu)
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

datatype
regexp(int) =
//
  | Any(1) (* any character *)
  | Emp(1) (* empty string matches Empty *)
//
  | Char(1) of char (* "c" matches Char (c) *)
  // every char other than "c" matches Char (c)
  | Char_not(1) of char
  // every char in [c1, c2] matches Chars (c1, c2)
  | Chars(1) of (char, char)
  // every char not in [c1, c2] matches Chars (c1, c2)
  | Chars_not(1) of (char, char)
  // cs matches Alt(p1, p2) if cs matches either p1 or p2
  | {i:nat}
    Rep(i+1) of regexp i // repeat
  | {i,j:nat}
    Alt(i+j+1) of (regexp i, regexp j)
  // cs matches Seq(p1, p2) if a prefix of cs matches p1 and the rest matches p2
  | {i,j:nat}
    Seq(i+j+1) of (regexp i, regexp j)
  // cs matches Rep(p) if cs matches some, possibly 0, copies of p
// end of [regexp]

// Note that [acc] is verified to be terminating!

(* ****** ****** *)

sortdef two = {a:nat | a < 2}

(* ****** ****** *)

typedef regexp = [i:nat] regexp (i)

(* ****** ****** *)

fun acc
  {i0,n,i:nat}
  {b:two | i+b <= i0}
  .<n,i>. ( // metric for termination verification
  cs0: string i0, i0: int i0, p: regexp n, i: int i, b: int b,
  k: {i':nat; b':two | i'+b' <= i+b} (int i', int b') -<cfr> bool
) : bool = let
(*
  val () = (print "acc: enter"; print_newline ())
*)
in
//
case+ p of
| Any =>
  (if i > 0 then k (i-1, 1) else false)

| Emp() => k (i, b)

| Char c => (
    if
    (i > 0)
    then (if c = sub(cs0,i0-i) then k (i-1, 1) else false)
    else false
  ) // end of [Char]

| Char_not c => (
    if
    (i > 0)
    then (if c != sub(cs0, i0-i) then k (i-1, 1) else false)
    else false
  ) // end of [Char_not]

| Chars(c1, c2) =>
  (
    if
    (i > 0)
    then let
      val c0 = sub(cs0, i0-i)
    in
      if
      (c1 <= c0)
      then (if c0 <= c2 then k (i-1, 1) else false) else false
    end else false // end of [if]
  ) // end of [Chars]

| Chars_not (c1, c2) =>
  (
    if
    (i > 0)
    then let
      val c0 = sub(cs0, i0-i)
    in 
      if
      (c0 < c1)
      then k (i-1, 1) else if c0 > c2 then k (i-1, 1) else false
    end else false
  ) // end of [Chars_not]
//
| Rep(p0) =>
  (
    if
    k(i, b)
    then true
    else (
      acc
      ( cs0, i0, p0, i, 0,
        lam (i', b') =>
        if b' = 0 then false else acc (cs0, i0, p, i', 1, k)
      ) // end of [acc]
    ) // end of [if]
  ) // end of [Rep]
//
| Alt (p1, p2) =>
  (
    if
    acc(cs0, i0, p1, i, b, k)
    then true else acc (cs0, i0, p2, i, b, k)
  ) // end of [Alt]
//
| Seq
  (p1, p2) =>
  (
    acc(cs0, i0, p1, i, b, lam(i', b') => acc (cs0, i0, p2, i', b', k))
  ) // end of [Seq]
//
end // end of [acc]

(* ****** ****** *)

#extern
fun
accept
(cs0: string, p: regexp): bool

implement
accept (cs0, p) = let
  val i0 = (string_length(cs0))
in
  acc (cs0, i0, p, i0, 0, lam (i, _) => i = 0)
end // end of [accept]

(* ****** ****** *)
//
// HX: some tests
//
(* ****** ****** *)

val regexp_digit = Chars ('0', '9') 
val regexp_digits = Rep (Chars ('0', '9'))

val regexp_uint =
  Alt(Char '0', Seq(Chars('1', '9'), regexp_digits))

val regexp_int =
  Alt(regexp_uint, Seq(Alt(Char '-', Char '+'), regexp_uint))

val regexp_dot_sats =
  Seq(Rep Any, Seq(Char '.', Seq(Char 's', Seq(Char 'a', Seq(Char 't', Char 's')))))

val regexp_dot_dats =
  Seq(Rep(Any()), Seq(Char '.', Seq(Char 'd', Seq(Char 'a', Seq(Char 't', Char 's')))))

(* ****** ****** *)

val ans10 = accept("123456789", regexp_int) // true
val ans20 = accept("abcdefghi", regexp_int) // false
val ans21 = accept("+123456789", regexp_int) // true
val ans22 = accept("-123456789", regexp_int) // true
val ans23 = accept("?123456789", regexp_int) // false
val ans31 = accept("abcde.sats", regexp_dot_sats) // true
val ans32 = accept("abcde.dats", regexp_dot_dats) // true
val ans41 = accept("abcde.dats", regexp_dot_sats) // false
val ans42 = accept("abcde.sats", regexp_dot_dats) // false

(* ****** ****** *)

(* end of [test-2020-07-06.dats] *)
