.386
.model flat,c
.data
	A dd 25
	M dw 7
	k db 5
.code
main proc
	;maska je u EDI
	mov cl, k
	mov edi, 1
	shl edi, cl
	dec edi

	movzx ecx, M
	mov ebp, A
	xor ebx, ebx
	petlja:
		mov edx, ecx
		and edx, edi; p^
		shl edx, 2; 4*P
		mov eax, ebp
		sub eax, edx
		mov edx, ecx
		shl edx, 2;4*P
		mov esi, ebp
		sub esi, edx
		xor edx, edx
		div esi; A+4*P^/A-4*P
		add ebx, eax
	loop petlja
		
	
main endp
end main