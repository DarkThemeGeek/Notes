;Multiplications, divisions
;a,b,c - byte, d - word
;d-[3*(a+b+2)-5*(c+2)]
bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=Data
a db 3
b db 5
c db 6
d dw 7
segment code use32 class=code

start:

mov al , 2;2 
add al,[c];2+C
mul byte [5];(2+c)*5

mov bx,ax;bx<-(2+c)*5
mov al,[a];a
add al,[b];a+b
add al,2;a+b+2
mul byte[3];(a+b+2)*3
sub ax,bx ;(a+b+2)*3-(2+c)*5
mov dx,[d];final value ah
sub dx,ax;final value ah dx

push dword 0
call[exit]