bits 32

global start
extern ExitProcess, printf
import ExitProcess kernel32.dll
import printf msvcrt.dll

segment code use32 class=CODE

;[-1+d-2*(b+1)]/a
start:

   mov al,[b]
   add al,1
   mov bl,2
   mul bl;ax<-2*(b+1)
   sub word[d],ax
   mov ax,[d]
   sub ax,1
   div byte[a]

    push dword 0
    call [ExitProcess]


segment data use32 class=DATA
a db 10
d dw 10
b db 1   