bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
;loop ecx
;dec ecx
;cmp ecx,0
;jnz label

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...

; our code starts here
segment code use32 class=code
    start:
        Mov ecx,len
        xor edx,eax
        mov eax,a
        mov esi,0
        jecxz end_label
        repeat:
        mov ebx[eax+esi*4]
        add edx,ebx
        inc esi
        loop repeat
        endl_label:
;loope /loopz loop if zero
;loopne/loopnz loop no equal
; segment[base+ index*scale +displacement]        
        push    dword 0      
        call    [exit]      
