#include <stdio.h>
extern "C" int* reverse_and_double(int*arr,int size,int* new_arr);
int main() {
    int numbers[100];
    int reverse_numbers[100];   
    int i = 0;

    FILE* file = fopen("numbers.txt", "r");
    if (!file) {
        perror("Failed to open file");
        return 1;
    };
    
    int n=0;
    while (i < 100) {
        int num;
        if (fscanf(file, " %d", &num) != 1) break;  // skip any whitespace
        numbers[i++] = num;
        n++;
        fscanf(file, ","); // optional: skip commas if present
    }

    fclose(file);
    //printf("%s","works");
    reverse_and_double(numbers,n,reverse_numbers);
    for (int i=0;i<n;i++)
       printf("%d ", reverse_numbers[i]);

    return 0;
}
