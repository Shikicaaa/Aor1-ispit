.386
.model flat, c

.data
N dd 4
M dd 5
mat dd -1,2,-3,4,6,
		-5,0,-10,7,4,
		-11,3,2,10,5,
		6,16,-19,25,-69
niz dd 20 dup(?)

.code
procedura proc
	push ebp
	mov ebp, esp
	pushfd
	;potrebni registri
	push edx
	push eax
	mov edx, [ebp+8]
	cmp edx, 0
	jl negativni
	jmp kraj

	negativni:
		mov eax, ecx
		shl eax, 2
		mov niz[eax], edx
		inc ecx
	kraj:
	pop eax
	pop edx
	popfd
	pop ebp
	ret 4;zbog memory leak-a

procedura endp
main proc
	xor ecx, ecx
	xor ebx, ebx
	petlja:
		cmp ebx, M
		jge kraj2
		xor ebp, ebp
		unutrasnja:
			cmp ebp, N
			jge kraj3
			nastavi:
				mov eax, ebx; i
				mul N; i*N
				add eax, ebp; i*N + j
				shl eax, 2; 4*(i*N+j)
				push [mat+eax]
				call procedura
				inc ebp
				jmp unutrasnja
			kraj3:
				inc ebx
				jmp petlja
	kraj2:
		mov eax, '?'
		shl ecx, 2
		mov niz[ecx], eax
		ret
	
main endp
end main