.data

p:
	.space 4
i:
	.space 4
str_fmti:
	.string "%d"
str_fmt:
	.string "%s"
str_1:
	.space 12
.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $p
	pushl $str_fmti
	call scanf 
	addl $8, %esp
	decl p	


	pushl $i
	pushl $str_fmti
	call scanf
	addl $8, %esp
	
	pushl $str_1
	pushl $str_fmt
	call scanf
	addl $8, %esp
	
	movl $str_1, %ebx
	addl p, %ebx
	movl %ebx, %edi
	addl i, %ebx
	movl %ebx, %esi
	movl $12, %ecx
	movl p, %edx
	addl i, %edx
	subl %edx, %ecx

	rep movsb

	pushl $str_1
	pushl $str_fmt
	call printf
	addl $8, %esp
	
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
	
