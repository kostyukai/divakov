	.data
	.globl main
flt_empt:
	.space 4
fmt_strf:
	.string "%f"
fmt_strd:
	.string "%d"
fmt_end:
	.string "\n"
	
	.text
main:
//prologue
	pushl %ebp
	movl %esp, %ebp 
//read our integer	
	pushl $flt_empt
	pushl $fmt_strf
	call scanf
	addl $8, %esp
	
//move our integer to eax
	movl flt_empt, %eax 
//set a counter for our loop
	movl $32, %ecx 
	movl $0, %edx	
skip: 	
//shift our lumber to the left in cf apperas the left symbol
	shll $1, %eax 
	movl $0, %ebx
	jnb zero
//if not 0, we have found the first symbol of our number and we set the flag in edx to 1
	incl %ebx	
zero:
	pushl %ecx
	pushl %eax
	pushl %ebx
	pushl $fmt_strd
	call printf
	addl $8, %esp
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

	

	 
	


