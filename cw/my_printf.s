	.data 
msg_string:
	.string "Call.\n"
	.text
	.globl _main
_main:
	pushl %ebp
	movl %esp, %ebp
	pushl $msg_string
	calll _printf
	addl $4, %esp
	movl %ebp, %esp
	popl %ebp
	ret
