.386
.model flat,c
.data
	mat db "m","i","s"," ", " ", " ",
		   "a","v","i","o","n"," ",
		   "s","v","e","s","k","a",
		   " ", "c","r","n","a","c"
	m db 4
	n db 6
.code
procedura proc
	push ebp
	mov ebp, esp
	push eax
	push esi
	push ebx
	push edx
	push ecx
	pushfd
	mov esi, [ebp+8]; adresa matrice
	mov ecx, [ebp+12]; m
	mov ebx, [ebp+16]; n
	xor edx, edx; dl pamti se vrsta, dh pamti se najduza
	xor eax, eax; al sluzi za ucitavanje karaktera, ah sluzi za duzinu reci
	spoljna:
		mov ebp, ecx
		mov ecx, ebx
		unutrasnja:
			lodsb
			cmp al, " "
			je space
			inc ah
			loop unutrasnja
			jmp kraj
			space:
				dec ecx
				cmp ah, dh
				jng nastavi
					mov dh, ah
				nastavi:
				mov ah, 0;ne moze xor ah, ah jer ako je prvi bio " " onda ce da bude sve jedinice.
				mov al, [esi]
				cmp al, " "
				je obrisi_visak
				jcxz kraj
				inc esi
				jmp unutrasnja
			obrisi_visak:
				dec ecx
				lodsb
				cmp al, " "
				je obrisi_visak
				dec esi
			kraj:
				cmp ah, dh
				jng dalje
				mov dh, ah
				dalje:
					mov ah, 0; opet isto ne moze xor jer mozda bude 0
					mov ecx, ebp
					loop spoljna
		
		mov m, dh
		popfd
		pop ecx
		pop edx
		pop ebx
		pop esi
		pop eax
		pop ebp
		ret 12
procedura endp
main proc
	lea esi, mat
	movzx eax, m
	movzx ebx, n
	push ebx
	push eax
	push esi
	call procedura
	nop
main endp
end main