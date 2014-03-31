.data

.comm array, 6400, 32

int1:
	.space 4
int2:
	.space 4
str_fmt:
	.string "%d"

str_out:
	.string "%d\n"

.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp
//prologue
	pushl $int1
	pushl $str_fmt
	call scanf
	add $8, %esp
// read the number of lines
	pushl $int2
	pushl $str_fmt
	call scanf
	addl $8, %esp
// read the number of bars
	movl int1, %edx
	movl int2, %ecx
	imull %edx, %ecx
//read the elements
readarr:
	pushl %ecx
	movl $array, %ebx
	movl %ecx, %edx
	imull $4, %edx
	addl %edx, %ebx
	pushl %ebx
	pushl $str_fmt
	call scanf
	addl $8, %esp
	popl %ecx
	loop readarr
//reset the loop
	movl $array+4, %ebx
	movl $array, %eax
	movl int1, %ecx
	movl int2, %edx
	imull %edx, %ecx 	
find:
	addl $4, %eax
	cmpl %ebx, (%eax)
	jl new
cnt:
	loop find
	jmp fin
new:
	movl (%eax), %ebx
	jmp cnt
fin:	
	pushl %ebx
	pushl $str_out
	call printf
	addl $8, %esp

//epilogue
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
	
	
 
