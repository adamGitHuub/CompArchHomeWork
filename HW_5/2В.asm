.model small
.stack 100h
.data 
array dw 12*12 DUP(0)

.code
main PROC 
    mov ax,@data
    mov ds, ax

    mov cx, 0    
    mov dx, 0   
     

myloop:
   call sub_y_minus_y_mul_x
   call sub_save_element_to_array

    inc cl
    cmp cl, 12
    jl myloop

    
    inc ch
    cmp ch, 12
    jl myloop

    
    mov ax, 4C00h
    int 21h

main ENDP

sub_y_minus_y_mul_x PROC
     ; Y - Y * X = Y * (1 - X)
    xor ah, ah
    mov al, cl     ; al = Y
    mov bl, ch     ; bl = X
    mul bl         ; AX = Y * X
    mov dx, ax     ; DX = Y * X
    mov ax, bx     ; AX = Y
    sub ax, dx     ; DL = Y - Y * X
    ret
   
sub_y_minus_y_mul_x ENDP

sub_save_element_to_array PROC ; AX = element to save, BX = X, DX = Y

    mov bx, cx         ; BX = X
    mov ax, dx         ; AX = Y
    mul word ptr 12    ; AX = Y * 12
    add ax, bx         ; AX = Y * 12 + X
    mov bx, ax         ; BX = індекс 
    mov ax, dx         ; AX = value (Y - X * Y)
    mov [array + bx], ax
    ret 
sub_save_element_to_array ENDP     

    
END main

