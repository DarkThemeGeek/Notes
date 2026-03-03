bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a dd "1 4 -7 12 -5 3"
    len equ ($-a)/4
; our code starts here
segment code use32 class=code
    start:
        ; ...
        repeat:
        mov esi,0
        mov ecx,len
            repeat2:
                mov eax,[a+esi*4]
                mov ebx,[a+esi*4+4]
                cmp ebx,eax
                jg swap
                jmp repeat
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
        swap:
        xchg ebx,eax
        mov [a+esi*4],eax
        mov [a+esi*4+4],ebx
