.586
.model flat, c

public to_lower
.code
to_lower proc
	push ebp
	mov ebp, esp
	pushf
	push esi
	push edi
	push eax

	cld
	
	mov esi, [ebp+12]
	mov edi, [ebp+8]

petlja:
	lodsb
	cmp al, 'A'
	jb nije_veliko
	cmp al, 'Z'
	ja nije_veliko

	add al, 'a' - 'A'

nije_veliko:
	stosb
	cmp al, 0
	jne petlja

	pop eax
	pop edi
	pop esi
	popf
	pop ebp
	ret
to_lower endp
end