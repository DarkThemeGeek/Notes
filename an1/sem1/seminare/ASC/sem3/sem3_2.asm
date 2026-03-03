bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; Array/string operations
segment data use32 class=data
   a dd 1,2,3,4,5,9,10
   len equ($-a)/4;$current address pointer=the start of the data segment + number of allocated space number of bytes allocated up to this point

; our code starts here
segment code use32 class=code
    start:
        mov eax,a ;adressing memory there is a formula base(first adress esp ebp)+index(any regester +EBP)*scale(1,2,4,?8)+dispalcement(any imediate)
        mov EBX,[eax]
        mov esi,16
        
        mov ebx,[eax+esi*4]
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
