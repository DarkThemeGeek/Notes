#include<iostream>
#include <stdio.h>
 
using namespace std;
extern "C" int num_from_even(int a);
extern "C" int sqrt_root(int a);

int main()
{ 

    int a[100], root, nr_even, sum = 0;
    int n;

    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d", a + i);
        nr_even = num_from_even(a[i]);
        root = sqrt_root(nr_even);
        sum += root;
    }
    FILE* f;
    f=fopen("out.txt","w");
    fprintf(f,"%d",sum);
    return 0;
}