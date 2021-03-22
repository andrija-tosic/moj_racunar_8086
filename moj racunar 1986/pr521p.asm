public zbir
code segment
    assume cs:code
zbir proc far
    push bp
    mov bp, sp
    push bx
    push cx
    push ax
    push si
    mov bx, [bp+10] ; adresa niza
    mov cx, [bp+8] ; n
    xor ax,ax
    xor si,si
petlja:
    add al, [bx][si]
    adc ah, 0
    inc si 
loop petlja
    mov di, [bp+6]
    mov [di], ax
    pop si
    pop ax
    pop cx
    pop bx
    pop bp
    ret 6
zbir endp
code ends
end