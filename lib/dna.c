#include <stdio.h>
#include <stdlib.h>
// A 65 C 67 G 71 T 84 97 99 103 116
char* complement(char* str){
    int length = sizeof(str);
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
    retstr[length] = '\0';
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
    retstr[length] = '\0';
    return retstr;
}

int main(){
    char* str = complement("ATAgcGcAT");
    char* str2 = transcribe("ATAgcGcAT");
    printf("%s\n", str);
    printf("%s\n", str2);
    free(str);
    return 1;
}
