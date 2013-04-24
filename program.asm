.section .data

	MSG: .string "My first code in ASM.\nHello world!\n"
	LMSG: .long . - MSG
	NAME: .string "What's is your name?\n"
	LNAME: .long . - NAME

.section .text

	.globl _start

		_start: 

		movl $0x4, %eax # syscall 4 - write
		movl $0x1, %ebx # sycall 1 - exit

		leal MSG, %ecx
		movl LMSG, %edx
		int $0x80 # Syscall, "Hey Kernel, do this for me!"
		
		# Get user name

		movl $0x4, %eax # syscall 4 - write
		movl $0x1, %ebx # sycall 1 - exit

		leal NAME, %ecx
		movl LNAME, %edx
		int $0x80
		
		movl %esp, %ecx
		
		# 10bytes for the name
		subl $0xa4, %esp 
			
		movl $0x3, %eax
		movl $0xa4, %edx
		int $0x80
		
		movl %eax, %edx
		
		movl $0x4, %eax
		movl $0x1, %ebx
		int $0x80
		
		# Exit		
				
		movl $0x1, %eax
		movl $0x0, %ebx
		int $0x80
		
# tam dan

