.386
.model flat,c
.data
	N dw 8
	suma dd 0
.code
main proc
	mov ecx, 1
	movzx ebx, N
	xor ebp, ebp
	xor eax, eax
	xor edx, edx
	petlja:
		cmp cx, N
		jge kraj
		mov bp, cx; u bp je K
		mov ax, bx; u ax je N
		sub ax, bp;N-K
		inc ax; N-k+1
		mul bp; K*(N-(K-1))
		mov esi, eax; u esi je K*(N-K+1)
		mov eax, ecx
		shr eax, 1;deli sa 2
		jc dalje
		neg esi; negira izracunato
		dalje:
			shr esi, cl; deli sa 2^n
			add suma, esi
			xor edx, edx
			inc cx
		jmp petlja
	kraj:
		ret

main endp
end main