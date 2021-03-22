data segment
	p1 db 12h, 34h, 56h
	p2 db 01h
	p3 dw 0FFFFh
	;p3 dw 1234h
data ends
code segment
	assume ds:data, cs:code
main:
	mov ax, data
	mov ds, ax

	mov ax, word ptr p1
	mov dx, 0
	mov dl, byte ptr p1+2

	mov word ptr p1, 1234h
	mov byte ptr p1+2, 56h
	
	mov cl, byte ptr p2
	mov byte ptr p1, cl
	
	mov al, byte ptr p2
	mov ah, 0
	add ax, word ptr p3
	mov dl, 0
	adc dl, 0
	mov word ptr p1, ax
	mov byte ptr p1+2, dl

	mov ah, 4ch
	int 21h
code ends
end main