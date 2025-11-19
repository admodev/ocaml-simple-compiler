%{
open Ast
%}

/* Token declarations */
%token <int> INT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token EOF
%token SEMICOLON

/* Precedence and associativity */
%left PLUS MINUS
%left TIMES DIV
%nonassoc UMINUS

/* Built-in function expressions */
%token PRT
%token LBRACE RBRACE

/* Entry point */
%start <Ast.program> program

%%

program:
  | exprs = separated_list(SEMICOLON, expr) EOF { exprs }
  ;

expr:
  | n = INT { Int n }
  | e1 = expr PLUS e2 = expr { Add (e1, e2) }
  | e1 = expr MINUS e2 = expr { Sub (e1, e2) }
  | e1 = expr TIMES e2 = expr { Mul (e1, e2) }
  | e1 = expr DIV e2 = expr { Div (e1, e2) }
  | MINUS e = expr %prec UMINUS { Neg e }
  | LPAREN e = expr RPAREN { e }
  | PRT LBRACE e = expr RBRACE { PRT (e) }
  ;
