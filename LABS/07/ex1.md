### Nested Function Example
```asm
include irvine32.inc
.data
	
.code
main proc
	mov eax,0
	mov ebx,4
	mov ecx,2
	mov edx,10
	call add_nums
	call writeint
   exit
main endp

add_nums proc
	add eax,ebx
	call sub_nums
	ret
add_nums endp

sub_nums proc
	sub eax,ecx
	call mul_nums
	ret
sub_nums endp

mul_nums proc
	imul eax,edx
	ret
mul_nums endp

end main

```

### Output
![image](https://github.com/user-attachments/assets/beeb14eb-17c9-4b69-8807-cfa571e8a73e)
