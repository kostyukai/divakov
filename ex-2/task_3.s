.data

a1:
	.space 4
a2:
	.space 4
a3:
	.space 4
a4:
	.space 4
a5:
	.space 4
fmt_stro:
	.string "%d\n"

fmt_stri:
	.string "%d %d %d %d %d"

.macro pos
subl $4, %esp
movl $0, -4(%esp)

cmpl $0, a1
jng c2
incl -4(%esp)
c2:
cmpl $0, a2
jng c3
incl -4(%esp)
c3:
cmpl $0, a3
jng c4
incl -4(%esp)
c4:
cmpl $0, a4
jng c5
incl -4(%esp)
c5:
cmpl $0, a5
jng fn
incl -4(%esp)
fn:
pushl -4(%esp)
pushl $fmt_stro
call printf
addl $8, %esp

.endm	

.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	pushl $a1
	pushl $a2
	pushl $a3
	pushl $a4
	pushl $a5
	
	pushl $fmt_stri
	call scanf
	addl $24, %esp
	
	pos
	
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
ret
	

