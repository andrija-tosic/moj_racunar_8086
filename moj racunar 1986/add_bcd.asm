data segment
BCD1 db 6,4,8,9,8, 0 ; 0 na kraju za moguce prosirenje
N1 db 5+1
N2 db 3
data ends

extra segment
BCD2 db 4,5,6
extra ends

code segment
assume cs:code, ds:data, es:extra
main:
    mov ax, data
    mov ds, ax
    mov ax, extra
    mov es, ax

    xor ax,ax
    xor ch, ch
    mov cl, byte ptr N2 ; brojac
    xor si, si
    clc
    xor dh, dh
    mov dl, byte ptr N1 ; u DX da se cuva N1 da bi moglo CMP sa DI

petlja:
    mov al, BCD1[SI]
    mov bl, BCD2[SI]
    add al, bl
    aaa
    mov byte ptr BCD1[si], al
    jnc nema_prenos

    mov di, si
prenos:
    inc di
    cmp di, dx ; u DX je N1
    jae nema_prenos
    mov al, byte ptr [BCD1+di]
    adc al, 0
    aaa
    mov byte ptr [BCD1+di], al
    jc prenos

nema_prenos:
    inc si
loop petlja
    
    mov ah, 4ch
    int 21h
code ends
end main