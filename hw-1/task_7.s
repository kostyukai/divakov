	.data
	.globl main
flt_empt:
	.space 10
fmt_strf:
	.string "%Lf"
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
	movl $6, %eax
	addl $flt_empt, %eax
	movl (%eax), %ebx
	movl %ebx, %eax	 
	movl $80, %ecx 
	jmp skip
pre:
//mlad razr
	movl $2, %eax
	movl $flt_empt, %eax
	movl (%eax), %ebx
	movl %ebx, %eax
	jmp skipp
pre1:
	movl $flt_empt, %eax
	movl (%eax), %ebx
	movl %ebx, %eax
	jmp skipp
skip: 	
//shift our lumber to the left in cf apperas the left symbol
	cmpl $48, %ecx
	je pre
	cmpl $16, %ecx
	je pre1
skipp:

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
	loop skip
	pushl $fmt_end
	call printf
	add $4, %esp
	movl $0, %eax

	movl %ebp, %esp
	popl %ebp
	ret

	

	 
	


