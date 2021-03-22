.586
.model flat, c
public suma
.code
suma proc
	push ebp
	mov ebp, esp
	push ecx
	push ebx
	pushf

	mov ebx, [ebp+8]
	mov ecx, [ebp+12]
	xor eax, eax

petlja:
	add eax, [ebx]
	add ebx, 4
loop petlja

	popf
	pop ebx
	pop ecx
	pop ebp
	ret
suma endp
end