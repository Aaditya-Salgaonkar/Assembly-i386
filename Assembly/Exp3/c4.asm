section .data
newline db 10,0
num db 'Enter three numbers : ',10
numlen equ $-num
sum db 'The sum is : '
sumlen equ $-sum

section .bss
n1 : resb 5
n2 : resb 5
n3 : resb 5
s :resb 5
sumq : resb 5
section .text
global _start
_start:

	mov eax,4
	mov ebx,1
	mov ecx,num
	mov edx,numlen
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,n1
	mov edx,5
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,n2
	mov edx,5
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,n3
	mov edx,5
	int 80h
	
	mov eax,4
	mov ebx,1
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
	mov eax,[s]
	sub eax,'0'
	mov ebx,[n3]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov[sumq],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,sumq
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
