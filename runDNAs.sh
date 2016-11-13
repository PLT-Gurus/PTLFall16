#!/bin/bash
# Run DNA#
# If the terminal shows "can't find command", plz input "chmod +x runDNAs.sh" in terminal first.
chmod 777 ./runDNAs.sh  

ocamlbuild -use-ocamlfind -pkgs llvm,llvm.analysis -cflags -w,+a-4 \
		runDNAs.native

./runDNAs.native