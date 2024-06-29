
section .data
	nl db "", 10
	nllen equ $-nl

	ask db 'Enter the number of terms : '
	asklen equ $-ask

	show db 'Fibonacci series : '
	showlen equ $-show
	newline db 10,0
	space db ', '
	spacelen equ $-space

%macro write 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro read 2
	mov eax, 3
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%macro endl 0
	mov eax, 4
	mov ebx, 1
	mov ecx, nl
	mov edx, nllen
	int 80h
%endmacro

%macro fibo 3
	mov al, [%1]
	mov bl, [%2]
	sub al, '0'
	sub bl, '0'
	add al, bl
	add al, '0'
	mov [%3], al
	int 80h
%endmacro

section .bss
	i resb 1
	n resb 1
	a resb 1
	b resb 1
	c resb 1


section .text
	global _start
_start:

	write ask, asklen
	read n, 2
	write show, showlen

	mov [i], byte '0'
	mov [a], byte '0'
mov [b], byte '1'

	mov al, [i]
	mov bl, [n]
	cmp al, bl
	je exit
	
write a, 1
	write space, spacelen
	inc byte [i]

mov al, [i]
mov bl, [n]
	cmp al, bl
	je exit

		write b, 1
		write space, spacelen
		inc byte [i]
	mov al, [i]
	mov bl, [n]
	cmp al, bl
	je exit
	jmp loop

	loop:
		fibo a, b, c
		write c, 1
		write space, spacelen
	mov bl, [b]
	mov [a], bl
		mov bl, [c]
		mov [b], bl
	 	inc byte [i]
	  		mov al, [i]
			mov bl, [n]
			cmp al, bl
		je exit
		jmp loop
	
exit:
write newline,1
	mov eax, 1
	mov ebx, 0
	int 80h
