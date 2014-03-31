.data

int_t:
	.space 4
int_1:
	.space 4
str_fmti:
	.string "%d"
str_fmtis:
        .string "straight %d"

str_fmtik:
        .string "kosv %d"

str_fmtin:
        .string "neposr %d"

str_end:
	.string "\n"

.text
.globl main
main:

//prologue
	pushl %ebp
	movl %esp, %ebp

	pushl $int_t
	pushl $str_fmti
	call scanf
	addl $8, %esp

	pushl $int_1
	pushl $str_fmti
	call scanf
	addl $8, %esp
	movl int_t, %eax
	movl $int_1, %ebx
	cmpl $1, %eax
	je straight
	cmpl $2, %eax
	je kosv
	cmpl $3, %eax
	je neposr

straight:
	movl (int_1), %eax
	pushl %eax
	pushl $str_fmtis
	call printf
	addl $8, %esp
	jmp end
kosv:
	movl (%ebx), %eax
	pushl %eax
	push $str_fmtik
	call printf
	addl $8, %esp
	jmp end
neposr:
	movl $100, %eax
	pushl %eax
	push $str_fmtin
	call printf
	addl $8, %esp
	jmp end	
end:
	pushl $str_end
	call printf
	addl $8, %esp
	
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
	
