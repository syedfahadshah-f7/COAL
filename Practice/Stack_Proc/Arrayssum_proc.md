```asm
INCLUDE Irvine32.inc
; reversing String
.data
  a dword 1,2,3,4
  b dword 5,6,7,8,9
  x dword 10,11,12
.code
main PROC
    mov eax,0
    call SumOfArrays
    call writeint

    exit
main ENDP

SumOFArrays proc
    ;mov eax,0
    mov ecx,lengthof a
    mov esi,0
    L1:
    add eax,a[esi*type a]
    inc esi
    loop l1

    mov ecx,lengthof b
    mov esi,0
    L2:
    add eax,b[esi*type b]
    inc esi
    loop l2

    mov ecx,lengthof x
    mov esi,0
    L3:
    add eax,x[esi*type x]
    inc esi
    loop l3
    ret

SumOFArrays endp
END main
```
### Output
![image](https://github.com/user-attachments/assets/f99ed701-78e7-4824-afa1-ca5432c1c8a8)
