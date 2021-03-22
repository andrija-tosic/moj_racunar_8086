.586
.model flat, c

public nula
.code
nula proc
	push ebp
	mov ebp, esp
	push eax
	push ebx
	push ecx
	push edx
	push edi
	push esi
	pushf

	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	mov edi, [ebp+12] ; broj el
	
	cmp edi, 0; ne izvrsavati ako je n <= 0
	jle kraj
	
	
	shl edi, 1 ; broj el u bajtovima
	mov esi, [ebp+8]


	mov ax, word ptr [ebp+16] ; ovde je B za CMP

	mov bx, word ptr [ebp+20] ; ovde je C za CMP


provera_C:
	mov dx, word ptr [esi+ecx] ; u dx trenutni element

	cmp dx, bx ; trazimo C
	je C_postoji
	add ecx, 2
	cmp ecx, edi
	ja kraj ; ako ne nadjemo C
jmp provera_C

C_postoji:
	xor ecx, ecx
petlja:
	xor edx,edx
	mov dx, word ptr [esi+ecx] ; u dx trenutni element
	cmp dx, ax ; trazimo pojavljivanje B
	jne nije_nadjen_B

nadjen_B:
	add ecx, 2
	
	mov dx, word ptr [esi+ecx]
	cmp dx, bx ; ako naidjemo na C, kraj
	je kraj
	
	cmp ecx, edi ; da li smo stigli do kraja niza
	jae kraj

	mov word ptr [esi+ecx], 0 ; anuliramo element izmedju B i C
jmp nadjen_B

nije_nadjen_B:
	add ecx, 2 ; short je 2 bajta
	cmp ecx, edi
	jb petlja

kraj:
	popf
	pop esi
	pop edi
	pop edx
	pop ecx
	pop ebx
	pop eax
	pop ebp

	ret
nula endp
end