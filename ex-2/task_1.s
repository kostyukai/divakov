.data

str_fmtn:
	.string "NO ENTRY"
str_ent:
	.string "\n"
ch_fmt:
	.string "%c"

str_fmt:
	.string "%s"
str_fmti:
	.string "%d"

str_1:
	.space 12
str_2:
	.space 12
.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp

	pushl $str_1
	pushl $str_fmt
	call scanf
	addl $8, %esp
	
	pushl $str_2
	pushl $str_fmt
	call scanf
	addl $8, %esp
	
	subl $16, %esp
	movl $0, %eax
	movl $12, %edx
	
	movl %eax, -4(%ebp)
	movl %edx, -8(%ebp)
	movl $str_2, -12(%ebp)
	
sentry:
	cld

	movl -12(%ebp), %esi
	movl $str_1, %edi
	movl -8(%ebp), %ecx
	repe cmpsb
	test %ecx, %ecx
	je fentry
	
	movl -4(%ebp), %eax
	incl %eax
	movl %eax, -4(%ebp)	

	movl -8(%ebp), %edx
	decl %edx
	movl %edx, -8(%ebp)

	cmpl $1, %edx
	je nentry

	movl -12(%ebp), %ebx
	addl $1, %ebx
	movl %ebx, -12(%ebp)
	jmp sentry

fentry:
	addl $1, -4(%ebp)
	pushl -4(%ebp)
	pushl $str_fmti
	call printf
	addl $8, %esp
	jmp end
nentry:
	pushl $str_fmtn
	call printf
	addl $4, %esp
	jmp end

end:
	pushl $str_ent
	call printf
	addl $4, %esp
	
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
