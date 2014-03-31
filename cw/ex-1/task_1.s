//first input a character that will be in the end of the line, then input the string

.data


eof:
	.space 1

.comm string, 256, 4

str_fmtc:
	.string "%c"

str_fmts:
	.string "%s"
str_out:
	.string "%d"

.text

.globl main

main:
	
	pushl %ebp
	movl %esp, %ebp
	
	pushl $eof
	pushl $str_fmtc
	call scanf
	addl $8, %esp

	
	pushl $string
	pushl $str_fmts
	call scanf
	addl $8, %esp

	movl $string, %ebx
	movb eof, %al	
	movl $0, %edx
	movl $256, %ecx

find_eof:
	cmpl (%ebx), %eax
	je end
	addl $1, %ebx
	incl %edx
	loop find_eof

end:
	pushl %edx
	pushl $str_out
	call printf
	addl $8, %esp
	
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
