{
open Parser
}

let whitespace = [' ' '\t' '\r' '\n']
let digit = ['0'-'9']
let int = digit+

rule token = parse
  | whitespace+ { token lexbuf }
  | int as n { INT (int_of_string n) }
  | '+' { PLUS }
  | '-' { MINUS }
  | '*' { TIMES }
  | '/' { DIV }
  | '(' { LPAREN }
  | ')' { RPAREN }
  | '{' { LBRACE }
  | '}' { RBRACE }
  | ';' { SEMICOLON }
  | "PRT" { PRT }
  | eof { EOF }
  | _ as c { failwith (Printf.sprintf "Unexpected character: %c" c) }
