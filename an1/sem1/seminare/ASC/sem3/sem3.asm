bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

                          
;jne jnz jump if equal unsigned
;ja +jb =unsigned conditional groups

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 2
    b db 3
   
ion:

; our code starts here
segment code use32 class=code
    start:
        ; ...
    cmp ebx,eax
    ;unsigned
    ja ion ; jA jump if cf==0 unsgined
    jb ion ; jB jump if cf==1 unsigned
    ;signed
    jl ion ;jl jump if lower sf!==of signed
    jg ion ;jg jump if grater sf==of  signed
    ;jae above or equal >= jnb not below jnbe if not below or equal ja jbe jump below or equal <=
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
