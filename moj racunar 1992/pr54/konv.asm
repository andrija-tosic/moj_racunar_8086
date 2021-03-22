.586
.model flat, c

public konv
.code
proc konv
	push ebp
	mov ebp, esp
	pushf
	push ecx
	push ebx
	push eax
	push edx

	mov ecx, [ebp+16]
	mov ebx, [ebp+12]
	xor eax, eax
	xor edx, edx
petlja:
	mov al, byte ptr [ebx]
	mov edi, 10
	mov esi, ecx
mnozenje:
	mul eax, edi
	dec esi
	cmp esi, 1
	jne mnozenje
	add edx, eax
loop petlja

	mov [ebp+8], edx
konv endp
end