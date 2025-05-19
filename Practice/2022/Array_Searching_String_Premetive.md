### Task: Array_Searching_Using_String_Premetive

```asm

INCLUDE irvine32.inc
.data
    arr dword 2,3,5,6,7,2,1,3,5,7,8,54,3,54,6,8,9,0,8,77,7,2,1,89,34
    brr dword 77,54,0
   
.code

main proc
   
    mov ecx,lengthof brr
    mov esi,offset brr
    mov ebx,offset arr
    L1:
    push ecx
    mov edi,offset arr
    mov eax,[esi]
    mov ecx,lengthof arr
    repne scasd
    jnz cont
    sub edi,4
    mov eax,edi
    sub eax,ebx
    call writeint
    call crlf

    cont:
    add esi,4
    pop ecx
    loop L1
    
    exit
main endp
end main
```
