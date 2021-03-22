data segment
br1 db 1h
br2 db 2h
br3 dw 02h
br4 dw 03h
br5 db 02h
data ends

code segment
    assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax
   
    mov bx, 0
    mov bl, br1
    add bx, br3 ; bx << br1+br3 , carry u cl ako ima
    adc cl, 0
    mov ax, 0
    mov al, br2
    add ax, br4 ; ax <= br2+br4, carry u cl ako ima
    adc cl, 0
    div byte ptr br5 ; AH ostatak, AL rez
    mov ah, 0
    mul bx ; rez u DX:AX



    mov ah, 4ch
    int 21h
code ends
end main