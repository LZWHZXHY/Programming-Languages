(*This is a comment, This is the first program.*)

val x = 34;
(* static enviroment: x : int *)
(* Dynamic enviroment: x -- > 34 *)

val y = 17;
(* static enviroment: x : int, y : int *)
(* Dynamic enviroment: x -- > 34, y --> 17 *)

val z = (x + y) + (y + 2);
(* static enviroment: x : int, y : int, z : int  *)
(* Dynamic enviroment: x -- > 34, y --> 17, z --> 70*)

val q = z + 1;
(* static enviroment: x : int, y : int, z : int, q : int*)
(* Dynamic enviroment: x -- > 34, y --> 17, z --> 70, q = 71 *)
