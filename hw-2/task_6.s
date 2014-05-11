.data

dummy:
	.space 4
fmt_stri:
	.string "%d"
fmt_str:
	.string "%d %d %d %d\n"

.macro outf
        subl $16, %esp

        movl $0, -4(%ebp)
        movl $0, -8(%ebp)
        movl $0, -12(%ebp)
        movl $0, -16(%ebp)

        jnc CF_0
        movl $1, -4(%ebp)
CF_0:
        je ZF_0
        movl $1, -8(%ebp)
ZF_0:
        jns SF_0
        movl $1, -12(%ebp)
SF_0:
        jno OF_0
        movl $1, -16(%ebp)
OF_0:
        pushl -4(%ebp)
        pushl -8(%ebp)
        pushl -12(%ebp)
        pushl -16(%ebp)

        pushl $fmt_str
        call printf
        addl $8, %esp
.endm

.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $dummy
	pushl $fmt_stri
	call scanf
	addl $8, %esp
	
	outf
	
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
		
		
