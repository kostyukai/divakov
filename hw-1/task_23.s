.data

int_t:
	.space 4
int_1:
	.space 4
char_1:
	.space 1
float_1:
	.space 8

str_fmtr:
	.string "%d %c %lf"
str_fmti:
	.string "%d"
str_fmtc:	
	.string "%c"
str_fmtf:
	.string "%lf"
str_fmte:
	.string "\n"

.text
.globl main

init:
//prologue
	pushl %ebp
	movl %esp, %ebp

	pushl $float_1
	pushl $char_1
	pushl $int_1
	pushl $str_fmtr
	call scanf
	addl $8, %esp

	movl int_1, %eax
	pushl %eax
	pushl $str_fmti
	call printf
	addl $8, %esp
	pushl $str_fmte
	call printf

	movb char_1, %al
	pushl %eax
	pushl $str_fmtc
	call printf
	addl $8, %esp
	pushl $str_fmte
	call printf


	fldl float_1
	movl $str_fmtf, %eax
	fstpl 4(%esp)
	movl %eax, (%esp)
	call printf
	addl $12, %esp
	pushl $str_fmte
	call printf

	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
		
	ret
main:	
	pushl %ebp
	movl %esp, %ebp
	call init
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
	
