bits 32 
segment code use32 class=code
global _count_word
;extern "C" int count_word(char vowel,char*sentence);
_count_word:
push ebx
push esi
push edi
mov eax,0;big counter
mov edx,0;word counter
mov ecx,[esp+4];char vowel
mov esi,[esp+8];char* sentence

sentence_loop:
mov bl,byte[esi]
cmp bl,0
je skip_char

cmp bl,byte[ecx];jmp on correct char
je count_word

cmp bl,' '; jmp on space for end of word
je end_word

skip_char:
inc esi
jmp sentence_loop

count_word:
inc edx

jmp skip_char

end_word:
cmp edx,1
je increase_ct
mov edx,0

cmp bl,0;check for end of all
je done

jmp skip_char;skip to next char


increase_ct:
inc eax
mov edx,0

cmp bl,0;check for end of all
je done

jmp skip_char;check for end of stuff


done:
pop ebx 
pop esi
pop edi
ret
