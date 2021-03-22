data segment
	b1 dd 12345678h
	b2 dd 34567812h
	pr dw 4 dup(?)
data ends


code segment
	assume cs:code, ds:data
main:	
	mov ax, data
	mov ds, ax
	
	;I
	mov ax, word ptr b1
	mul word ptr b2
	mov pr, ax
	mov pr+2, dx

	;II
	mov ax, word ptr b1
	mul word ptr b2+2
	add pr+2, ax
	adc dx, 0
	mov pr+4, dx
	
	;III
	mov ax, word ptr b1+2
	mul word ptr b2
	add pr+2, ax
	adc pr+4, dx
	mov ax, 0
	adc ax, 0
	mov pr+6, ax
	
	;IV 
	mov ax, word ptr b1+2
	mul word ptr b2+2
	add pr+4, ax
	adc pr+6, dx

	mov ah, 4ch
	int 21h
code ends
end main