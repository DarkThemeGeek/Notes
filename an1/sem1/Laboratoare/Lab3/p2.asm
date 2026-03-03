;Multiplications, divisions
;a,b,c - byte, d - word
;d-[3*(a+b+2)-5*(c+2)]

bits 32
global start
extern exit
import exit msvcrt.dll

segment data use32 class=Data
a db -3
b dd 10
c dd 5
d dw 7
segment code use32 class=code
;c+(a*a-b+7)/(2+a); a-byte b dd c dd
start:
mov al,[a]
imul byte[a]
CWDE ; cbw cwd ax->dx:ax cwdea ax->eax cdq
sub eax,[b]
add eax,7;c+(a*a-b+7)
mov ebx,eax 

mov al,[a]
mov al,2

CBW
CWDE
; eax <-(2-a) dword
mov ecx,eax
mov eax,ebx


CDQ

IDIV Ecx

add eax,[c]
push dword 0
call[exit]
;ctrl-shift-n for copy paste template stuff