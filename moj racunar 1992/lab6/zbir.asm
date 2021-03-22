.586
.model flat, c

public zbir
.code
zbir proc
	push ebp
	mov ebp, esp
	pushf

	xor eax,eax
	mov eax, [ebp+16]
	add eax, [ebp+12] ; ignorise se izlazni prenos
	add eax, [ebp+8] ; ignorise se izlazni prenos

	popf
	pop ebp
	ret
zbir endp
end