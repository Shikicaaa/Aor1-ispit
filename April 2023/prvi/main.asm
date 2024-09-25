.386
.model flat, c
.data
	x dw 10
	y dw 120
	s dd 15

.code
main proc
	movzx esi, y
	movzx ebx, x
	mov eax, esi
	mov ebp, s
	xor ecx, ecx
	petlja:
		xor edx, edx
		cmp bx, si
		jg kraj
		;racunanje X
		shr ax, 3;y/8
		add bx, ax;y/8 + X
		;racunanje Y
		add si, si; 2y
		add si, y; 3y bolja su 3 add nego da se ubaci 3 u registar i pomnozi
		mov ax, si
		mov cx, bx
		add cx, 5; 5+X
		div bx; 3y/x
		sub cx, ax; 5+x - 3y/x
		;racunanje s
		add ebp, ecx
		add ebp, ebx
		jmp petlja
	kraj:
		ret
main endp
end main