.586
.model flat, c
public saberi
.code
saberi proc
	push ebp
	mov ebp, esp
	pushf
	push ecx
	push esi

	mov ecx, [ebp+12]
	shr ecx, 2

	mov esi, [ebp+8]

	xor eax, eax
petlja:
	add eax, [esi]
	add esi, 4
loop petlja
	pop esi
	pop ecx
	popf
	pop ebp
	ret
saberi endp
end