.386
.model flat, c
.data
	N dw 5
	kol dw ?
.code
main proc
	xor ecx, ecx
	mov cx, n
	xor edi, edi
	xor edx, edx
	petlja:
		mov ax, n ;n
		mov bx, cx;k
		mov bp, bx;u bp je k sto mnozi zagradu
		dec bx; k-1
		sub ax, bx;n - (k-1)
		mul bp; k(n-(k-1))
		movzx eax, ax
		mov dx, cx
		mov cx, bx
		shr ax, cl
		mov cx, dx
		add edi, eax
		xor edx, edx
		loop petlja
	mov eax, edi
	div n
	mov kol, ax
main endp
end main