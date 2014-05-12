.data
str_1:
	.space 12
str_2:
	.space 12
str_temp:
	.space 12
stl1:
	.space 4

p:
	.space 4

str_fmt:
	.string "%s"
str_fmti:
	.string "%d"
str_fmto:
	.string "%s\n"
.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $p
	pushl $str_fmti
	call scanf
	addl $8, %esp
	
	pushl $str_1
	pushl $str_fmt
	call scanf
	addl $8, %esp
	movl $str_1, %esi
	
	pushl $str_2
	pushl $str_fmt
	call scanf
	addl $8, %esp
	
	
	subl $8, %esp
	movl $0, stl1
strlen:
	lodsb 
	cmp $0, %al
	je fin
	incl stl1
	jmp strlen
fin:	
	movl p, %ecx
	movl $str_2, %ebx
	movl %ebx, %esi
	movl $str_temp, %edx
	movl %edx, %edi
	rep movsb
	movl $str_temp, %edx
	
	decl p
	addl p, %edx
	movl %edx, %edi
	movl stl1, %ecx
	movl $str_1, %esi
	rep movsb
	
	movl $str_2, %ebx
	addl p, %ebx
	movl %ebx, %esi
	
	movl $str_temp, %edx
	addl p, %edx
	addl stl1, %edx
	movl %edx, %edi
	
	movl $12, %eax
	subl p, %eax
	movl %eax, %ecx
	
	rep movsb
	


	pushl $str_temp
	pushl $str_fmto
	call printf
	addl $8, %esp

	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret

	
	
	
