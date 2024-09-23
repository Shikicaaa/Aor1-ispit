	.386
	.model flat, c

	.data
		k dd 5
		tekst db 'mis uz   pusku   mis niz pusku0'  ; Visestruki razmaci
	.code

	procedura proc
	start:
		push ebp
		mov ebp, esp
		mov esi, [ebp+12]
		push edi
		push esi
		push ecx
		push ebx
		pushf  ; Ucitaj adresu teksta u ESI
		mov edi, esi        ; EDI ce pokazivati na pocetak trenutne reci
		xor ebx, ebx        ; EBX ce brojati reci
		xor ecx, ecx        ; ECX ce brojati duzinu trenutne reci
		xor edx, edx        ; EDX ce cuvati adresu najduze reci
		xor ebp, ebp        ; EBP ce cuvati duzinu najduze reci

	pocetak:
		mov al, [esi]       ; Ucitaj trenutni karakter
		cmp al, '0'         ; Ako je '0', kraj stringa
		je kraj_stringa
		cmp al, ' '         ; Ako je razmak, obradi rec
		je proveri_space
		inc esi             ; Ako nije razmak, nastavi dalje
		inc ecx             ; Povecaj duzinu trenutne reci
		jmp pocetak

	proveri_space:
		; Preskoci sve uzastopne razmake
		skip_spaces:
			inc esi
			mov al, [esi]
			cmp al, ' '     ; Proveri da li je ponovo razmak
			je skip_spaces  ; Ako jeste, preskoci ga
			mov al, [esi]   ; Ucitaj sledeci karakter da prodjemo dalje

		; Obradi rec nakon sto su svi razmaci preskoceni
		inc ebx            ; Povecaj broj reci
		cmp ecx, ebp       ; Da li je trenutna rec duza od najduhe dosad?
		jle nastavi        ; Ako nije, nastavi dalje

		; Ako jeste, sacuvaj njenu duzinu i adresu
		mov ebp, ecx       ; Sacuvaj duzinu najduze reci
		mov edx, edi       ; Sacuvaj adresu pocetka najduze reci

	nastavi:
		xor ecx, ecx       ; Resetuj brojac za novu rec
		mov edi, esi       ; Pocetak nove reci je nova pozicija
		jmp pocetak

	kraj_stringa:
		; Provera poslednje reci u stringu
		cmp ecx, ebp       ; Da li je poslednja rec duza od najduze?
		jle kraj_provera

		; Ako je poslednja rec najduza
		mov ebp, ecx       ; Sacuvaj duzinu reci
		mov edx, edi       ; Sacuvaj adresu reci

	kraj_provera:
		mov eax, ebp       ; Duhina najduze reci u EAX
		mov edx, edi       ; Adresa najduze reci u EDX
	
		; Proveri da li je broj reci manji od k
		mov ecx, [ebp+8]   ; Ucitaj vrednost k
		cmp ebx, ecx       ; Da li je broj reci manji od k?
		jge kraj           ; Ako nije, idi na kraj

		; Ako nema dovoljno reci, vrati 0 u EAX i EDX
		xor eax, eax
		xor edx, edx
	
	kraj:
		popf
		pop ebx
		pop ecx
		pop esi
		pop edi
		pop ebp
		ret
	procedura endp

	main proc
		lea esi, tekst
		push esi
		push k
		call procedura
	main endp
	end main
