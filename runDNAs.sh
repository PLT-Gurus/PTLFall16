#!/bin/bash
# Run DNA#

ocamllex scanner.mll

ocamlyacc parser.mly

ocamlc -c ast.mli # compile AST types

ocamlc -c parser.mli # compile parser types

ocamlc -c scanner.ml # compile the scanner

ocamlc -c parser.ml # compile the parser

ocamlc -c runDNAs.ml # compile the interpreter

ocamlc -o DNAs parser.cmo scanner.cmo runDNAs.cmo

./DNAs