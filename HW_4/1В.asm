.model small
.stack 100h
.data 
array dw 12*12 DUP(0)

.code
main PROC 
    mov ax,@data
    mov ds, ax

    mov ch, 0     ; X  
    mov cl, 0     ; Y
     

myloop:
    ; Y - Y * X = Y * (1 - X)
    xor ah, ah
    mov al, cl     ; al = Y
    mov bl, ch     ; bl = X
    mov dl, al     ; DL = Y 
    mul bl         ; AX = Y * X
    sub dl, al     ; DL = Y - Y * X

    
    mov ax, 12      ; Завантаження розміру сторони масиву (12)
    mul ch          ; AX = X * 12
    add ax, cl      ; AX = X * 12 + Y

    ; Збереження результату 
    mov bx, ax      ; BX = індекс елемента масиву
    mov ax, dx      ; AX = результат (Y - Y * X)    
    mov [array + dx], ax  

    
    inc cl
    cmp cl, 12
    jl myloop

    
    inc ch
    cmp ch, 12
    jl myloop

    
    mov ax, 4C00h
    int 21h

main ENDP
END main

