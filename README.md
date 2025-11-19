# Ocom (Ocaml Compiler)

This project is a simple OCaml compiler that reads a source file, parses it, and outputs an Abstract Syntax Tree (AST). Later on, it will not just print the AST, but also evaluate it, and finally generate binary code to be executed on a virtual machine.

## Requirements

- OCaml (version 4.x recommended)
- Menhir (for parsing)
- OCamllex (for lexing)

## Build Instructions

1. **Clone the repository:**

   ```sh
   git clone <your-repo-url>
   cd <your-repo-directory>
   ```

2. **Compile the compiler:**

   Normally, a typical build would look like:

   ```sh
   menhir --ocamlc 'ocamlc' --explain parser.mly
   ocamllex lexer.mll
   ocamlc -o main.lex lexing.cmo lexer.ml parser.ml main.ml
   ```

   Adjust filenames if your files differ.

   Alternatively, if you have a build system or a `Makefile`, just run:

   ```sh
   make
   ```

## Usage

To run the compiler on your source file:

```sh
./main <sourcefile>
```

If you don't provide a source file, you'll see the usage:

```
Usage: main <sourcefile>
```

If parsing is successful, you'll get:

```
AST parsed successfully.
```

Otherwise, you'll get an error message.

## Example

Suppose you have an input file named `example.src`:

```sh
./main example.src
```

## Notes

- You can modify the pretty-printing of the AST by editing the corresponding section in `main.ml`.
- For more features (like evaluation or code generation), you can extend the compiler.

Enjoy!
