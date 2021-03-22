data segment
br1 db 20h
br2 db 10h
br3 dw 01h
br4 dw 02h
br5 db 15h

data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
   
    mov ax, 0
    mov dx, 0
    mov al, br1
    sub al, br2 ; br1-br2
    div word ptr br3 ; /br3 => AL rez, AH ostatak
    mov ah, 0
    mov bl, al
    mov ax, br4
    mul word ptr br5 ; rez u DX:AX   
    add al, bl
    ; rez u DX:AX konacni

    mov ah, 4ch
    int 21h
code ends
end main