public nadji
code segment
    assume cs:code
nadji proc far
    push bp
    mov bp, sp

    push bx 
    push cx ; kontekst procesora

    xor ax, ax
    mov bx, [bp+8] ; adresa prvog elementa niza

petlja:
    cmp dx, [bx]
    jne nisu_jednaki
    inc ax
nisu_jednaki:
    add bx, 2
loop petlja

    mov [bp+6], ax ; izlazni parametar u stek

    pop cx
    pop bx
    pop bp
    ret
    
nadji endp
code ends
end