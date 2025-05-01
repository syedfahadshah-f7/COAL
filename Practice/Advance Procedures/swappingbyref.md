```asm
include irvine32.inc

.data 
    a dword 4
    b dword 6

.code
main proc
    push offset a       ; push address of a
    push offset b       ; push address of b

    call _swap
    add esp, 8          ; clean up stack (2 DWORDs)

    ; print swapped values
    mov eax, a
    call WriteInt
    call Crlf
    mov eax, b
    call WriteInt
    call Crlf

    exit
main endp

; --------------------------------------------------
; void _swap(int* pa, int* pb)
; Swaps the values at the two pointers
; --------------------------------------------------
_swap proc
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]     ; eax = address of a
    mov ebx, [ebp + 12]    ; ebx = address of b

    mov ecx, [eax]         ; ecx = *a
    mov edx, [ebx]         ; edx = *b

    mov [eax], edx         ; *a = *b
    mov [ebx], ecx         ; *b = *a

    pop ebp
    ret
_swap endp

end main

```
