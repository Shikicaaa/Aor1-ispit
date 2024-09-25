.386
.model flat, c

.data
	X dd 20
	N dw 10
	p db 4
.code
main proc
	mov esp, 1
	xor ebp, ebp
	dec ebp
	xor ecx, ecx
	mov cl, p
	shl esp, cl;maska za nize n bitove
	dec esp
	shl ebp, cl;maska za vise n bitove
	mov ecx, 4
	mov esi, ecx
	xor edi, edi
	petlja:
		xor edx, edx
		cmp si, N
		jge kraj
		mov ebx, ecx
		and ecx, esp ; k^
		xor ebx, ebp; k\/
		shl ecx,1
		shl ebx,1
		mov eax, X
		sub eax, ecx; X-2k^
		mov esp, X
		add esp, ebx; X+2k\/
		div esp
		add edi, eax
		inc esi
		jmp petlja
	kraj:
		ret
main endp
end main