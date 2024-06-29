section .data
print db 'Enter a number : '
printlen equ $-print
newline db 10, 0
dis db 'Entered number : '
dislen equ $-dis
section .bss
num : resb 10

section .text
global _start

_start:
	mov eax,4
	mov ebx,1
	mov ecx,print
	mov edx,printlen
	int 80h
	mov eax,3
	mov ebx,1
	mov ecx,num
	mov edx,10
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
	mov ecx,num
	mov edx,10
	int 80h

mov eax,1
mov ebx,0
int 80h
