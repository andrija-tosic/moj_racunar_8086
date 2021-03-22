public razlika
code segment
    assume cs:code
razlika proc far
    push bp
    mov bp, sp

    mov ax, [bp+8]
    sub ax, [bp+6]

    pop bp
    ret 4
razlika endp
code ends
end
