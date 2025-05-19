```asm
INCLUDE Irvine32.inc

.DATA
    input BYTE 0,0,1,0,1,0,0,0     ; Binary input
    f DWORD 2                      ; Factor (base 2)
    s DWORD 0                      ; Sum (result)

.CODE

CONVERT_BIN_DEC proto,
    b: ptr byte ,len: dword

main proc
    invoke CONVERT_BIN_DEC, addr input, lengthof input
    exit
main endp

CONVERT_BIN_DEC proc,
    b: ptr byte ,len: dword

    mov ecx, len          
    mov esi, b            
    add esi, ecx
    dec esi                

    mov edi, 0             
    mov s, 0              

L1:
    push ecx               
    movzx ebx, byte ptr [esi]
    cmp ebx, 0
    je cont

    mov eax, 1             
    mov ecx, edi          
L2:
    mul f                 
    loop L2

    add s, eax             

cont:
    pop ecx
    inc edi               
    dec esi                
    loop L1

    mov eax, s
    call WriteInt
    call Crlf

    ret
CONVERT_BIN_DEC endp

end main

```
