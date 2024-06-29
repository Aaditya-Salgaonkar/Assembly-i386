section .data
num1 db 'Enter a number : '
num1len equ $-num1
msg1 db 'The entered number is a multiple of 3'
msg1len equ $-msg1
msg2 db 'The entered number is not a multiple of 3'
msg2len equ $-msg2
base db '3'
section .bss
n : resb 5
r:resb 5
section .text
global _start
_start:

mov eax,4
mov ebx,1
mov ecx,num1
mov edx,num1len
int 80h

mov eax,3
mov ebx,2
mov ecx,n
mov edx,5
int 80h
	
	mov al,[n]
	sub al,'0'
	mov bl,[base]
	sub bl,'0'
	div bl
	cmp ah,0
	jz print
	mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,msg2len
int 80h
jmp quit
	
print:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,msg1len
int 80h

quit:
mov eax,1
mov ebx,0
int 80h
