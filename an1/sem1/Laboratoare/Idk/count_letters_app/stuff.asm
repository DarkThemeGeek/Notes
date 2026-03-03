bits 32
segment code use32 class=code
global _lettersCount

_lettersCount:
    ; Parameters:
    ; [esp+4] = string pointer
    ; [esp+8] = output pointer
    mov ecx, 0
    mov esi, [esp+4]    ; string pointer
    mov edi, [esp+8]    ; output array pointer

next_word:
    xor eax, eax        ; letter count = 0
    inc ecx
word_loop:
    mov bl, [esi]
    cmp bl, 0
    je done
    cmp bl, ' '
    je store_count

    cmp bl, 'A'
    jb skip_char
    cmp bl, 'Z'
    jbe count_char
    cmp bl, 'a'
    jb skip_char
    cmp bl, 'z'
    jbe count_char

skip_char:
    inc esi
    jmp word_loop

count_char:
    inc eax
    inc esi
    jmp word_loop

store_count:
    mov [edi], eax
    add edi, 4
    cmp byte [esi], 0
    je done
    inc esi
    jmp next_word

done:
mov eax,ecx
    ret
