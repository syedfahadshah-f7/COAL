### Clean "#" from string
```asm

INCLUDE irvine32.inc
.data
    m1 byte "####Reading####Assembly##Language",0
    m2 byte (lengthof m1) DUP(32)
.code

CLEAN_STRING proto,
    str1: PTR BYTE, len:BYTE, rem: BYTE, newstr:PTR BYTE


main proc
    invoke CLEAN_STRING, addr m1, lengthof m1, '#', addr m2
    mov edx,offset m2
    call writestring
    exit
main endp

CLEAN_STRING proc,
    str1: PTR BYTE, len:BYTE, rem: BYTE, newstr:PTR BYTE

    mov al,rem
    mov edi,str1
    mov esi,newstr
    mov ecx,0
    mov cl,len

    L1:
    cmp al,[edi]
    je NEXT
        mov bl ,[edi]
        mov byte ptr [esi],bl
        inc esi
    NEXT:
    inc edi
    loop L1

 ret
CLEAN_STRING endp
end main
```
