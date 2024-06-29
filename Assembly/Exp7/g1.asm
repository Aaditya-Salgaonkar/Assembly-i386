%macro write_msg 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

%macro read_msg 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    num1_msg db 'Enter the first number: ', 0
    n1len equ $-num1_msg
    num2_msg db 'Enter the second number: ', 0
    n2len equ $-num2_msg
    prompt db 'Enter the number of digits : ',0
    plen equ $-prompt
    result_msg db 'The sum is: ', 0
    rlen equ $-result_msg
    newline db 10, 0
section .bss
    n1 resb 5
    n2 resb 5
    n resb 5
    sum resb 6 

section .text
global _start

_start:
   call check
   call check
   call check
    
    
	
    mov eax, 1
    mov ebx,0
    int 80h

check:
write_msg num1_msg,n1len
    read_msg n1, 5

    write_msg num2_msg,n2len
    read_msg n2, 5
    
    write_msg prompt,plen
    read_msg n, 5
	

    mov al, [n] 
    cmp al, '3'
jl twodig
cmp al, '3'
    je threedig
    cmp al, '3'
    jg fourdig


threedig:
    mov esi, 2
    mov ecx, 3
    clc
    add_loop1:
        mov al, [n1 + esi]
        adc al, [n2 + esi]
        aaa
        pushf
        or al, 30h
        popf
        mov [sum + esi], al
        dec esi
        loop add_loop1
    jmp print_result
	
twodig:
mov esi,1
mov ecx,2
clc
add_loop:
    mov al, [n1 + esi]
    adc al, [n2 + esi]
    aaa
    pushf
    or al, 30h
    popf
    mov [sum + esi], al
    dec esi
    loop add_loop
jmp print_result

fourdig:
    mov esi, 3
    mov ecx, 4
    clc
    add_loop2:
        mov al, [n1 + esi]
        adc al, [n2 + esi]
        aaa
        pushf
        or al, 30h
        popf
        mov [sum + esi], al
        dec esi
        loop add_loop2

print_result:
    write_msg result_msg,rlen
    write_msg sum, 5
    write_msg newline, 1
    
    exit:
ret
