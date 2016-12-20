#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>

#define EPS 0.000001

char codon[64] = {'K', 'D', 'K', 'D', 'T', 'T', 'T', 'T', 'R', 'S', 'R', 'S', 'I', 'I', 'M', 'I', 'Q', 'H', 'Q', 'H', 'P', 'P', 'P', 'P', 'R', 'R', 'R', 'R', 'L', 'L', 'L', 'L', 'E', 'D', 'E', 'D', 'A', 'A', 'A', 'A', 'G', 'G', 'G', 'G', 'V', 'V', 'V', 'V', 'B', 'Y', 'B', 'Y', 'S', 'S', 'S', 'S', 'B', 'C', 'W', 'C', 'L', 'F', 'L', 'F' };

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
    char retstr [length];
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
	//printf("%d\n", length);
    return retstr;
}

int char_num(char a){
    int ret = 0;
    if(a == 'A' || a == 'a')
        ret = 0;
    else if(a == 'C' || a == 'c')
        ret = 1;
    else if(a == 'G' || a == 'g')
        ret = 2;
    else if(a == 'U' || a == 'u')
        ret = 3;
    return ret;
}
int codon_number(char a, char b, char c){
    return char_num(a) * 16 + char_num(b) * 4 + char_num(c);
}

char* translate(char* str){
    if(!str)
        return str;
    int i = 0;
    while(str[i] != 0) i++;
    int length = i;
    //printf("%s\n", "length");
    //printf("%d\n", length);
    // good here
    int start[3];
    int ending[3];
    for(i=0; i<3; i++){
        start[i] = -1;
        ending[i] = -1;
    }
    int temp=0;
    for(i = 0; i<length-2; i++){
        temp = codon_number(str[i], str[i+1], str[i+2]);
        if(temp == 14 || temp == 46){
            if(start[i%3] == -1)
                start[i%3] = i;
        }
        if(temp == 48 || temp == 50 || temp == 56){
            if(start[i%3] != -1){
                if(ending[i%3] == -1 && i>start[i%3])
                    ending[i%3] = i;
            }
        }
    }
    temp = -1;
    for(i = 0; i<3; i++){
        if(start[i] != -1 && ending[i] != -1){
			if(temp != -1 && start[i]<start[temp])
				temp = i;
			if(temp == -1)
				temp = i;
			// temp = i;

        }
    }
    //printf("%s\n", "temp");
    //printf("%d\n", ending[0]);

    char* retdef = "No possible translation available.";
    if(temp == -1)
        return retdef;
    int b = ending[temp];
    int a = start[temp];
	//printf("%d\n", b);
	//printf("%d\n", a);
    int ret_size = (b-a)/3 + 1;
	//printf("%d\n", ret_size);
    char retstr [ret_size];
    //char* retstr = malloc(ret_size);
    int index;
    for(int i = a; i<b; i=i+3){
        temp = codon_number(str[i], str[i+1], str[i+2]);
        index = (i-a)/3;
		//printf("%d\n", index);
        retstr[index] = codon[temp];
		//printf("%c\n", codon[temp]);
		//printf("%c\n", retstr[index]);
    }
	//printf("%d\n", ret_size);
	retstr[ret_size-1] = '\0';
	/*for(int i = 0; i<ret_size-1; i++)
		printf("%c\n", retstr[i]); */
	int length2 = ret_size - 1;
	char retstr2 [length2];
    int curr;
    for(int i = 0; i<length2; i++){
        curr = retstr[i];
        retstr2[i] = curr;
    }
    retstr2[length2] = '\0';
    return retstr2;
    //return retstr;
}

char* translate2(char* str){
	char* str1 = transcribe(str);
	char* str2 = translate(str1);
	return str2;
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

int printPep(char * input)
{
    int i= 0;
    while(input[i] != 0) i++;
    for (int j=0; j<(i-1); j++)
    {
        char temp = (char) input[j];
        printf("%c", temp);
        printf("-");
    }
    printf("%c", input[i-1]);
    return 1;

}
bool testValid(char * input, char type)
{
    int size = 0;
    while(input[size] != 0) size++;
    if (type == 'd')// dna type checking
    {
        for (int i =0; i< size; i++)
        {
       
            if ((input[i] != 'a') && (input[i] != 't') && (input[i] != 'g')  && (input[i] != 'c')  && (input[i] != 'A')  && (input[i] != 'T')  && (input[i] != 'G')
              && (input[i] != 'C'))
            {
                return 0;
            }
        }
    }
    if (type == 'r')// dna type checking
    {
        for (int i =0; i< size; i++)
        {
             if ((input[i] != 'a') && (input[i] != 'u') && (input[i] != 'g')  && (input[i] != 'c')  && (input[i] != 'A')  && (input[i] != 'U')  && (input[i] != 'G')
              && (input[i] != 'C'))
                return 0;
        
        }
    }
    if (type == 'p')// dna type checking
    {
        for (int i =0; i< size; i++)
        {
            // implement checker
        
        }
    }

    return 1;
}