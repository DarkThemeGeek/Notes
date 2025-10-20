bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
   a dw 512
   b dd 10

; our code starts here
segment code use32 class=code
    start:
   ; mov eax,0
   ; mov ax,[-a]
   ; add eax,[b] unsigned conversions
    mov ax,word[a]
    
    CWDE;signed conversions
    ;CBW AL->AX implicit operands
    ;CWDE AX->EAX
    ;mov <reg8> <mem8> explicit operands
    ;CWD AX->DX:AX
    ;CDQ EAX->EDX:EAX
    
    ;MUL op Unsigned
    ;AL*op=AX
    ;AX*op=DX:AX
    ;EAX*op=EDX*EAX
    ;IMUL signed
    
    ;DIV op
    ;b=> AX/op -AL,AH remainder
    ;w=> DX:AX/op AX,DX remainder
    ;d=> EDX:EAX/op EAX,EDX remainder
    ;IDIV op signed
    
    
    ;ADC /SBB add with carry/subb with carry
    x dq 5
    z dq 10
        mov eax,[x]
        mov edx,[x+4]
         
        ADc eax[z]
        add edx[z+4];use carry flag cf in case of overflow
    ; push and pop from the stack
    ;push eax pop ax ,pop dx eax->dx:ax
    ;push dx,push ax pop eax -> dx:ax->eax
            push    dword 0      ; push the parameter for exit onto the stack
            call    [exit]       ; call exit to terminate the program
