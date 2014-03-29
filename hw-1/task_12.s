.data

fmt_stri:
	.string "%d %d %d"
fmt_stro:
	.string "%d"

int_s:
	.space 4
int_1:
	.space 4
int_2:
	.space 4


.text

.globl main

main:
//prologue
	pushl %ebp
	movl %esp, %ebp
//read command 1 - '+' 2 - '-' 3 - '*' 4 - '/'
	pushl $int_2
	pushl $int_1
	pushl $int_s
	pushl $fmt_stri
	call scanf
	addl $8, %esp
	movl int_s, %eax
	cmpl $1, %eax
	je sum
	cmpl $2, %eax
	je sub
	cmpl $3, %eax
	je mul
	cmpl $4, %eax
	je div
sum:
	movl int_1, %eax
	movl int_2, %ebx
	addl %eax, %ebx
	pushl %ebx
	jmp print
sub:
	movl int_1, %eax
	movl int_2, %ebx
	subl %eax, %ebx
	pushl %ebx
	jmp print
mul:
	movl int_1, %eax
	movl int_2, %ebx
	imull %eax, %ebx
	pushl %ebx
	jmp print
div:
	movl int_2, %ebx
	movl int_1, %eax
	idivl %ebx
	pushl %eax
	jmp print	

print:	
	pushl $fmt_stro
	call printf
	addl $4, %esp

movl $0, %eax
movl %ebp, %esp
popl %ebp
ret

