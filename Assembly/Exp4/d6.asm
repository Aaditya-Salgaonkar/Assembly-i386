section .data
    str1 db 'Enter the first string: '
    str1len equ $-str1
    
    str2 db 'Enter the second string: '
    str2len equ $-str2
    
    equal db 'The strings are equal', 0
    equallen equ $-equal
    
    notequal db 'The strings are not equal', 0
    notequallen equ $-notequal

section .bss
    s1 resb 20
    s2 resb 20

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, str1
    mov edx, str1len
    int 80h
    
    mov eax, 3
    mov ebx, 0
    mov ecx, s1
    mov edx, 20
    int 80h
    
    mov eax, 4
    mov ebx, 1
    mov ecx, str2
    mov edx, str2len
    int 80h
    
    mov eax, 3
    mov ebx, 0
    mov ecx, s2
    mov edx, 20
    int 80h
	mov esi,s1
	mov edi,s2
compare_strings:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne strings_not_equal
    cmp al, 0
    je strings_equal
    inc esi
    inc edi
    jmp compare_strings

strings_equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, equal
    mov edx, equallen
    int 80h
    
    jmp quit

strings_not_equal:
    mov eax, 4
    mov ebx, 1
    mov ecx, notequal
    mov edx, notequallen
    int 80h
    
    quit:
    mov eax, 1
    mov ebx, 0
    int 80h

