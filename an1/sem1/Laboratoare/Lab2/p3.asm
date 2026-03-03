;(a-b)+(d-c) a,b,c,d - word

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=Data
a dw 3
b dw 5
c dw 6
d dw 7
segment code use32 class=code

start:
sub a,[c]
add a,[d]
sub d,[7]
add a.[b]
mov ax,a
mov d,2
sub ax,[d]

call[exit]