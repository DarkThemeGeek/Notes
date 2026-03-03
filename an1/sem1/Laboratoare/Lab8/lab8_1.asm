bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit,scanf,printf           ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import scanf msvcrt.dll
import printf msvcrt.dll      ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
a dd 0
input_fromat db "%d",0
output_format db "%d",0

;read n output all numbers until 1
;Call Label
;RET
; our code starts here
segment code use32 class=code
    start:
        ; ...
        push a
        push input_fromat
        call [scanf]
        add esp,4*2
        
        add ecx,[a]
        
        jecxz exit_label
        
        start_loop:
        inc dword[a]
        
        push dword[a]
        PUSH output_format
        
        call[printf]
        
        loop start_loop
        
        
        ; exit(0)
        exit_label:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
