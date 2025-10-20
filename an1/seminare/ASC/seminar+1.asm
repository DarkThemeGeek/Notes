;(a*b+c)/d+x
;a-byte
;b-word
;c-dword
;d-byte
;z-dword
;signed
bits 32
global start

start:
    mov al,[a]
    cbw
    mov bx,[b]
    imul bx
    add ax,[c]
    add dx,[c+2]
    mov bx,ax
    mov al,[d]
    cbw
    mov cx,ax
    mov ax,bx
    idiv cx
    cwde
    cdq
    add eax,[x]
    adc edx,[x+4]
    push edx
    push eax
    mov eax,[z]
    cdq
    mov ebx,eax
    mov ecx,edx
    pop eax
    pop edx
    sub eax,ebx
    sub edx,ecx
    
   
.data:
 a db 1
 b dw 2
 c dd 3
 d db 4
 x dq 5
 z dw 6

int 80h