; Napisati program na asm jeziku za sabiranje 2 4-cifrena nepakovana BCD broja (7583 i 1492). Rezultat se smesta na lokaciju prvog sabirka.

data segment
	b1 db 3, 8, 5, 7
	b2 db 2, 9, 4, 1
data ends

code segment
	assume cs:code, ds:data
main:	mov ax, data
	mov ds, ax
	
	mov al, b1
	add al, b2
	aaa
	mov b1, al
	
	mov al, b1+1
	adc al, b2+1
	aaa
	mov b1+1, al

	mov al, b1+2
	adc al, b2+2
	aaa
	mov b1+2, al
	
	mov al, b1+3
	adc al, b2+3
	aaa
	mov b1+3, al

	mov ah, 4ch
	int 21h	

code ends
end main