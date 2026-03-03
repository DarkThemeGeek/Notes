bits 32
global start        
extern exit             
import exit msvcrt.dll  

; TASK: Two character strings S1 and S2 are given. Obtain the string D which contains all the elements of S1 that do not appear in S2.
; S1: '+', '4', '2', 'a', '8', '4', 'X', '5'
; S2: 'a', '4', '5'
; D: '+', '2', '8', 'X'

; read for more efficient implementations: https://softwareengineering.stackexchange.com/questions/280361/list-comparing-techniques-for-faster-performance
                          
segment data use32 class=data
arr1 db '+', '4', '2', 'a', '8', '4', 'X', '5'
arr2 db "a45"
len1 equ arr2-arr1
len2 equ $-arr2
d resb len1

segment code use32 class=code
    start:
    mov esi,0 ;i
    mov ecx,0 ;j
    mov edi,0;counter
    start_loop1:
        cmp esi ,len1-1
        jz  exit_loop
        inc esi
        start_loop2:
            cmp ecx,esi
            jz  start_loop1
            
            mov edx,[arr2+ecx]
            
            cmp [arr1+esi],edx
            
            je jump_adding_value
            mov edx,[arr1+esi]
            mov [d+edi],edx
            inc edi
            jump_adding_value:
            
            inc ecx
        jmp start_loop2
    jmp start_loop2

    
            
    exit_loop:
    
       
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program