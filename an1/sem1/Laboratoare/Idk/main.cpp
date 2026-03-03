
#include <stdio.h>
extern "C" char most_frequent_vowel(const char* word,const int* counter);
extern "C" int count_word(char vowel,char*sentence);

int main(){
    char word[101];
    int counter [101];

    scanf("%s",word);
    printf("%s",word);

    char v=most_frequent_vowel(word,counter);

    char sentence[101]="an are mer";

    scanf("%100[^\n]", sentence);
    printf("%s",sentence);

    int count=count_word('a',sentence);
    printf("%d",count);
    printf("%s",most_frequent_vowel(word));
    


}