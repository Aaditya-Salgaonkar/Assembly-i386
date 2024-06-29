

section .data
newline db 10,0
num1 db 'Enter the first number : '
num1len equ $-num1
num2 db 'Enter the second number : '
num2len equ $-num2
sum db 'The sum is : '
sumlen equ $-sum
dif db 'The difference is : '
diflen equ $-dif
mult db 'The product is : '
multlen equ $-mult
divs db 'The quotient and the remainder are : '
divslen equ $-divs
space db ' & '
spacelen equ $-space

section .bss
n1 : resb 5
n2 : resb 5
s : resb 5
d : resb 5
m : resb 5
d1 : resb 5
r : resb 5
section .text
global _start
_start:
	mov ecx,num1
	mov edx,num1len
	call write_msg
	
	mov ecx,n1
	mov edx,5
	call read_msg
	
	mov ecx,num2
	mov edx,num2len
	call write_msg
	
	mov ecx,n2
	mov edx,5
	call read_msg
	
	
	mov ecx,sum
	mov edx,sumlen
	call write_msg
	
	
	call addition
	
	mov ecx,s
	mov edx,5
	call write_msg
	
	mov ecx,newline
	mov edx,1
	call write_msg
	         
	
	mov ecx,dif
	mov edx,diflen
	call write_msg

	
	call subtraction
	
	mov ecx,d
	mov edx,5
	call write_msg
	
	mov ecx,newline
	mov edx,1
	call write_msg
	
	mov ecx,mult
	mov edx,multlen
	call write_msg
	
	call multiplication
	
	mov ecx,m
	mov edx,5
	call write_msg
	
	mov ecx,newline
	mov edx,1
	call write_msg

		mov ecx,divs
	mov edx,divslen
	call write_msg
	call division
	
	mov ecx,d1
	mov edx,5
	call write_msg
	
	mov ecx,space
	mov edx,spacelen
	call write_msg
	
	mov ecx,r
	mov edx,5
	call write_msg
	
	mov ecx,newline
	mov edx,1
	call write_msg
	

	
mov eax,1
mov ebx,0
int 80h

write_msg:
mov eax,4
mov ebx,1
int 80h
ret

read_msg:
mov eax,3
mov ebx,2
int 80h
ret


addition:
	mov eax,[n1]
	sub eax,'0'
	mov ebx,[n2]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov[s],eax
ret

subtraction:
	mov eax,[n1]
	sub eax,'0'
	mov ebx,[n2]
	sub ebx,'0'
	sub eax,ebx
	add eax,'0'
	mov[d],eax
ret

multiplication:
	mov al,[n1]
	sub al,'0'
	mov bl,[n2]
	sub bl,'0'
	mul bl
	add al,'0'
	mov[m],al
ret

division:
	mov al,[n1]
	sub al,'0'
	mov bl,[n2]
	sub bl,'0'
	div bl
	add al,'0'
	mov[d1],al
	add ah,'0'
	mov[r],ah
ret

