.data

str_end:
	.string "\n"
fmt_str:
	.string "%d"

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

//calculate the summ of the first 100 numbers starting from the input number
	pushl $int_1
	pushl $fmt_str
	call scanf
	addl $8, %esp
	movl int_1, %eax
//set the loop counter
	movl $100, %ecx
	movl $0, %ebx
summ:
	addl %eax, %ebx
	incl %eax
	loop summ

	pushl %ebx
	pushl $fmt_str
	call printf
	addl $8, %esp
	
	pushl $str_end
	call printf
	addl $8, %esp

movl $0, %eax
movl %ebp, %esp
popl %ebp
ret

