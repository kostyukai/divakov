.data

fmt_str:
	.string "%d"
fmt_stra:
	.string "a\n"
fmt_strb:
	.string "b\n"
fmt_strc:
	.string "c\n"
fmt_strd:
	.string "default output\n"

int_1:
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
	movl int_1, %eax
	movl $1, %ebx
	cmpl %ebx, %eax
	je al
	movl $2, %ebx
	cmpl %ebx, %eax
	je bl
	movl $3, %ebx
	cmpl %ebx, %eax
	je cl
	jmp def
al:
	pushl $fmt_stra
	jmp print
bl:
	pushl $fmt_strb
	jmp print
cl:
	pushl $fmt_strc
	jmp print
def:
	pushl $fmt_strd
	jmp print	

print:
	call printf
	addl $4, %esp

movl $0, %eax
movl %ebp, %esp
popl %ebp
ret

