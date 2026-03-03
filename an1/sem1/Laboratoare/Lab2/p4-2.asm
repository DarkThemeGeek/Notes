;Multiplications, divisions unsigned
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
segment code use32 class=CODE

start:
mov al,[a]
add al,[b]
add al,2 ;a+b+2
mov bl ,3
mul bl
push ax; pushed (a+b+2)*3 on stack
mov al,[c]
add al,2
mov bl,5
mul bl; ax<-5*(c+2)
pop bx; put bx<- the first paranthesis
sub bx,ax ;first p-second p
sub [d],bx
mov eax,0
mov eax,[d]



push dword 0
call[exit]