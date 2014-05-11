.data

fmt_str:
	.string "%d"
fmt_stro:
	.string "%d\n"
int_1:
	.space 4
int_2:
	.space 4

.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $int_1
	pushl $fmt_str
	call scanf
	addl $8, %esp
	pushl $int_2
	pushl $fmt_str
	call scanf
	addl $8, %esp
	movl int_2, %ebx
	movl int_1, %eax

	testl %eax, %eax
	je e0
	shll $4, %eax
	addl %eax, %ebx
	jmp print
e0:
	shll $4, %ebx
	jmp print
print: 
	pushl %ebx
	pushl $fmt_stro
	call printf

	addl $8, %esp
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	
	ret

