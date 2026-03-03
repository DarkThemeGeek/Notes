bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
;direction flag df
;cld clear direction flag 0
;std sets direction flag 1
;string operations 
;lodsb al <=DS[ESI] esi+=1 esi-=1 if df=0 or df=1
;stos
;movs
;scas
;cmps
;mov al,esi

;lods =w ax=[esi]
;esi +-2
; eax=[esi]
; esi+-4
;lodsb moves into an reg depnedin on the df
; inc [esi]
;dec [esi]
; our code starts here
segment code use32 class=code
    start:
        ; ...
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
