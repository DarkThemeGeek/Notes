bits 32
segment code use32 class=code
global _reverse_and_double

_reverse_and_double:
mov esi,[esp+4];first arr
mov edx,[esp+8];(size of arr it s int so *4)
mov edi,[esp+12];dest arr

arr_loop:
cmp edx,0
je done

dec edx

mov ebx,[esi];geting the value


add ebx,ebx;doubling it

mov [edi+edx*4],ebx;moving the value from the back

add esi,4

jmp arr_loop

done:
ret