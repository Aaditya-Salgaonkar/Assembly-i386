section .data
num1 db 'Enter the first number : '
num1len equ $-num1
num2 db 'Enter the second number : '
num2len equ $-num2
result db 'Largest number out of the two is '
rlen equ $-result
section .bss
n1 : resb 5
n2 : resb 5

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
mov ecx,result
mov edx,rlen
int 80h

mov al,[n1]
mov bl,[n2]
cmp al,bl
jg findlarger
mov eax,4
mov ebx,1
mov ecx,n2
mov edx,5
int 80h
jmp leave
findlarger:
mov eax,4
mov ebx,1
mov ecx,n1
mov edx,5
int 80h
leave :

mov eax,1
mov ebx,0
int 80h


