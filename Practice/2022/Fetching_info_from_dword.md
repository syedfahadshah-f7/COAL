### Task: Fetching info from dword by shifting bits

```asm
INCLUDE irvine32.inc
.data
    Data1 DWORD 0A3BCD12h
    day word 0
    month word 0
    year word 0
    temp word 0
    pres word 0
.code

main proc
    mov eax,Data1
    mov ebx,eax

    shl ax,7
    shr ax,7
    mov pres,ax

    ;writing pressure
    mov eax,0
    mov ax,pres
    call writeint
    call crlf

    mov ax,bx
    shr ax,9
    mov temp,ax
    ;writing Temperature
    mov eax,0
    mov ax,temp
    call writeint
    call crlf

    mov eax,ebx
    shr eax,16
    mov ebx,eax

    mov ah,0
    shl al,1
    shr al,1
    ;writing year
    add ax,1980
    mov year,ax
    call writeint
    call crlf

    mov ax,bx
    shl ax,5
    shr ax,12

    ;writing month
    mov month,ax
    call writeint
    call crlf


    mov ax,bx
    shr ax,11
    ;writing day
    mov day,ax
    call writeint


    exit
main endp
end main
```
