bits 32
segment code use32 class=code
global _sentence_reverse

_sentence_reverse:
    mov esi, [esp+4]    ; input string
    mov edi, [esp+8]    ; output buffer

next_word:
    ; skip spaces
skip_spaces:
    cmp byte [esi], ' '
    jne word_start
    mov byte [edi], ' '
    inc esi
    inc edi
    jmp skip_spaces

word_start:
    cmp byte [esi], 0
    je done

    mov ebx, esi        ; word start

find_end:
    cmp byte [esi], 0
    je reverse
    cmp byte [esi], ' '
    je reverse
    inc esi
    jmp find_end

reverse:
    mov ecx, esi
    dec ecx             ; last character of word

copy_back:
    cmp ecx, ebx
    jb word_done
    mov al, [ecx]
    mov [edi], al
    inc edi
    dec ecx
    jmp copy_back

word_done:
    jmp next_word

done:
    mov byte [edi], 0
    ret
