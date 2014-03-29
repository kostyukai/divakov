	.data
	.globl main
int_empt:
	.space 4

fmt_str:
	.string "%x"
fmt_end:
	.string "\n"
	
	.text
main:
//prologue
	pushl %ebp
	movl %esp, %ebp 
//read our integer	
	pushl $int_empt
	pushl $fmt_str
	call scanf
	addl $8, %esp
	
//move our integer to eax
	movl int_empt, %eax 
//set a counter for our loop
	movl $32, %ecx 
	movl $0, %edx	
skip: 	
//shift our lumber to the left in cf apperas the left symbol
	shll $1, %eax 
	movl $0, %ebx
//if in cf 0	
	jnb zero
//if not 0, we have found the first symbol of our number and we set the flag in edx to 1
	incl %ebx
	movl $1, %edx
	
zero:

	cmpl $1, %edx
//if we still haven't fount the first symbol - keep skipping
	jne ks
// otherwise - print what os on cf 
	pushl %ecx
	pushl %eax
	pushl %edx
	pushl %ebx
	pushl $fmt_str
	call printf
	addl $8, %esp
	popl %edx
	popl %eax
	popl %ecx

ks: 
	loop skip
	pushl $fmt_end
	call printf
	add $4, %esp
	movl $0, %eax

	movl %ebp, %esp
	popl %ebp
	ret

	

	 
	


