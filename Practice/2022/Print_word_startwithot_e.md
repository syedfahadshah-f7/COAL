### Task:Print_word_startwithot_e

```asm
INCLUDE irvine32.inc
.data
    m1 byte "each other eager eagerly v2car eagerness foxy eagle-eyed earache",0
   
.code

main proc
    mov ebx,offset m1
    mov edx,ebx
    mov ecx,lengthof m1
    L1:

    cmp byte ptr [ebx],' '
    jne cont

    inc ebx
    cmp byte ptr [ebx],'e'
    je cont

    mov eax,ebx
    sub eax,edx
    call writeint
    call crlf

    cont:
    inc ebx
    loop l1
    
    exit
main endp
end main
```
