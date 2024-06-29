section .data
num1 db 'Enter the first number : '
num1len equ $-num1
num2 db 'Enter the second number : '
num2len equ $-num2
num3 db 'Enter the third number : '
num3len equ $-num3
result db 'Largest number out of the three is '
rlen equ $-result
section .bss
n1 : resb 5
n2 : resb 5
n3 : resb 5
ans : resb 5
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
mov ecx,n1
mov edx,5
int 80h

mov eax,4
mov ebx,1
mov ecx,num2
mov edx,num2len
int 80h

mov eax,3
mov ebx,2
mov ecx,n2
mov edx,5
int 80h

mov eax,4
mov ebx,1
mov ecx,num3
mov edx,num3len
int 80h

mov eax,3
mov ebx,2
mov ecx,n3
mov edx,5
int 80h

mov eax,4
mov ebx,1
mov ecx,result
mov edx,rlen
int 80h

mov ecx,[n1]
cmp ecx,[n2]
jg findlarger
mov ecx,[n2]


findlarger:
cmp ecx,[n3]
jg leave
mov ecx,[n3]

leave :
mov [ans],ecx
mov eax,4
mov ebx,1
mov ecx,ans
mov edx,5
int 80h


mov eax,1
mov ebx,0
int 80h


