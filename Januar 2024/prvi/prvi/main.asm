.386
.model flat, c

.data
	E dd 6
	D dd 15
	A dw 23
.code
main proc
	movzx esi, A
	mov ebp, D
	mov esp, E
	mov ecx, 16
	xor edx, edx
	petlja:
		cmp ebp, esp
		jle kraj
		;racunamo E
		mov edi, esi; kopija od A
		shl esi, 2; A*4 + a = 5A = E
		add esi, edi;5A = E
		mov esp, esi; kopija E
		;racunamo D novo
		shr esi, 3;E/8 
		shr edi, 2;A/4
		sub edi, esi
		sub ebp, edi; D -= A/4 - E/8
		;inkrementiramo E
		inc esp
		;racunamo novo A
		mov eax, esp; kopoja inkrementiranog E
		mov ebx, 3
		div ebx
		cmp edx, 0
		jl dalje
		inc eax
		xor edx, edx
		dalje:
			add eax, 2
		add esi, eax
		loop petlja
	kraj:
		ret
main endp
end main