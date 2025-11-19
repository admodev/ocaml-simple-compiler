(* Abstract Syntax Tree definition *)

type expr =
  | Int of int
  | Add of expr * expr
  | Sub of expr * expr
  | Mul of expr * expr
  | Div of expr * expr
  | Neg of expr
  | LET of string * string * expr  (* type, name, value *)
  | PRT of expr
  | STRING of string

(* A program is a list of expressions *)
type program = expr list

(* Pretty printer for the AST *)
let rec string_of_expr = function
  | Int n -> string_of_int n
  | Add (e1, e2) -> Printf.sprintf "(%s + %s)" (string_of_expr e1) (string_of_expr e2)
  | Sub (e1, e2) -> Printf.sprintf "(%s - %s)" (string_of_expr e1) (string_of_expr e2)
  | Mul (e1, e2) -> Printf.sprintf "(%s * %s)" (string_of_expr e1) (string_of_expr e2)
  | Div (e1, e2) -> Printf.sprintf "(%s / %s)" (string_of_expr e1) (string_of_expr e2)
  | Neg e -> Printf.sprintf "(-%s)" (string_of_expr e)
  | PRT e -> Printf.sprintf "print(%s)" (string_of_expr e)
  | LET (t, x, e) -> Printf.sprintf "let %s %s = %s" t x (string_of_expr e)
  | STRING s -> s

(* Pretty printer for a program *)
let string_of_program exprs =
  String.concat "\n" (List.map string_of_expr exprs)
