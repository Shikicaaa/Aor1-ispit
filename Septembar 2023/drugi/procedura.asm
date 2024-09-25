.386
.model flat,c
public procedura
.data

.code
procedura proc
	push ebp
	mov ebp, esp
	push eax
	push ecx
	push edx
	push ebx
	push esi
	push edi
	pushfd
	mov ecx, [ebp+12];broj karaktera u tekstu
	mov esi, [ebp+8];adresa teksta
	mov edi, esi
	xor ebx, ebx
	xor edx, edx
	pocetak:
		lodsb
		cmp al, " "
		je space
		cmp al, 0
		je kraj_teksta
		cmp al, bl
		jl dalje
		mov bl, al; zapamti poslednje slovo abecede prisutno
		dalje:
		jmp pocetak
	space:
		inc edx; povecava broj reci u recenici
		cmp edx, 1
		je nista
			mov [edi-1], bl
		nista:
			xor bl, bl; cisti poslednje slovo abecede prisutno
		lodsb
		cmp al, " "
		je obrisi_visak
		mov edi, esi
		dec edi
		jmp pocetak
	obrisi_visak:
		lodsb
		cmp al, " "
		je obrisi_visak
		cmp al, 0
		je kraj_teksta
		mov edi, esi
		dec edi
		cmp al, bl
		jle nastavi
		mov bl, al
		nastavi:
		jmp pocetak
	kraj_teksta:
		mov [edi-1], bl
	popfd
	pop edi
	pop esi
	pop ebx
	pop edx
	pop ecx
	pop eax
	pop ebp
	ret 8
procedura endp
end