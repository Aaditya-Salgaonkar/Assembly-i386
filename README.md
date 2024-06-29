# Assembly-i386
This README provides an overview and instructions for using the assembly i386 (x86) code included in this project.
This project includes the following files : "filename.asm"[Description of what this file contains]

Usage
To assemble and run the code, follow these steps:

1. Assembling: Use an assembler compatible with i386 assembly. For example: "nasm -f elf filename.asm"
2. Linking: ld -m elf_i386 -s -o filename filename.o
3. Running: ./filename

Sample Code : 
    section .data
        msg db 'Hello, world!', 0
    section .text
    global _start
    _start:

    ; Output message
    mov eax, 4       ; sys_write
    mov ebx, 1       ; file descriptor 1 (stdout)
    mov ecx, msg     ; message to write
    mov edx, 13      ; message length
    int 0x80         ; syscall
    
    ; Exit program
    mov eax, 1       ; sys_exit
    xor ebx, ebx     ; exit code 0
    int 0x80         ; syscall


