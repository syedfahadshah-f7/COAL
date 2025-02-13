include irvine32.inc
.data
	val3 SDWORD -2147483647
.code
	main proc
		mov eax,val3

		call dumpregs
	exit
main endp
end main 
