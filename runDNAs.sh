#!/bin/bash
# Run DNA#
# If the terminal shows "can't find command", please input "chmod +x runDNAs.sh" in terminal first.
ocamllex scanner.mll

ocamlyacc parser.mly

ocamlc -c ast.mli # compile AST types
ocamlc -c parser.mli # compile parser types

ocamlc -c scanner.ml # compile the scanner
ocamlc -c parser.ml # compile the parser
ocamlc -c runDNAs.ml # compile the interpreter

ocamlc -o DNAs parser.cmo scanner.cmo runDNAs.cmo

./DNAs
