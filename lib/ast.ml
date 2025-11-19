(* Abstract Syntax Tree definition *)

type expr =
  | Int of int
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr
  | Neg of expr

(* Pretty printer for the AST *)
let rec string_of_expr = function
  | Int n -> string_of_int n
  | Add (e1, e2) -> Printf.sprintf "(%s + %s)" (string_of_expr e1) (string_of_expr e2)
  | Sub (e1, e2) -> Printf.sprintf "(%s - %s)" (string_of_expr e1) (string_of_expr e2)
  | Mul (e1, e2) -> Printf.sprintf "(%s * %s)" (string_of_expr e1) (string_of_expr e2)
  | Div (e1, e2) -> Printf.sprintf "(%s / %s)" (string_of_expr e1) (string_of_expr e2)
  | Neg e -> Printf.sprintf "(-%s)" (string_of_expr e)
