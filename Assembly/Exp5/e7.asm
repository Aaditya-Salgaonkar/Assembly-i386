%macro write_msg 2
mov eax,4
mov ebx,1
push ecx
mov ecx,%1
mov edx,%2
int 80h
pop ecx
%endmacro

%macro read_msg 2
mov eax,3
mov ebx,2
push ecx
mov ecx,%1
mov edx,%2
int 80h
pop ecx
%endmacro

section .data
num1 db 'Enter your name : '
num1len equ $-num1
newline db 10,0
printnum db 'Name : '
printnumlen equ $-printnum

section .bss
n : resb 20

section .text
global _start
_start:

write_msg num1,num1len

read_msg n,20

write_msg printnum,printnumlen
write_msg newline,1
mov ecx,9
timename:
write_msg n,20
loop timename

mov eax,1
mov ebx,0
int 80h
