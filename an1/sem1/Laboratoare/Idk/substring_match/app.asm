bits 32
segment code use32 class=code
global _subsequence

_subsequence:                 ; actually substring
    mov esi, [esp+4]          ; needle
    mov edi, [esp+8]          ; haystack
    mov edx, esi              ; save needle start
    mov ecx, edi

string_loop:
    cmp byte [esi], 0
    je found_word

    cmp byte [ecx], 0
    je not_found_word

    mov al, [ecx]
    cmp [esi], al
    jne next_letter

    inc esi                   ; advance both
    inc ecx
    jmp string_loop

next_letter:
    inc edi
    mov esi, edx
    mov ecx, edi
    jmp string_loop

found_word:
    mov eax, 1
    ret

not_found_word:
    mov eax, 0
    ret
