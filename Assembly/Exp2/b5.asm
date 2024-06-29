section .data
n1 db 'Mr . Aaditya         '
n1len equ $-n1
newline db 10, 0
original db 'Original string   '
originallen equ $-original
replaced db '   Replaced string'
replacedlen equ $-replaced
section .text
global _start
_start:
	mov eax,4
	mov ebx,1
	mov ecx,original
	mov edx,originallen
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,replaced
	mov edx,replacedlen
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,n1
	mov edx,n1len
	int 80h
	mov eax,4
	mov ebx,1
	mov[n1], dword"Sir"
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
mov eax,1
mov ebx,0
int 80h


