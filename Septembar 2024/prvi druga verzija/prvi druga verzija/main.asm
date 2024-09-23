.386
.model flat, c

.data
	k dw 5
	TEKST db 'mis uz pusku   mis niz  pusku0'
.code

procedura proc
	push ebp
	mov ebp, esp
	push esi
	push edi
	push ecx
	pushf
	mov esi, [ebp+12]; poslednji indeks
	mov ch, [ebp+8]; k
	mov edi, esi; pocetak niza
	xor eax, eax
	mov ah, 1
	pocetak:
		mov al, [esi]
		cmp al, '0' ; da li je kraj stringa
		je kraj_stringa
		cmp al, ' ' ; da li smo dosli do razmaka
		je space
		inc esi ; ukoliko nismo povecavamo indeks i nastavljamo da brojimo
		jmp pocetak
	space:
		cmp ah, ch ;proveravamo da li je to k-ta rec
		je nadjena_rec ;u koliko je to k-ta rec obradjujemo dalje
		inc ah ;ukoliko nije povecavamo broj reci koje smo nasli.
		inc esi
		mov al, [esi]
		cmp al, ' '; da li smo dosli do novog space-a ukoliko jesmo brisemo visak njih
		je remove_spaces
		mov edi, esi; ako je to bio jedan jedini space, prebacujemo indeks pocetka nove reci gde je sada esi, i nastavljamo dalje
		jmp pocetak
	remove_spaces:
		inc esi
		mov al, [esi]
		cmp al, ' ' ;proveravamo da li ima jos uvek space, ako ima idemo dalje iznova i iznova
		je remove_spaces
		cmp al, '0' ;mozda smo dosli do kraja stringa, ako jesmo idemo na kraj
		je kraj_stringa
		mov edi, esi ;ako nismo onda opet postavljamo edi na pocetak nove reci i idemo u krug
		jmp pocetak
	nadjena_rec:
		mov edx, edi ;rec je nadjena i pisemo njen pocetak u edx
		mov eax, esi ; a kraj u eax
		jmp kraj_proc
	kraj_stringa:
		inc ah
		cmp ah, ch ;da li je poslednja rec k-ta rec
		je nadjena_rec ;ako jeste onda je nadjena, ako nije vraca 0 u oba registra
		xor eax, eax
		xor edx, edx

	kraj_proc:
		popf
		pop ecx
		pop edi
		pop esi
		pop ebp
		ret 8
		
procedura endp
main proc
	mov ecx, 1
	lea esi, TEKST
	xor ebx, ebx
	start:
		cmp cx, k
		jge kraj
		push esi
		push ecx
		call procedura
		sub eax, edx; duzina reci
		cmp eax, ebx
		jl manji ;upisuje duzu rec u ebx
		mov ebx, eax
		manji:
			inc ecx
			jmp start
	kraj:
		ret

main endp
end main