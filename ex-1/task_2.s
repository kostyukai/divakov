	.data
	.globl main

int_1:
	.space 4
int_2:
	.space 4
fmt_strd:
	.string "%u"
fmt_stro:
	.string "2^32+%d"
str_enter:
	.string "\n"
	
.text

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $int_1
	pushl $fmt_strd
	call scanf
	addl $8, %esp
	
	pushl $int_2
	pushl $fmt_strd
	call scanf
	addl $8, %esp
	
	movl int_1, %eax
	movl int_2, %ebx

	addl %ebx, %eax
	
	jnb ok
	
	movl int_1, %eax
	movl int_2, %ebx
	
	cmpl $2147483648, %eax
	jg check2
	cmpl $2147483648, %ebx
	jg scnd
	
check2:
	cmpl $2147483648, %ebx
 	jg both
	jmp first
	
first: 
	movl $2147483648, %edx
	subl %ebx, %edx
	subl %edx, %eax
	subl $2147483648, %eax
	movl %eax, %edx
	jmp print

scnd:
	movl $2147483648, %edx
	subl %eax, %edx
	subl %edx, %ebx
	subl $2147483648, %ebx
	movl %ebx, %edx
	jmp print

both:
	subl $2147483648, %eax
	subl $2147483648, %ebx
	addl %eax, %ebx
	movl %ebx, %edx
	jmp print

print: 
	pushl %edx
	pushl $fmt_stro
	call printf
	addl $8, %esp
	jmp end	

ok:	
	pushl %eax
	pushl $fmt_strd
	call printf
	addl $8, %esp

end:	
	pushl $str_enter
	call printf
	addl $8, %esp
	
	movl $8, %eax
	movl %ebp, %esp
	popl %ebp
	ret
