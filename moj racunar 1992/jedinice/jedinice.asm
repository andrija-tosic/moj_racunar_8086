.586
.model flat, c

public jedinice
.code
jedinice proc
	push ebp
	mov ebp, esp
	mov ebx, [ebp+8] ; niz

	mov ecx, [ebp+16]
	
	mov eax,1
	shift:
		shl eax, 1
	loop shift
	dec eax ; u eax je 2^n-1
	
	xor esi, esi

	mov ecx, [ebp+12] ; br_el
	mov edi, 0
	petlja:
		mov dx, word ptr [ebx][edi]
		and edx, eax
		cmp edx, eax
		jne nisu
		inc esi
	nisu:
	add edi, 2
	loop petlja
	mov eax, esi

	pop ebp
	ret
jedinice endp
end