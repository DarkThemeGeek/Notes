bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit 
extern printf              ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll  
import printf msvcrt  ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions
;printf/scanf
;printf(format ,)
;"%d" int
;"%u" uint
; "%s string
;"%c character
;%x  - hexadecimal base 16
;%o -octal byte 
; our data is declared here (the variables needed by our program)
;ss== stack segment
;push op
;sub esp, 4/2
;mov ss:[esp],op
;pop op
;mov op,ss:[esp}
;add esp 4/2
;esp<-top  | lower
;ebp<-base | higher

;-CALL op 
;EIP=adress given by op
;EIP return

;ret
;EiP=[ESP]
;add esp,4

;import prinft msvcrt.dll
;extern printf ->directive

;calling conventions
;whre is the return value
;what registers can be changed by the function
;whose responsability it is to free the parameters
;how are the parameters passed to the function

;calling conventions for msvcrt
;the return value is stored on eax
;the registers eax,ecx,edx volatile registers
;the paramters should be freed by the caller
;the paramters are passed on the stack in reverse order
;printf(
; external function: call[printf]
; internal function call label

;push EBP
;mov EBP,ESP
;mov eax,[ebp+8]
segment data use32 class=data
   c dd 1
   b dd 2
   a dd 0
   message dd "Sum of %d + %d =%d",0

   
    
; 0    
; ----------------------=
; |code|heap ->|<- stack|
; ----------------------=
; our code starts here
segment code use32 class=code
    start:
        mov eax,[c]
        add eax,[b]
        mov [a],eax
        mov ecx,3
        push ecx
        repeat_1:
        push dword[a]
        push dword[c]
        push dword[b]
        push message
        call [printf]
        add esp,4*4
        pop ecx
        loop repeat_1
 
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
