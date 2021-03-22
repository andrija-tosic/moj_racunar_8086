code segment
public bcdp
    assume cs:code
bcdp proc far
    push bp
    mov bp, sp

    mov cx, [bp+6] ; n-1
    mov si, [bp+8] ; &A

    add si, cx ; od kraj niza
    dec si

    xor ax,ax ; niza suma
    xor bx,bx ; visa suma

petlja:
    mov dx, 10
    mul dx ; u DX:AX proizvod sume
    add bx, dx ; u BX:AX suma
    jc of

    xor dh,dh
    mov dl, byte ptr [si]
    add ax, dx
    adc bx, 0
    jc of
   
    dec si
loop petlja
    
    mov [bp+6], ax ; nizi
    mov [bp+8], bx ; visi
jmp kraj
of:
    mov ax, -1
    mov [bp+6], ax ; nizi bajt
    mov [bp+8], bx ; visi bajt

kraj:
    pop bp
    ret

bcdp endp
code ends
end