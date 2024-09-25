.386
.model flat,c
.data
	n dd 5
	m dd 4
	mat dw 1,2,3,4,5,
			5,6,7,8,6,
			9,10,11,12,7,
			8,9,10,11,12
.code
procedura proc
	push ebp
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx
	push esi
	pushfd
	mov esi, [ebp+16];adresa matrice
	mov ebx, [ebp+12];kolona trenutna
	mov eax, [ebp+8];offset
	mov ecx, m
	xor edi, edi
	petlja1:
		add di, word ptr [esi+ebx]
		add ebx, eax
		loop petlja1
	xor edx, edx
	mov eax, edi
	div n
	mov edi, eax
	popfd
	pop esi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp
	ret 12
procedura endp
main proc
	lea esi, mat
	mov ecx, n;koja kolona po redu se obradjuje
	mov eax, ecx;broj elemenata po koloni/broj vrsta
	xor edx, edx
	shl eax, 1; u EAX je offset za elemente
	xor edx, edx
	cmp m, 3
	jl kraj
	petlja:
		push esi;adresa matrice
		mov ebx, ecx
		dec ebx
		shl ebx, 1
		push ebx;kolona koju obradjujemo sad
		push eax;offset
		call procedura
		mov edx, eax
		add edx, eax;3. vrsta
		add ebx, edx
		cmp [esi+ebx], edi
		jl nastavi
		mov [esi+ebx], di
		nastavi:
		loop petlja
	kraj:
		ret
main endp
end main