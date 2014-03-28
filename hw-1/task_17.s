.data

fmt_str:
	.string "summ of numbers from 1 to 100 = %d/n"

int_1:
	.space 4

.text

.globl main

main:
//prologue
	pushl %ebp
	movl %esp, %ebp
	movl $0, %ebx
	movl $1, %eax
	movl $100, %ecx

//calculate the summ of the first 100 numbers
summ:
	addl %eax, %ebx
	incl %eax
	loop summ
	pushl %ebx
	pushl $fmt_str
	call printf
	addl $8, %esp
movl $0, %eax
movl %ebp, %esp
popl %ebp
ret

