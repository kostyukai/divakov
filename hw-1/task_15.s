.data

fmt_str:
	.string "%d"
fmt_stre:
	.string "a=b\n"
fmt_strl:
	.string "a<b\n"
fmt_strb:
	.string "a>b\n"

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
//read our integers
	pushl $int_1
	pushl $fmt_str
	call scanf
	addl $8, %esp
	pushl $int_2
	pushl $fmt_str
	call scanf
	addl $8, %esp
	movl int_2, %ebx
	movl int_1, %eax
	cmpl %ebx, %eax
	je eq
	jl le
	jg lg
	
eq:
	pushl $fmt_strl
	jmp print
le:
	pushl $fmt_stre
	jmp print
lg:
	pushl $fmt_strb
	jmp print
print:
	call printf
	addl $4, %esp



addl $8, %esp
movl $0, %eax
movl %ebp, %esp
popl %ebp
ret

