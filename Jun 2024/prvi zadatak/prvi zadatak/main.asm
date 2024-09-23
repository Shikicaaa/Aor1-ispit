.386
.model flat, c
.data
	N db 6
	rez dd ?
	S dd ?
	x dd ?
.code
main proc
	;racunanje sume
	xor eax, eax
	mov al, N
	inc eax; N+1
	inc eax
	mul N; N*(N+1)
	shr eax, 3; N*(N+2)/8
	mov ebp, eax; cuvamo s
	;radimo C
	movzx eax, N
	xor edx, edx
	mul eax; n^2
	xor edx, edx
	mul eax; n^4
	mov esp, eax

	xor ebx, ebx; cistimo ebx za sumu
	mov ebp, 1
	mov ecx, 1
	cmp esp, 0
	je kraj
	petlja:
		mov eax, ecx
		xor edx, edx
		cmp ecx, N
		jge kraj
		add eax, ecx
		div esp; (i+s)/C
		add ebx, eax
		inc ecx
		jmp petlja
	kraj:
		ret

main endp
end main