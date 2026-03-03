bits 32 
segment code use32 class=code
;extern "C" void most_frequent_vowel(const char* word,int* frequency);
global _most_frequent_vowel
_most_frequent_vowel:
    ; Parameters:
    ; [esp+4] = string pointer
    push ebx
    push esi
    push edi

    mov ecx, 0
    mov esi, [esp+4]    ; word
    mov edi, [esp+8]  ;frequency counter
    
word_loop:
    mov bl, [esi]
    cmp bl, 0
    je done

    cmp bl, 'A'
    je count_char
    cmp bl, 'E'
    je count_char
    cmp bl, 'I'
    je count_char
    cmp bl, 'O'
    je count_char
    cmp bl, 'U'
    je count_char
    cmp bl, 'a'
    je count_char
    cmp bl, 'e'
    je count_char
    cmp bl, 'i'
    je count_char
    cmp bl, 'o'
    je count_char
    cmp bl, 'u'
    je count_char
    
    inc esi
    jmp word_loop



count_char:
inc dword[edi];should add logic [edi+letter for counter]

done:
pop ebx 
pop esi
pop edi
mov eax,ecx
ret

