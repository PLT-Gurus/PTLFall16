#!/bin/bash
# Run DNA#
# If the terminal shows "can't find command", plz input "chmod +x runDNAs.sh" in terminal first.

LLI="lli"
#LLI="/usr/local/opt/llvm/bin/lli"

DNAS="./DNAs.native"
#DNAs="_build/DNAs.native"

DEFAULT_PATH="."

Run() {
    eval $*
}

Usage() {
    echo "Usage: testall.sh [options] [.dnas files]"
    echo "-a   Print AST of file"
    echo "-c   Compile file"
    echo "-r   Run file"
    echo "-h   Print this help"
    exit 1
}


GenerateAst(){
    basename=`echo $1 | sed 's/.*\\///
                             s/.dnas//'`
    echo "# generating AST of ${basename}.dnas ..."
    Run "$DNAS -a" "<" $1 ">" "${DEFAULT_PATH}/${basename}.ast"
    echo "     ${basename}.ast ... Done"
}

GenerateLlvm (){
    basename=`echo $1 | sed 's/.*\\///
                             s/.dnas//'`
    echo "# generating Llvm-IR of ${basename}.dnas ..."
    Run "$DNAS -l" "<" $1 ">" "${DEFAULT_PATH}/${basename}.ll"
    echo "     ${basename}.ll ... Done"
}

CompileFile(){
    basename=`echo $1 | sed 's/.*\\///
                             s/.dnas//'`
    echo "# compiling ${basename}.dnas"
    Run "$DNAS" "<" $1 ">" "${DEFAULT_PATH}/${basename}.ll"
    echo "     ${basename}.ll ... Done"
    Run "$LLI" "${DEFAULT_PATH}/${basename}.ll" ">" "${DEFAULT_PATH}/${basename}.out"
    echo "     ${basename}.out ... Done"

}

RunProgram(){
    basename=`echo $1 | sed 's/.*\\///
                             s/.dnas//'`

    Run "$DNAS" "<" $1 ">" "${DEFAULT_PATH}/${basename}.ll"

    echo "# Executing ${basename}.dnas ..."
    Run "$LLI" "${DEFAULT_PATH}/${basename}.ll"

}

#entrance point of shell
MODE="Compile"

while getopts acrlh c; do
    case $c in
	a) # Ast
	    MODE="Ast"
	    ;;
	c) # Compile
		MODE="Compile"
		;;
	r) # Run
		MODE="Run"
		;;
    l) #LLVM-IR
        MODE="Llvm"
        ;;
	h) # Help
	    Usage
	    ;;
    esac
done

shift `expr $OPTIND - 1`

if [ $# -ge 1 ]
then
    files="$@"
else
    files="*.dnas"
fi

for file in $files
do
    case $MODE in
	Ast)
	    GenerateAst $file
	    ;;
    Llvm)
        GenerateLlvm $file
        ;;
	Compile)
	    CompileFile $file
	    ;;
	Run)
	    RunProgram $file
	    ;;
    esac
done
