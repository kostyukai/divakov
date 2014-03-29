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
	
        .text
        .globl exinc
exinc:
        pushl %ebp
        movl %esp, %ebp
        movl 8(%ebp), %eax
        addl $1, %eax
        movl %ebp, %esp
        popl %ebp
        ret

        .text
        .globl exdec
exdec:
        pushl %ebp
        movl %esp, %ebp
        movl 8(%ebp), %eax
        subl $1, %eax
        movl %ebp, %esp
        popl %ebp
        ret

	.text
        .globl exsub
exsub:
        pushl %ebp
        movl %esp, %ebp
        pushl %eax
        movl 8(%ebp), %ebx
        movl 12(%ebp), %eax
        subl %eax, %ebx
        movl %ebx, %eax
        popl %ebx

        movl %ebp, %esp
        popl %ebp
        ret

            
	.text
	.globl exmul
exmul:
        pushl %ebp
        movl %esp, %ebp

        pushl %eax
        movl 8(%ebp), %ebx
        movl 12(%ebp), %eax
        mull %ebx
        movl %ebp, %esp
        popl %ebp
        ret

	.text
	.globl exdiv
exdiv:
	pushl %ebp
	movl %esp, %ebp
	pushl %eax
	movl %eax, %edx
	sarl $31, %edx
	movl 8(%ebp), %ebx
	movl 12(%ebp), %eax
	idivl %ebx
	movl %ebp, %esp
	popl %ebp
	ret

