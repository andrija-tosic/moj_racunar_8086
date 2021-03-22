data segment
	podatak1 dw 0001h
	rezultat dw 0h
data ends

code segment
assume ds:data
start:
	mov ax, podatak1
	add ax, cx
	mov rezultat, ax

code ends
end start