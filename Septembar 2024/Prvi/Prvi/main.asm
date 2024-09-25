.386
.model flat, c
.data
	A dd 4
	B dw 5
	X dw 3
.code
main proc
	mov si, X
	add si, B; u SI je B+C
	mov ecx, 2
	xor esp, esp
	mov ebx, 3
	petlja:
		cmp cx, B
		jge kraj
		mov ebp, ecx
		shl bp, 1; 2m
		add ebp, A; 2m+A
		mov eax, ecx
		and eax, 0F0F0F0F0h; MASKA ZA VISEPOLUBAJTOVE
		mul ebx; 3~m
		sub eax, A;3~m - A
		xor edx, edx
		div ebp;3m~ - A / 2m+A
		add esp, eax
		inc cx
		jmp petlja
	kraj:
		mov eax, esp
		div si
ret
main endp
end main
