.386
.model flat, c

.data
	niz dw 1,2,3,4,5,6,7,8,9,0

.code
procedura proc
	push ebp
	mov ebp, esp
	push esi
	push eax
	push ebx
	push ecx
	pushfd
	mov esi, [ebp+12]; u si je adresa niza
	mov ax, [ebp+8]; u ax je indeks elementa niza
	mov bx, [esi+eax-2];levi
	mov cx, [esi+eax+2];desni
	add bx, cx
	mov [niz+eax], bx
	popfd
	pop ecx
	pop ebx
	pop eax
	pop esi
	pop ebp
	ret 8
procedura endp
main proc
	xor esi, esi
	lea esi, niz
	xor ebx, ebx
	xor eax, eax
	inc ebx
	petlja:
		
		mov dx, [esi+eax];mora da se koristi 32bit adrese zbog flat modela...
						 ;i onda u koliko ne xor-ujem 32bit adrese desava se greska sa memorijskom alokacijom
						 ;pa u proceduri mora da se koriste 32bit adrese radi pravilnog rada, 
		cmp dx, 0
		je kraj
		cmp bx, 3
		jne dalje
		push esi; ide adresa niza
		push eax; indeks elementa niza
		call procedura
		xor ebx, ebx
		dalje:
			inc ebx
			add ax, 2
		jmp petlja
	kraj:
		ret

main endp
end main