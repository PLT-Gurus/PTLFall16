#include <stdio.h>
#include <stdlib.h>

int test(int a,int b)
{
	printf("Hello I'm in C\n");
	return a+b;
	
}

char* complement(char* str){
    /*int length = sizeof(str);
    char* retstr = malloc(length);
    char curr;
    for(int i = 0; i<length; i++){
        curr = str[i];
        if(curr == 65 || curr == 84)
            retstr[i] = 149 - curr;
        else if(curr == 67 || curr == 71)
            retstr[i] = 138 - curr;
        else if(curr == 97 || curr == 116)
            retstr[i] = 181 - curr;
        else if(curr == 99 || curr == 103)
            retstr[i] = 170 - curr;
    }
    retstr[length] = '\n';
    return retstr;*/
    char* retstr = "test#$T@#TGF$%G$WSDAF";
    return retstr;
}

char* transcribe(char* str){
    int length = sizeof(str);
    char* retstr = malloc(length);
    char curr;
    for(int i = 0; i<length; i++){
        curr = str[i];
        if(curr == 84)
            retstr[i] = 65;
        else if(curr == 67 || curr == 71)
            retstr[i] = 138 - curr;
        else if(curr == 116)
            retstr[i] = 65;
        else if(curr == 99 || curr == 103)
            retstr[i] = 170 - curr;
        else if(curr == 65 || curr == 97)
            retstr[i] = 85;
    }
    retstr[length] = '\n';
    return retstr;
}