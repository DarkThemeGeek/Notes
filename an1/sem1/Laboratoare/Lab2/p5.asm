bits 32
global start
extern exit
import exit msvcrt.dll
;(f*g-a*b*e)/(h+c*d)
segment data use32 class=Data

a db 3
b db 5
c db 6
d db 7

e dw 1 
f dw 2
g dw 3 
h dw 4

temp1 dd 0
segment code use32 class=code

start:
mov ax,[f]
mul word[g]
push dx
push ax
pop dword[temp1];temp1<-f*g

mov al,[a]
mul byte[b];ax<-a*b
mul word[e]
push dx
push ax
pop ebx;ebx<-a*b*e

sub dword[temp1],ebx;(f*g-a*b*e)
mov al,[c]
mul byte[d];c*d
add ax,[h];h+c*d
CWDE  
sub ebx,eax;ebx-<f*g-a*b*e)-(h+c*d)

push dword 0

call[exit]