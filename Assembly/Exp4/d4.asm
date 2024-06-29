section .data
num1 db 'Enter a number : '
num1len equ $-num1

r1 db 'The entered number '
r1len equ $-r1
r3 db 'is greater than 5'
r3len equ $-r3
r22 db 'is lesser than 5'
r22len equ $-r22
cmp5 db '5'
newline db 10,0

section .bss
n1 : resb 5
ans : resb 5
a1 : resb 5

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
mov ecx,r1
mov edx,r1len
int 80h

mov al,[n1]
mov bl,[cmp5]
sub al ,'0'
sub bl ,'0'
cmp al,bl
jg findlarger
jl findlesser

findlesser : 
mov eax,4
mov ebx,1
mov ecx,r22
mov edx,r22len
int 80h
mov eax,4
mov ebx,1
mov ecx,newline
mov edx,1
int 80h
jmp leave

findlarger:
mov eax,4
mov ebx,1
mov ecx,r3
mov edx,r3len
int 80h

mov eax,4
mov ebx,1
mov ecx,newline
mov edx,1
int 80h

leave:
mov eax,1
mov ebx,0
int 80h


