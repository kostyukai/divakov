.data

fmt_strd:
	.string "%d"

fmt_str:
	.string "%d\n"

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
	
	pushl $int_1
	pushl $fmt_strd
	call scanf
	addl $8, %esp
	movl int_1, %edx

//calculate the summ of numbers
summ:
	
//do 
	addl %eax, %ebx
	incl %eax
//while sum is less than 10000
	cmpl %edx, %ebx
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

