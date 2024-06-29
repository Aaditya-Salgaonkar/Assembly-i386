section .data
odd db 'Multiples of 3 : ', 10
oddlen equ $-odd
n db '3'
newline db 10, 0
section .text
global _start:
_start:

	mov eax,4
	mov ebx,1
	mov ecx,odd
	mov edx,oddlen
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,n
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	mov eax,[n]
	inc eax
	inc eax
	inc eax
	mov[n],eax
	mov eax,4
	mov ebx,1
	mov ecx,n
	mov edx,1
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	mov eax,[n]
	inc eax
	inc eax
	inc eax
	mov[n],eax
	mov eax,4
	mov ebx,1
	mov ecx,n
	mov edx,1
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	
mov eax,1
mov ebx,0
int 80h
