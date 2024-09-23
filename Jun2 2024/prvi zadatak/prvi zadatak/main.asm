.386
.model flat, c
.data
	N db 5
	deljenje dd ?
.code
main proc
;s -> al
;C -> ebx jer s*s*s*s = 32b
;A i B su 16B
	movzx eax, N
	shr al, 1; N/2
	;N*(N+1)/2
	mov bl, al
	inc bl
	mul bl
	shr ax, 1; posto 8bit * 8bit = 16bit
	mov si, ax; SI = S

	xor ebx, ebx
	xor ecx, ecx
	xor edi, edi
	movzx edi, N
	mov eax, edi
	mul edi; N^2
	mul eax;N^4 = C

	mov ebx, eax; EBX = C
	xor eax, eax; Bi, Ai di
	xor ebp, ebp
	start:
		xor edx, edx; cistimo zbog mogucih necistoca u registru
		mov ax, bp
		add ax, si
		div ebx; Ai= bi+S/2
		xor edx, edx; cistimo da ne bi mesali ostatak sa drugim brojevima
		mov deljenje, eax
		cmp ebp, 0
		je povecaj
		div ebp; Ai mod Bi = N
		cmp dl, N
		je kraj
		povecaj:
			inc bp
			jmp start
	kraj:
		xor ecx, ecx
ret
main endp
end main
