data segment
	suma dw ?
data ends
code segment
	assume ds:data, cs:code
main:
	mov ax, data
	mov ds, ax
	mov bx, ax
	add ax, cx
	add ax, dx
	mov suma, ax

	mov ah, 4ch
	int 21h
code ends
end main