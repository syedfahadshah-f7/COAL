### Task: Checking Parity of the entered data

```asm
INCLUDE irvine32.inc
.data
  d dword ?
  m1 byte "Write a Integer for checking Parity :",0
  _even byte "Entered data have even numbers of 1:  ",0
  odd byte "Entered data have odd numbers of 1: ",0
  numones dword 0
.code

main proc
  
    mov ecx,32
    mov eax,0
    mov edx,offset m1
    call writestring
    call readhex
    mov d,eax
    mov ebx,eax
    call writehex
    call crlf


    mov eax, ebx       ; Restore input
    mov ecx, 32
    mov numones, 0     ; optional reset

    L1:
    shr eax,1
    jnc cont
    inc numones
    cont:
    loop L1

    xor edx,edx
    mov eax,numones
    mov ebx,2

    div ebx

    cmp edx,0
    jne ODD_
        mov eax,numones
        mov edx,offset _even
        call writestring
        call writebin
        exit
    ODD_:
        mov eax, numones
        mov edx, offset odd
        call writestring
        call writebin
        call crlf
    exit
main endp
end main
```
