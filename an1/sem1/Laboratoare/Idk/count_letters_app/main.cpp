#include <cstdio>

extern "C" int lettersCount(const char* str, int* output);

int main() {
    const char* s = "Hello World Test ASM Example";
    int counts[101] = {0};  // Make sure this is big enough
    
    // Pass the **pointer to the array**, NOT counts[0]!
    int n=lettersCount(s, counts);
    printf("%d\n",n);
    for (int i = 0; i < n; i++)
        printf("%d ", counts[i]);

    return 0;
}
