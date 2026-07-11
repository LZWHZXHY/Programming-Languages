(*examples to demonstrate shadowing*)

val a = 10;
(* a : int, a -> 10 *)

val b = a * 2;
(* b -> 20 *)

val a = 5;
(*a -> 5, b -> 20 *)

val c = b;
(*a -> 5, b -> 20, c-> 20 *)