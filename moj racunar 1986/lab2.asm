data segment
    br1 db 0FFh ; drugi primer moze FF
    br2 db 0EDh ; drugi primer moze ED
    proizvod dw ?
    kolicnik db ?
    rez dw ?
data ends
code segment
assume cs:code, ds:data
main:
    mov ax, data
    mov ds, ax

    mov ah, 0
    mov al, br1
    mul byte ptr br2
    mov proizvod, ax
    mov ah, 0
    mov al, br1
    div br2
    mov kolicnik, al


    mov ah, 0 ; cistimo ako je bilo ostatka pri br1/br2
    mov al, br1
    add al, br2
    adc ah, 0

    mov cx, ax ; br1+br2 max 9b copy u cx koji je 16b

    mov dx,0

    mul CX ; (br1+br2)^2 9b * 9b max 18b rezultat u DX 2b:AX 16b

    mov bl, dl ; visi deo kvadrata u bl 2b max

    mov dx, 0
    mul cx ; mnozi se nizi deo sa cx rezultat je 16+9 = 25b, DX 9b, AX 16b
    mov di, ax 
    mov si, dx ; u si:di je nizi deo, SI 9b DI 16b tj AXCX
    
    mov dx, 0
    mov ah, 0

    mov al, bl ; visi deo 2b sad mnozimo sa cx 7b = max 9b
    mul cx ; u DX:AX je visi deo, prazan DX jer je cx 7b, a al 2b+7b = 9b sve u AX

    mov bx, ax

    mov CX, SI
    mov ch, 0

    ; rez je u BX:CL:DI, 9b + 9b + 16b = 34b, ovde je nelogicnost


    mov ax,0
    mov al, br1
    sub al, br2

    mov ch, al

    mul ch ; (br1-br2)^2 u AX

    mov ch, 0

    ; sad deliti BX:CL:DI sa AX (deljenje 27b sa 16b)



    
    mov ah, 4ch
    int 21h
code ends
end main