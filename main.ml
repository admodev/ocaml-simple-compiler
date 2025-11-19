(* This is a compiler that takes in a file and outputs the AST *)
(* The AST is a tree of nodes that represent the program *)
(* The nodes are the different types of tokens in the program *)
(* The tokens are the different types of tokens in the program *)
(* The tokens are the different types of tokens in the program *)

let () =
  let filename =
    if Array.length Sys.argv > 1 then Sys.argv.(1)
    else (
      print_endline "Usage: main <sourcefile>";
      exit 1)
  in
  let in_channel = open_in filename in
  let lexbuf = Lexing.from_channel in_channel in
  try
    let ast = Compiler_lib.Parser.program Compiler_lib.Lexer.token lexbuf in
    print_endline "AST parsed successfully:";
    print_endline (Compiler_lib.Ast.string_of_expr ast);
    close_in in_channel
  with
  | Compiler_lib.Parser.Error ->
      print_endline "Parse error.";
      close_in in_channel;
      exit 1
  | e ->
      print_endline ("Unexpected error: " ^ Printexc.to_string e);
      close_in in_channel;
      exit 1

