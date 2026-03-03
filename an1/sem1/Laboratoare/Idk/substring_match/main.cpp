#include <stdio.h>
extern "C" bool subsequence(const char* subsequence, const char* target);
int main(){
    char sub[100];
    char target[100];
    scanf("%s %s",sub,target);
    bool answer=subsequence(sub,target);
    if (answer){
        printf("%s","true");
    }
    else{
        printf("%s","false");
    };

}