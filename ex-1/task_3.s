	.data

str_enter:
	.string "\n"

str_fmtd:
	.string "%d"
str_fmtc:
	.string "%c"
temp1:
	.long 0x00000000
temp2:
	.long 0x00000000
number:
	.long 0x00000000
bit:
	.long 0x00000000

.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp

	pushl $number
	pushl $str_fmtd
	call scanf
	addl $8, %esp
	movl number, %ecx
	movl %ecx, temp2
	
	pushl $bit
	pushl $str_fmtc
	call scanf
	addl $8, %esp

	movl temp2, %ecx

next:	

	movl %ecx, temp2
	movl $8, %ecx

read:
	movl %ecx, temp1
	pushl $bit
	pushl $str_fmtc
	call scanf
	addl $8, %esp
	pushl bit
	movl temp1, %ecx
	loop read

	movl $8, %ecx

inv:
	movl %ecx, temp1
	pushl $str_fmtc
	call printf
	addl $8, %esp
	movl temp1, %ecx
	loop inv
	
	movl temp2, %ecx
	loop next
	
	pushl $str_enter
	call printf
	addl $8, %esp

	movl %ebp, %esp
	popl %ebp
	movl $0, %eax
	ret



	
	
	

