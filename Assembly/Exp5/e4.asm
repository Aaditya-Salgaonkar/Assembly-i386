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

section .data
num1 db 'Enter the first number : '
num1len equ $-num1
num2 db 'Enter the second number : '
num2len equ $-num2

printnum db 'Entered number are : '
printnumlen equ $-printnum

section .bss
n1 : resb 5
n2 : resb 5

section .text
global _start
_start:

write_msg num1,num1len
read_msg n1,5


write_msg num2,num2len

read_msg n2,5

write_msg printnum,printnumlen
write_msg n1,5
write_msg n2,5

mov eax,1
mov ebx,0
int 80h
