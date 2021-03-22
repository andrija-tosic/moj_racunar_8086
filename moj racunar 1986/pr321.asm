data segment
br1 db 5
br2 db 10
br3 dw 2
br4 dw 20
br5 db 10
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
    mov ax, 0
    mov dx, 0
    mov al, byte ptr br1
    add al, byte ptr br2
    adc ah, 0
    mul word ptr br3 ; rez u DX:AX
    mov bx, dx
    mov cx, ax ; rez prvog u BX:CX
    mov ax, word ptr br4
    div byte ptr br5 ; rez drugog u AH:AL
    sub cl, al ;
    sbb ch, 0 ; konacni rez u DX:CX

    mov ah, 4ch
    int 21h
code ends
end main