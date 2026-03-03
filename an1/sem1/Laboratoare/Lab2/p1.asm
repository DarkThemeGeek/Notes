;21
bits 32

global start
extern  exit
import  exit msvcrt.dll

segment data use32 class=DATA
a db 3
segment code use32 class=CODE
start:

mov ax,15;

div byte[a]


call[exit]