.data

fmt_str:
	.string "first summ of numbers until it exceeding 10000 = %d\n"

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

//calculate the summ of numbers
summ:
	
//do 
	addl %eax, %ebx
	incl %eax
//while sum is less than 10000
	cmpl $10000, %ebx
	jg ex
	jmp summ
ex:
	pushl %ebx
	pushl $fmt_str
	call printf
	addl $8, %esp
movl $0, %eax
movl %ebp, %esp
popl %ebp
ret

