.data

x:
	.space 4
y:
	.space 4

str_fmt:
	.string "%f"

str_fmto:
	.string "%.2f"

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
		
	flds y
	flds x
	#poluchayem 2^t, gde t = round (log2 x^y)
	fyl2x
	frndint
	fld1
	fscale
	flds y
	flds x
	fyl2x
	frndint
	
	#poluchayem p, gde p = log2x^y - round (log2x^y)
	flds y
	flds x
	fyl2x
	fsubp
	
	#poluchayem 2^p-1
	f2xm1
	
	#dobavl 1
	fld1
	faddp
	
	#poluchayem v st(0) 2^(p+t) = 2^(log2 x^y) = x^y
	fmulp
	
	fstpl (%esp)
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
