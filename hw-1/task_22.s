.data

.comm person, 44, 4

str_fmtd:
	.string "%d"
str_fmtc:
	.string "%s"

str_out:
	.string "Family: %s Name: %s Age: %d\n"

.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp
//prologue
//read surname:
	pushl $person
	pushl $str_fmtc
	call scanf
	add $8, %esp
// read name:
	pushl $person+20
	pushl $str_fmtc
	call scanf
	addl $8, %esp
//read age:
	pushl $person+40
	pushl $str_fmtd
	call scanf
	addl $8, %esp
fin:
	movl $person+40, %ebx
	pushl (%ebx)	
	pushl $person+20
	pushl $person 
	pushl $str_out
	call printf
	addl $16, %esp

//epilogue
	movl %ebp, %esp
	popl %ebp
	ret
	
	
 
