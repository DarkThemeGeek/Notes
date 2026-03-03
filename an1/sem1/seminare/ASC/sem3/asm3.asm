bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
                          
                          
;EFLAGS <reg32>
;CF
;OF -overflow flag (signed carry) if you add 2 negative or positive numbers and the signed bit changes OF=1
;SF -signed flag SF=sign bit of last result 
;ZF -zero flag signals if the last result was 0
;uselss flags
;PF -parity flag
;-------------------------------------------------------
;-------------------------------------------------------
;Instructions
;CMP compare CMP op1,op2 op reg,var,imediate rules of mov
;fake subtraction
;only eflags are changed 
;test 
;(changeing eflags by and )
;"fake and"
;jump instructions
;EIP=the adress of the next instruction to be executed by the cpu
;labels
; name :

;unconditianal jump
;jmp label

;conditional jmp perform change eip based on eflags 
;je label jz label (ZF=1)
;
;
; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a dw 5
    b db 2
    
; our code starts here
segment code use32 class=code

    start:
        mov eax,[a]
        mov ebx ,[b]
        cmp eax,ebx
        jz equal
        jmp not_equal
       
    final:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]        ; call exit to terminate the program
    equal:
        add [a],ebx
        jmp final
    not_equal:
        sub [a],ebx
        jmp final