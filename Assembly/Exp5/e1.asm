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
num1 db 'Enter a number : '
num1len equ $-num1

printnum db 'Entered number is : '
printnumlen equ $-printnum

section .bss
n : resb 5

section .text
global _start
_start:

write_msg num1,num1len

read_msg n,5

write_msg printnum,printnumlen
write_msg n,5

mov eax,1
mov ebx,0
int 80h
