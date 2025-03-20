```asm
INCLUDE Irvine32.inc
; reversing String
.data
  m4 byte 12 Dup(0)
  m1 byte "Hello World",0
  m2 byte "Original String: ",0
  m3 byte "After Reversing: "
.code
main PROC
   mov edx,offset m2
    call writestring
    mov edx,offset m1
    call writestring
    call crlf
   mov ecx, lengthof m1 -1
   mov esi,0

   L1:
   movzx eax,m1[esi]
   push eax
   inc esi
   loop l1

    mov esi,0
    mov ecx, lengthof m1 -1
    L2:
    pop eax
    mov m4[esi],al
    inc esi
    loop L2

    mov edx,offset m3
    call writestring
    mov edx,offset m4
    call writestring
    
    exit
main ENDP
END main
```
### Output
![image](https://github.com/user-attachments/assets/76835a64-b6e1-4a03-af0d-f5ce5475c9f6)
