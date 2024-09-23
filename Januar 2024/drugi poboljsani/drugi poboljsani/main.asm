.386
.model flat, c

.data
    niz dw 1,2,3,4,5,6,7,8,9,0

.code
procedura proc
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ebx
    push ecx
    pushfd

    ; Postavljanje ESI na bazu niza i premestanje indeksa u eax
    mov esi, [ebp+8]

    ; Desni element (LODS koristi ESI)
    mov edi, esi
    sub edi, 2
    mov ax, [esi]
    mov bx, ax

    ; levi element
    mov ax, [esi-4]
    add bx, ax
    mov ax, bx

    ; Upis rezultata u niz
    stos word ptr [edi]

    popfd
    pop ecx
    pop ebx
    pop eax
    pop edi
    pop esi
    pop ebp
    ret 4
procedura endp

main proc
    xor esi, esi
    lea esi, niz
    xor ebx, ebx
    xor eax, eax
    inc ebx

petlja:
    lods word ptr [esi]
    cmp ax, 0
    je kraj
    cmp bx, 3
    jne dalje

    push esi
    call procedura

    xor ebx, ebx

dalje:
    inc ebx
    jmp petlja

kraj:
    ret

main endp
end main
