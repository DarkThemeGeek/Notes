;(a-b)+(d-c) a,b,c,d - byte

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=Data
a db 5
b db 3
c db 7
d db 6
segment code use32 class=code

start:

mov ax,a
mov bx,d

sub ax,[b];

sub bx,[c];

add ax,bx


call[exit]