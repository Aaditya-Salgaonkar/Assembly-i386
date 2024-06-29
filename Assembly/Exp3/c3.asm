section .data
base db '2'
arearect db 'Enter the length and the breadth of the rectangle : ', 10
arearectlen equ $-arearect
newline db 10, 0
rect db 'Area of rectangle : '
rectlen equ $-rect
perirect db 'Perimeter of rectangle : '
perirectlen equ $-perirect
areatri db 'Enter the base and height of the triangle : ', 10
areatrilen equ $-areatri
tri db 'Area of triangle : '
trilen equ $-tri
peri db 'Enter the three sides of a triangle : ', 10
perilen equ $-peri
p db 'Perimeter of triangle : '
plen equ $-p
section .bss
length : resb 5
breadth : resb 5
arrect : resb 5
tmp1 : resb 5
rec : resb 5
base1 : resb 5
height : resb 5
tmp2: resb 5
artri : resb 5
a:resb 5
b:resb 5
c: resb 5
tmp3:resb 5
s3:resb 5
section .text
global _start:
_start:

	mov eax,4
	mov ebx,1
	mov ecx,arearect
	mov edx,arearectlen
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,length
	mov edx,5
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,breadth
	mov edx,5
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,rect
	mov edx,rectlen
	int 80h
	
	mov al,[length]
	sub al,'0'
	mov bl,[breadth]
	sub bl,'0'
	mul bl
	add al,'0'
	mov[arrect],al
	
	mov eax,4
	mov ebx,1
	mov ecx,arrect
	mov edx,5
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,perirect
	mov edx,perirectlen
	int 80h
	
	mov al,[length]
	sub al,'0'
	mov bl,[breadth]
	sub bl,'0'
	add al,bl
	add al,'0'
	mov[tmp1],al
	
	mov al,[base]
	sub al,'0'
	mov bl,[tmp1]
	sub bl,'0'
	mul bl
	add al,'0'
	mov[rec],al
	
	mov eax,4
	mov ebx,1
	mov ecx,rec
	mov edx,5
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,areatri
	mov edx,areatrilen
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,base1
	mov edx,5
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,height
	mov edx,5
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,tri
	mov edx,trilen
	int 80h
	
	mov al,[base1]
	sub al,'0'
	mov bl,[height]
	sub bl,'0'
	mul bl
	add al,'0'
	mov[tmp2],al
	
	mov al,[tmp2]
	sub al,'0'
	mov bl,[base]
	sub bl,'0'
	div bl
	add al,'0'
	mov[artri],al
	
	mov eax,4
	mov ebx,1
	mov ecx,artri
	mov edx,5
	int 80h
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,peri
	mov edx,perilen
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,a
	mov edx,5
	int 80h

	mov eax,3
	mov ebx,2
	mov ecx,b
	mov edx,5
	int 80h
	
	mov eax,3
	mov ebx,2
	mov ecx,c
	mov edx,5
	int 80h
	
	mov eax,4
	mov ebx,1
	mov ecx,p
	mov edx,plen
	int 80h
	mov eax,[a]
	sub eax,'0'
	mov ebx,[b]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov[tmp3],eax
	
	mov eax,[tmp3]
	sub eax,'0'
	mov ebx,[c]
	sub ebx,'0'
	add eax,ebx
	add eax,'0'
	mov[s3],eax
	
	mov eax,4
	mov ebx,1
	mov ecx,s3
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
