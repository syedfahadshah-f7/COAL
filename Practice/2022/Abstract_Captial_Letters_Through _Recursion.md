### Task: Abstract_Captial_Letters_Through _Recursion
```asm
INCLUDE irvine32.inc
.data
    m1 byte "FAST National University Karachi",0
    CCASE dword (lengthof m1) DUP(0)
.code

CAPTICAL_CASE proto,
    str1: PTR BYTE, len:BYTE, i:BYTE, j:DWORD   ; Changed j to DWORD


main proc
    invoke CAPTICAL_CASE, addr m1, lengthof m1, 0, 0
    
    mov ecx, lengthof CCASE
    mov esi, offset CCASE
    L1:
    mov eax, [esi]
    cmp eax, 0
    je BREAK_LOOP
    call writechar
    add esi, 4
    loop L1

    BREAK_LOOP:
    exit
main endp

CAPTICAL_CASE proc,
    str1: PTR BYTE, len:BYTE, i:BYTE, j:DWORD   ; Changed j to DWORD

    mov esi, str1
    mov bl, len
    cmp i, bl
    jge Base_Case

    mov eax, 0
    mov al, [esi]
    cmp al, 'A'
    jl NEXT
    cmp al, 'Z'
    jg NEXT

    mov eax, [esi]
    mov edx, j                  
    mov CCASE[edx*4], eax       
    inc j                       

    NEXT:
    inc esi                     
    inc i
    invoke CAPTICAL_CASE, esi, len, i, j

    Base_Case:
    ret
CAPTICAL_CASE endp
end main
```
