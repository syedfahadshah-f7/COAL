```asm
include irvine32.inc
.data
	arr dword 5 DUP(?)
	m1 byte "Enter 5 digits to know their sum,min,max: ",0
	m2  byte "SUM: ",0
	m3  byte "Min: ",0
	m4  byte "Max: ",0
	m6 byte "Give Review for Solution: ",0
	m5 byte 20 DUP(?)
.code
main proc
	mov esi,0
	mov edx,offset m1
	call writestring

	mov ecx,lengthof arr
	L1:
	call readint
	mov arr[esi*4],eax
	inc esi
	loop L1

	call calculate
	push edx
	mov edx,offset m2
	call writestring
	call writeint
	call crlf

	mov edx,offset m3
	call writestring
	mov eax,ebx
	call writeint
	call crlf

	
	mov edx,offset m4
	call writestring
	pop edx
	mov eax,edx
	call writeint
	call crlf

	mov eax,blue+(yellow*16)
	call settextcolor
	mov edx,offset m6
	call writestring
	mov edx, offset m5
	mov ecx, lengthof m5 -1
	call readstring
	call crlf
	exit
main endp

calculate proc

mov ecx, lengthof arr
mov esi,0
mov ebx,0FFFh ; store min
mov edx,0 ; store max
mov eax,0 ; store sum
L1:
    mov edi, arr[esi*4]   

    ; Check min
    cmp edi, ebx
    jge check_max
    mov ebx, edi

check_max:
    cmp edi, edx
    jle add_sum
    mov edx, edi

add_sum:
    add eax, edi
    inc esi
    loop L1

 call dumpregs
 call crlf
	ret

calculate endp

end main
```
