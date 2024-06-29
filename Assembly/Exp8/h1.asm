
section .data
    nl db "", 10
    nllen equ $-nl

    asksize db 'Enter the size of the array : '
    asksizelen equ $-asksize

    ask db 'Enter the elements : '
    asklen equ $-ask
space db ' '
slen equ $-space
    show db 'Array : '
    showlen equ $-show

    array times 100 db 0

; WRITE MACRO
%macro write 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

; READ MACRO
%macro read 2
    mov eax, 3
    mov ebx, 2
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

; NEWLINE MACRO
%macro endl 0
    mov eax, 4
    mov ebx, 1
    mov ecx, nl
    mov edx, nllen
    int 80h
%endmacro

; DECLARE VARIABLES
section .bss
    count resb 1
    n resb 1
    element resb 1


section .text
    global _start
_start:

    write asksize, asksizelen
    read n, 2

    mov byte[count], 0
    mov esi, array
    write ask, asklen
    endl
    input:
        read element, 2
        mov eax, [element]
        mov [esi], eax

        inc esi
        inc byte [count]
        
        mov al, [count]
        mov bl, [n]
        sub bl, '0'
        cmp al, bl
        jl input
    
    mov esi, array
    mov byte[count], 0
endl
    write show, showlen
         write space,slen
    output:
        write esi , 1
        write space,slen
        inc esi
        inc byte [count]

        mov al, [count]
        mov bl, [n]
        sub bl, '0'
        cmp al, bl
        jl output
	endl

    ; EXIT CALL
    mov eax, 1
    mov ebx, 0
    int 80h
