{
open Parser
}

let whitespace = [' ' '\t' '\r' '\n']
let digit = ['0'-'9']
let int = digit+
let letter = ['a'-'z' 'A'-'Z']
let ident = letter (letter | digit | '_')*

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
  | "LET" { LET }
  | "PRT" { PRT }
  | "STRING" { TYPE_STRING }
  | "INT" { TYPE_INT }
  | '"' ([^'"']* as s) '"' { STRINGLIT s }
  | ident as id { IDENT id }
  | eof { EOF }
  | _ as c { failwith (Printf.sprintf "Unexpected character: %c" c) }
