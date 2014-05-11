.data


password:
	.string "12345678"

entr:
	.string "\n"

str_failure:
	.string "failure!"

str_fmt:
	.string "%s"

str_fmtc:
	.string "%c"

str_success:

	.string "success!"
str_temp:
	.space 8

str_in:
	.space 8
str_out:
	.space 8


.text
.globl main

main:
	pushl %ebp
	movl %esp, %ebp
	
	pushl $str_in
	pushl $str_fmt
	call scanf
	addl $8, %esp
	
	movl $str_in, %esi
	movl $str_temp, %edi	
	
	movl $8, %ecx	
	rep movsb
	
	movl $8, %ecx
	
	movl $str_temp, %esi
	movl $password, %edi

	rep cmpsb

	jne recode
	
	movl $8, %ecx
	movl $str_success, %esi
	movl $str_out, %edi
	rep movsb
	
	jmp end
	
	 
	

recode:
	movl $8, %ecx
	movl $str_temp, %edi
	movl $42, %eax
	repne scasb
	test %ecx, %ecx
	je nokey
	
	movl $8, %ecx
	movl $str_temp, %esi
	movl $str_out, %edi
	
sh:	
	lodsb
	incb %al
	stosb
	loop sh
	
	jmp end
nokey:
	movl $8, %ecx
	movl $str_failure, %esi
	movl $str_out, %edi
	rep movsb
	
	
end:
	pushl $str_out
	pushl $str_fmt
	call printf
	addl $8, %esp
	
	pushl $entr
	call printf
	
	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret 
