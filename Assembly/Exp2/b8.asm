section .data
sys.write equ 4
sys.exit equ 1
sys.out equ 0
num1 db '50'
num1len equ $-num1
newline db 10, 0
disp1 db 'First number : '
disp1len equ $-disp1
disp2 db 'Second number : '
disp2len equ $-disp2
num2 db '60'
num2len equ $-num2
section .text
global _start
_start:
	mov eax,sys.write
	mov ebx,sys.exit
	mov ecx,disp1
	mov edx,disp1len
	int 80h
	mov eax,sys.write
	mov ebx,sys.exit
	mov ecx,num1
	mov edx,num1len
	int 80h
	mov eax,sys.write
	mov ebx,sys.exit
	mov ecx,newline
	mov edx,sys.exit
	int 80h
	mov eax,sys.write
	mov ebx,sys.exit
	mov ecx,disp2
	mov edx,disp2len
	int 80h
	mov eax,sys.write
	mov ebx,sys.exit
	mov ecx,num2
	mov edx,num2len
	int 80h
	mov eax,sys.write
	mov ebx,sys.exit
	mov ecx,newline
	mov edx,sys.exit
	int 80h
mov eax,sys.exit
mov ebx,sys.out
int 80h

























