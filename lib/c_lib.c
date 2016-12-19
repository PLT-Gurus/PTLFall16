#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#define EPS 0.000001

int test(int a,int b)
{
	printf("Hello I'm in C\n");
	return a+b;

}

char* complement(char* str){
	if(!str)
        return str;
    int i = 0;
    while(str[i] != 0) i++;
    int length = i;
    char* retstr [length];
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
    char retstr [length];
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
char* concat(char * input1, char * input2)
{
    int i= 0;
    while(input1[i] != 0) i++;
    int j = 0;
    while(input2[j] != 0)j++;
    int length = i + j;
    char retstr [length];
    for (int k = 0; k < i; k++)
    {
        retstr[k] = input1[k];
    }
    for (int l =0; l <i; l++)
    {
        retstr[i + l] = input2[l];
    }
    retstr[length] = '\0';
    return retstr;

}
int strlength(char * input)
{
    int i =0;
    while (input[i] != 0) i++;
    return i;
}
char* readFASTAFile(char * string) //currently only supports single sequence FASTA of char length < 10000
{
    //Reference for code help: http://stackoverflow.com/questions/4823177/reading-a-file-character-by-character-in-c
    FILE *file = fopen(string, "r");
    char code [10000]; // NOTE: Maybe decrease size???
    size_t n = 0;
    int c;
    int start = -1; 
    if (file == NULL)
        return NULL; //could not open file
    while ((c = fgetc(file)) != EOF) // NOTE: Should we make capital or make lowercase? 
    {
        if (((char) c) == '\n')
        {
            start = 1; 
            continue;
        }
        if ((start >= 0) && ((((char) c) == 'a') || (((char) c) == 't') || (((char) c) == 'g') || (((char) c) == 'c') || (((char) c) == 'A') || (((char) c) == 'T') || (((char) c) == 'G') ||(((char) c) == 'C')) )
        {            
        code[n++] = (char) c;
        }
    }

    // don't forget to terminate with the null character
    code[n] = '\0';    
    return code; 
}
char* readFile(char * string) //currently only supports single sequence FASTA of char length < 10000
{
    //Reference for code help: http://stackoverflow.com/questions/4823177/reading-a-file-character-by-character-in-c
    FILE *file = fopen(string, "r");
    char code [10000]; // NOTE: Maybe decrease size???
    size_t n = 0;
    int c;
    int start = -1; 
    if (file == NULL)
        return NULL; //could not open file
    while ((c = fgetc(file)) != EOF) // NOTE: Should we make capital or make lowercase? 
    {
              
        code[n++] = (char) c;
    }

    // don't forget to terminate with the null character
    code[n] = '\0';    
    return code; 
}

int mod(int a,int b)
{
    return a%b;
}

int exp_ii(int a,int b)
{
    return pow(a,b);
}

double exp_di(double a,int b)
{
    return pow(a,b);
}

double exp_id(int a,double b)
{
    return pow(a,b);
}

double exp_dd(double a,double b)
{
    return pow(a,b);
}


int double2int(double d)
{
    return (int)d;
}

double int2double(int i)
{
    return (double)i;
}

int print_tf(bool b)
{
    if(b){
        return printf("true\n");
    }
    else{
        return printf("false\n");
    }
}
char getChar (char ** input, int index)
{
    if (input == NULL)
        return -1;
    if (input[0][0] == NULL)
        return -1;
    int i = 0;//length of input
    while (input[0][i] != 0) i++;
    if (index >= i)
    {
        return -1;// check for type casting
    }
    char temp =input[0][index];
    return temp;
}
char* formatPep(char * input)
{
    int i= 0;
    while(input[i] != 0) i++;
    char result [i];
    int j = 0;
    for (int k=0; k<i; k++)
    {
        if (input[k] != '-')
        {
            result[j] = input[k];
            j++;
        }
    }
    while (j <= i)
    {
        result[j] = 0;
        j++;
    }
    return result;

}