section .data
prompt db 'Enter the number : '
plen equ $-prompt
newline db 10,0
result db 'Factorial of n : '
rlen equ $-result

section .bss
n resb 5
tmp resb 5
fact resb 5

section .text
global _start
_start:

mov ecx,prompt
mov edx,plen
call write

mov ecx,n
mov edx,5
call read

mov ecx,result
mov edx,rlen
call write

call factorial

mov ecx,fact
mov edx,1
call write

mov ecx,newline
mov edx,1
call write

mov eax,1
mov ebx,0
int 80h

read:
mov eax,3
mov ebx,2
int 80h
ret

write:
mov eax,4
mov ebx,1
int 80h
ret

factorial:

mov [tmp],byte '1'
mov [fact],byte '1'
cmp [n],byte'0'
je exit

	loop:
	mov al,[fact]
	mov bl,[tmp]
	sub al,'0'
	sub bl,'0'
	mul bl
	add al,'0'
	
	mov [fact],al
	inc byte[tmp]
	mov al,[tmp]
	cmp al,[n]
	jle loop
	
	exit:
ret
