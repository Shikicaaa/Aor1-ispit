.386
.model flat,c
public fja
.code
fja proc
	push ebp
	mov ebp, esp
	push esi
	push edi
	push eax
	push ebx
	push ecx
	push edx
	pushfd
	xor cl, cl
	mov edx, [ebp+16]; prvi
	mov bx, [ebp+20]; poslednji
	mov esi, [ebp+12]
	petlja:
		cmp byte ptr [ebp+8], cl
		jle kraj
		mov edi, esi
		lodsb; u al se cuva niz[i]
		mov cl, byte ptr [edx]
		mov ch, byte ptr [ebx-1]
		cmp al, cl
		jl kraj
		cmp al, ch
		jg kraj
		mov al, byte ptr [[ebp+24]]
		stosb
		xor cx, cx
		dec byte ptr [ebp+8]
	kraj:
		
	popfd
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop edi
	pop esi
	pop ebp
	ret
fja endp
end