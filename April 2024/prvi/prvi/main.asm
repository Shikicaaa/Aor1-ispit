.386
.model flat, c

.data
	A dd 10
	B dw 4
	X dw 3; c
.code
main proc
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	mov esi, 2
	cmp B, 2
	jl kraj_programa
	cmp X, 0
	jl kraj_programa
	petlja:
		mov ebp, esi
		cmp si, B
		jg kraj
		mov eax, esi
		and eax, 0f0f0f0fh
		mov esp, eax
		shl eax, 1; 2ebp
		add eax, esp; 3~m
		sub eax, A; 3~m - A
		shl ebp, 1; 2m
		sub ebp, A; 2m-A
		div ebp; 3m-A / 2m-A
		cmp edx, 0
		jng nema
		inc eax
		xor edx, edx
		nema:
		inc esi
			add ebx, eax
			jmp petlja
	kraj:
		mov eax, ebx
		mov bx, B
		add bx, X
		div eax
	kraj_programa:
		ret
main endp
end main