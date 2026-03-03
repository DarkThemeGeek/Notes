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
        mov edx ,1
        
        repeat
        mov edx ,0
        mov edx,len-1
        mov esi,len 
        dec edx
        repeat2:
            lodsd
            mov ebx,eax
            lods
            cmp ebx,eax
            jg swap
            
            jmp out_label
        
       
        cmp edx,0
        je repeat
        out_label:
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]         ; call exit to terminate the program
        
        swap:
         mov edi,esi
         dec edi
         xchg ebx,eax
         stosd
         mov eax,ebx
         stosd
        jmp repeat