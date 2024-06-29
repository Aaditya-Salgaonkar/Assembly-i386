section .data
a db 'Enter the radius of the circle : '
alen equ $-a
newline db 10, 0
area1 db 'Area of the circle : '
area1len equ $-area1
pi db '3.14'

section .bss
r  resb 5
area : resb 5
tmp1: resb 5
section .text
global _start:
_start:

	mov eax,4
	mov ebx,1
	mov ecx,a
	mov edx,alen
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,r
	mov edx,5
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,area1
	mov edx,area1len
	int 80h
	mov al,[r]
	sub al,'0'
	mov bl,[r]
	sub bl,'0'
	mul bl
	add al,'0'
	mov[tmp1],al
	
	mov al,[tmp1]
	sub al,'0'
	mov bl,[pi]
	sub bl,'0'
	mul bl
	add al,'0'
	mov[area],al
	
	mov eax,4
	mov ebx,1
	mov ecx,area
	mov edx,5
	int 80h
	
	


	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	
mov eax,1
mov ebx,0
int 80h
