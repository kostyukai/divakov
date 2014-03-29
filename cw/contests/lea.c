	.text
	.globl exsumm
exsumm:
	pushl %ebp
	movl %esp, %ebp
	
	pushl %ebx
	movl 8(%ebp), %eax
	movl 12(%ebp), %ebx
	addl %eax, %ebx
	movl %ebx, %eax
	popl %ebx

	movl %ebp, %esp
	popl %ebp
	ret

        .globl exsumm
exsub:
        pushl %ebp
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp), %eax
        movl 12(%ebp), %ebx
        subl %eax, %ebx
        movl %ebx, %eax
        popl %ebx

        movl %ebp, %esp
        popl %ebp
        ret

~             

