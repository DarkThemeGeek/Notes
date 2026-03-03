bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, scanf, printf           ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import scanf msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import printf msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    input_format db "n = ", 0
    output_format db "%d ", 0
    int_format db "%d", 0
    n dd 0



; read a number from the console and then output the first n numbers 

; our code starts here
segment code use32 class=code
    start:
        push input_format
        call [printf]
        add ESP, 4*1

        push n
        push int_format
        call [scanf]
        add ESP, 4*2

        mov ECX, [n]
        mov EAX, 0
        n_for:
            push ECX
            inc EAX
            push EAX
            push EAX
            push output_format
            call [printf]
            add ESP, 4*2
            pop EAX
            pop ECX
        loop n_for

        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
 