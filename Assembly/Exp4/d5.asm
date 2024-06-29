section .data
num1 db 'Enter a number : '
num1len equ $-num1
even db 'The entered number is even'
evenlen equ $-even
odd db 'The entered number is odd'
oddlen equ $-odd
section .bss
n : resb 5

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

mov eax,[n]
sub eax,'0'

test eax,1
jz evens
mov eax,4
mov ebx,1
mov ecx,odd
mov edx,oddlen
int 80h
jmp quit
evens:
mov eax,4
mov ebx,1
mov ecx,even
mov edx,evenlen
int 80h

quit:
mov eax,1
mov ebx,0
int 80h

