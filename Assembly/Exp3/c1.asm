section .data
sys.write equ 4
sys.read equ 3
sys.close equ 1
sys.exit equ 0
sys.end equ 2

newline db 10,0
num1 db 'Enter the first number : '
num1len equ $-num1
num2 db 'Enter the second number : '
num2len equ $-num2
sum db 'The sum is : '
sumlen equ $-sum

section .bss
n1 : resb 5
n2 : resb 5
s :resb 5

section .text
global _start
_start:

	mov eax,sys.write
	mov ebx,sys.close
	mov ecx,num1
	mov edx,num1len
	int 80h
	
	mov eax,sys.read
	mov ebx,sys.end
	mov ecx,n1
	mov edx,5
	int 80h
	
	mov eax,sys.write
	mov ebx,sys.close
	mov ecx,num2
	mov edx,num2len
	int 80h
	
	mov eax,sys.read
	mov ebx,sys.end
	mov ecx,n2
	mov edx,5
	int 80h
	
	mov eax,sys.write
	mov ebx,sys.close
	mov ecx,sum
	mov edx,sumlen
	int 80h
	
	mov eax,[n1]
	sub eax,'0'
	mov ebx,[n2]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov[s],eax
	
	mov eax,sys.write
	mov ebx,sys.close
	mov ecx,s
	mov edx,5
	int 80h
	
	mov eax,sys.write
	mov ebx,sys.close
	mov ecx,newline
	mov edx,1
	int 80h
	
mov eax,sys.close
mov ebx,sys.exit
int 80h
