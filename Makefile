DNAS_SRC=src/
DNAS_LIB=lib/
TARGET=DNAs
LIBS=-I,/usr/lib/ocaml/
FLAGS= -use-ocamlfind -pkgs llvm,llvm.analysis,llvm.bitwriter,llvm.bitreader,llvm.linker,llvm.target -cflags -w,+a-4
OCAMLBUILD=ocamlbuild
OPAM=opam config env


.PHONY: master.all native byte depend

all: clib native
	@ echo "Finished!"

clib:
	@ echo "## Building Extern C Lib"
	@ clang -c -emit-llvm $(DNAS_LIB)/c_lib.c -lm
	@ mv c_lib.bc $(DNAS_LIB)/c_lib.bc

native:
	@ echo "## Building DNAs.native"
	@ eval `opam config env`
	@ $(OCAMLBUILD) $(FLAGS) $(DNAS_SRC)/$(TARGET).native

byte:
	@ cd src
	@ $(OCAMLBUILD) $(FLAGS) $(TARGET).byte
	@ cd ..

depend:
	@ echo "Not needed."


# "make clean" removes all generated files
.PHONY : clean

clean :
	ocamlbuild -clean
	rm -rf test_DNAs.log *.diff DNAs scanner.ml parser.ml parser.mli
	rm -rf *.cmx *.cmi *.cmo *.cmx *.o *.ll
