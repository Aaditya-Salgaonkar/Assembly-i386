%macro write_msg 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro read_msg 2
mov eax,3
mov ebx,2
mov ecx,%1
mov edx,%2
int 80h
%endmacro

%macro addition 3
	mov eax,[n1]
	sub eax,'0'
	mov ebx,[n2]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov[s],eax
%endmacro

%macro subtraction 3
	mov eax,[n1]
	sub eax,'0'
	mov ebx,[n2]
	sub ebx,'0'
	sub eax,ebx
	add eax,'0'
	mov[d],eax
%endmacro

%macro multiplication 3
	mov al,[n1]
	sub al,'0'
	mov bl,[n2]
	sub bl,'0'
	mul bl
	add al,'0'
	mov[m],al
%endmacro

%macro division 4
	mov al,[n1]
	sub al,'0'
	mov bl,[n2]
	sub bl,'0'
	div bl
	add al,'0'
	mov[d1],al
	add ah,'0'
	mov[r],ah
%endmacro

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
	write_msg num1,num1len
	read_msg n1,5

	write_msg num2,num2len
	read_msg n2,5
	
	write_msg sum,sumlen
	
	
	addition n1,n2,s
	
	write_msg s,5
	
	write_msg newline,1
	         
	

		
	
	write_msg dif,diflen
	
	subtraction n1,n2,d
	
	write_msg d,5
	
	write_msg newline,1
	
	
		
	write_msg mult,multlen
	
	multiplication n1,n2,m
	
	
	write_msg m,5
	
	write_msg newline,1

		
	write_msg divs,divslen
	division n1,n2,d1,r
	
	
	write_msg d1,5
	
	write_msg space,spacelen
	write_msg r,5
	
	write_msg newline,1
	

	
mov eax,1
mov ebx,0
int 80h
