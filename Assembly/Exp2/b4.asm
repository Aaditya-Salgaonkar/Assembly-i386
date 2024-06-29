section .data
sys.write equ 4
sys.exit equ 1
sys.out equ 0
name db 'Aaditya', 10
namelen equ $-name
surname db 'Salgaonkar', 10
surnamelen equ $-surname

section .text
global _start
_start:
	mov eax,sys.write
	mov ebx,sys.exit
	mov ecx,name
	mov edx,namelen
	int 80h
	
	mov eax,sys.write
	mov ebx,sys.exit
	mov ecx,surname
	mov edx,surnamelen
	int 80h

mov eax,sys.exit
mov ebx,sys.out
int 80h

























