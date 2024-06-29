section .data
num1 db 'Enter a number : '
num1len equ $-num1
a db 'Entered number : '
alen equ $-a
b db 'After performing increment operation next 4 numbers are : ',10
blen equ $-b
section .bss
n1 : resb 5
i1 : resb 5
i2 : resb 5
i3 : resb 5
i4 : resb 5
section .text
global _start:
_start:
	mov eax,4
	mov ebx,1
	mov ecx,num1
	mov edx,num1len
	int 80h
	mov eax,3
	mov ebx,2
	mov ecx,n1
	mov edx,5
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,a
	mov edx,alen
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,n1
	mov edx,5
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,b
	mov edx,blen
	int 80h
	mov eax,[n1]
	inc eax
	mov[n1],eax
	mov eax,4
	mov ebx,1
	mov ecx,n1
	mov edx,5
	int 80h
	mov eax,[n1]
	inc eax
	mov[n1],eax
	mov eax,4
	mov ebx,1
	mov ecx,n1
	mov edx,5
	int 80h
	mov eax,[n1]
	inc eax
	mov[n1],eax
	mov eax,4
	mov ebx,1
	mov ecx,n1
	mov edx,5
	int 80h
	mov eax,[n1]
	inc eax
	mov[n1],eax
	mov eax,4
	mov ebx,1
	mov ecx,n1
	mov edx,5
	int 80h
mov eax,1
mov ebx,0
int 80h
