.data

x:
	.space 4
y:
	.space 4
str_fmt:
	.string "%f"
str_fmto:
	.string "%.2lf"
str_ent:
	.string "\n"
.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $x
	pushl $str_fmt
	call scanf
	addl $8, %esp

	pushl $y
	pushl $str_fmt
	call scanf
	addl $8, %esp

	fld1
	flds y
	flds x
	fsubp
	fyl2x
	
	fldlg2
	flds y
	flds  x
	faddp
	fyl2x
	faddp
	
		
	fstpl -4(%esp)
	subl $4, %esp
	pushl $str_fmto
	call printf
	addl $8, %esp
	
	pushl $str_ent
	call printf
	addl $4, %esp

	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret
	
	
	
