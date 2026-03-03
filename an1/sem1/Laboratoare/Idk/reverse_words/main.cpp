
#include <stdio.h>
extern "C" void sentence_reverse(char* s,char* output);

int main(){
    char s[101];
    char new_s[101];
     scanf(" %100[^\n]", s);
    sentence_reverse(s,new_s);
    printf("%s",new_s);
}