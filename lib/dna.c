#include <stdio.h>
#include <stdlib.h>
// A 65 C 67 G 71 T 84 97 99 103 116
char* complement(char* str){
    if(!str)
        return str;
    int i = 0;
    while(str[i] != 0) i++;
    int length = i;
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
    if(!str)
        return str;
    int i = 0;
    while(str[i] != 0) i++;
    int length = i;
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

char* translate(char* str){
    if(!str)
        return str;
    int i = 0;
    while(str[i] != 0) i++;
    int length = i;
    char* retstr = malloc(length);
    char curr;
    //bool trans = false;
    char* retdef = "No possible translation available.";
    int start, end;
    if(length > 6){

    }

    return retdef;
}

int main(){
    char* str = complement("ATAgcGcAT");
    char* str2 = transcribe("ATAgcGcAT");
    char* str3 = translate("ATA");
    printf("%s\n", str);
    printf("%s\n", str2);
    printf("%s\n", str3);
    free(str);

    return 1;
}
