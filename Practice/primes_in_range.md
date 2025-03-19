```asm
include irvine32.inc

.DATA
    n dword ?
    cur dword ?
    cntr dword ?
    m1 byte "Write a positive integer to check if it is prime: ",0
    m2 byte "Primes: ",0
    m3 byte "Not Prime",0

.CODE
MAIN PROC
    ; Taking input n from user
    mov edx, offset m1
    call writestring
    call readint
    mov n, eax

    mov edx, offset m2
    call writestring
    call crlf

    ; Edge case: If n < 2, it's not prime
    cmp n, 2
    jl notprime_exit
    
    mov eax, 2
    call writeint
    call crlf
    mov cur, 3

mainloop:
    mov ecx, 2

L1:
    mov eax, cur 
    xor edx, edx 
    div ecx  

    cmp edx, 0  
    je notprime

    inc ecx  
    cmp ecx, cur 
    jl L1

    ; If prime
    mov eax, cur
    call writeint
    call crlf

notprime:
    mov eax,cur
    inc cur
    cmp eax, n
    jle mainloop
    
    exit

notprime_exit:
    mov edx, offset m3
    call writestring
    call crlf
    exit

MAIN ENDP
END MAIN
```
