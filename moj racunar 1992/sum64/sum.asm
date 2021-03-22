.586
.model flat, c
public sum
.code
sum proc
	push ebp
	mov ebp, esp

	mov ebx, [ebp+8]
	xor eax,eax
	xor edx, edx
pet:
	mov esi, eax ; prvi sabirak
	mov edi, [ebx] ; drugi sabirak
	add eax, [ebx] ; niza 32b sume
	test esi, esi
	jle no_of
	test edi, edi
	jle no_of
	test eax, eax ; test sume
	jge no_of
of: ; ako su esi, edi poz a eax neg
	xor eax, 80000000h ; promena bita za znak
	inc edx
no_of:
	

	add ebx, 4 ; sledeci element iz vrste
	mov ecx, [ebx] ; mora cmp reg, imd
	cmp ecx, -1
	jmp dalje
dalje:
jne pet

	pop ebp
	ret
sum endp
end