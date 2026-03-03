bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        
;file operations
;file* fopen(char* filename,char*mode)-'r' 'w' 'rw' 'a'
;|
;--> Identifier
;        void *
;int fread(char* buffer,int size,int count ,FILE* id) returns numbe of elements
;char strings
;fscanf(FILE* id,char*format)
;fwrite(char*buffer,int size,int count,file* id);
;fprintf(FILE* filer,char* format,...args)
;fclose(File* file)
; declare external functions needed by our program
;close
extern exit   
extern fopen            ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll
import fopen msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    a resb 1000
    filename_in db "a.in",0
    filename_out db "b.out",0
    fin dd 0
    fout dd 0
    id_in dd 0
    mode_r db "r",0
    mode_w db "w",0
    
; our code starts here
segment code use32 class=code
    start:
        push dword mode_r
        push dword filename_in
        call [fopen]
        add esp ,4*2
        mov [id_in],eax
        cmp eax,0
        je out_f
        push eax
        push dword 1000
        push dword 1
        push dword a
        call [fread]
        add esp,4*4
        mov [a_len],eax
        push dword [id_in]
        call[fclose]
        add esp,4
        mov esi,a
        mov ecx,[a_len]
        cld
        repeat:
        lodsb
        cmp al,a
        jb next
        cmp al,z
        ja next
        inc edx
        xor eax,edx
        next:
            loop repeat 
            push dword mode_w
            call 
        ; exit(0)
        out_f:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
