.386
.model flat,c
.data
	dim dw 4
	mat dd		-1, 2, 3, -5,
				6,-12,13,-14,
				5,2,18,19,
				4,-29,10,0
.code
procedura proc
	push ebp
	mov ebp, esp
	push esi
	push eax
	push ebx
	push ecx
	push edx
	push edi
	pushfd

	mov ecx, [ebp+12]		;dimenzija
	mov esi, [ebp+8]		;adresa niza
	mov eax, 4
	mul ecx
	add eax, 4
	mov ebp, eax			;u ebp se cuva pomeraj na sledeci element dijagonale
	spolja:
		mov ebx, ecx		;privremeno cuva ecx da bi mogao da koristi cx za unutrasnju petlju
		dec ecx				;ide do n-1
		mov edi, esi		;edi predstavlja j u for petlji
		unutra:
			jcxz ovde		;u koliko dodje do kraja da ne bi brojao od ffff 
			mov eax, [edi]	;mat[i][i]
			mov edx, [edi+ebp];mat[i+1][i+1]
			cmp eax, edx	;mat[i][i] > mat[i+1][i+1] 
			jle ne_menja
			mov [edi + ebp], eax;zamena mesta u dijagonali
			mov [edi], edx
		ne_menja:
			add edi, ebp ;prelazimo na sledeci dijagonalni element matrice
			loop unutra
		ovde:
		mov ecx, ebx;vracamo staro ecx
		add esi, ebp;povecavamo "i"
		loop spolja

	popfd
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop esi
	pop ebp
	ret 8
procedura endp

main proc
	lea esi, mat
	movzx eax, dim
	push eax
	push esi
	call procedura
	nop
main endp
end main
