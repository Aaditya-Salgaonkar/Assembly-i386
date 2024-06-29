section .data
helloname db 'Hello World', 10
hellonamelen equ $-helloname

name db 'Aaditya',10
namelen equ $-helloname

section .text
global _start

_start:
	mov eax,4
	mov ebx,1
	mov ecx,helloname
	mov edx,hellonamelen
	int 80h
mov eax,4
	mov ebx,1
	mov ecx,name
	mov edx,namelen
	int 80h


mov eax,1
mov ebx,0
int 80h
