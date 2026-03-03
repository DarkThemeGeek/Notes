bits 32 

global start        

extern exit
extern fopen
extern printf
extern fread

import exit msvcrt.dll
import fopen msvcrt.dll
import printf msvcrt.dll
import fread msvcrt.dll

segment data use32 class=data
    
    text db "Now, here you go again, You say you want your freedom, Well, who am I to keep you down?",0
    len equ $ - text
    result dd 0
    filename dd "file.in",0
    FilePointer dd 0
    r dd "r"
    textBuffer resb 1000
    

segment code use32 class=code
    start:
        ;mov ECX, len
        push dword[r]
        push dword[filename]
        call[fopen]
        mov [FilePointer],eax
        add esi,4*2
        
        push dword FilePointer
        push dword 1
        push dword 1000
        push textBuffer
        call[fread]
        add esi, 4*4
        mov [len],eax
        mov Ecx,eax
        ;jecxz skip_code
        ;condition in case of 0 case
        
        ;moving the adress of the string into edi
        
        mov EDI, textBuffer 
        ;mov BL, 0
        
        loop_start:
        
        ;stosd
        stosb
        
        cmp AL ,' '
        JE space
        
        cmp AL, 'a'
        jge starts_small_char
        
        cmp AL, 'A'
        jge starts_big_char
        
        starts_small_char:
        cmp AL, 'z'
        jle end_if_statements 
        
        jmp is_character
        
        starts_big_char:
        cmp AL, 'Z'
        jge end_if_statements 
        
        jmp is_character
        
        is_character:
        ;mov BL, 1
        mov ebx,0
        
        jmp skip_if 
        
        end_if_statements:
        ;mov BL, 0
        skip_if:
        jmp loop_start
        loop_end:
       ; mov BL, 0
        skip_code:
        
        mov eax,result
        push eax
        push "%d"
        call [printf]
        add esi,4*2
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program

        space:
            add [result],ebx
        jmp loop_start