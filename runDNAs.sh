#!/bin/bash
# Run DNA#
# If the terminal shows "can't find command", plz input "chmod +x runDNAs.sh" in terminal first.

ocamlbuild -use-ocamlfind -pkgs llvm,llvm.analysis -cflags -w,+a-4 \
		runDNAs.native

./runDNAs.native

echo "  "
echo "----- RUNNING RES -----"
lli dnas_llvm.ll