.586
.model flat, c

public konv
.code
konv proc
	push ebp
	mov ebp, esp
	pushf
	push ecx
	push ebx
	push edx
	push edi
	push esi

	mov ecx, [ebp+16]
	mov esi, [ebp+12]
	xor ebx, ebx
petlja:
	xor eax, eax
	mov al, byte ptr [esi]
	sub al, '0'

	cmp al, 0
	jb greska
	cmp al, 9
	ja greska

	mov edi, ecx
	dec edi
mnozenje:
	cmp eax, 0
	je nula
	cmp edi, 0
	je ne_mnozi
	mov edx, 10
	mul dx
	dec edi
jmp mnozenje

ne_mnozi:
	add ebx, eax
nula:
	inc esi
loop petlja

	mov esi, [ebp+8]
	mov [esi], ebx

	mov eax, 0
	jmp stek

greska:
	mov eax, 1

stek:
	pop esi
	pop edi
	pop edx
	pop ebx
	pop ecx
	popf
	pop ebp
	ret
konv endp
end