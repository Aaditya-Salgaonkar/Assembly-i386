section .data
s2 times 9 db '*'
newline db 10 , 0

section .text
global _start
_start:
  mov eax,4   
   mov	ebx,1    
   mov	ecx,s2   
   mov	edx,9
   int	80h 
  
  mov eax,4   
   mov	ebx,1    
   mov	ecx,newline 
   mov	edx,1
   int	80h 
   
   

mov eax,1
mov ebx,0
int 80h

























