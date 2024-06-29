section .data
name db 'Enter your name : '
namelen equ $-name
dis db 'Entered name : '
dislen equ $-dis
newline db 10, 0
section .bss
n : resb 50

section .text
global _start
_start:

	mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,namelen
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,n
	mov edx,50
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,dis
	mov edx,dislen
	int 80h

	mov eax,4
	mov ebx,1
	mov ecx,n
	mov edx,50
	int 80h

mov eax,1
mov ebx,0
int 80h
