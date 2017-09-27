	.file	"mystery.c"
	.text
	.globl	add
	.type	add, @function
add:
.LFB32:
	.cfi_startproc
	leaq	(%rdi,%rsi), %rax
	ret
	.cfi_endproc
.LFE32:
	.size	add, .-add
	.globl	fibb
	.type	fibb, @function
fibb:
.LFB33:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, %rbx
	movq	num(,%rdi,8), %rax
	cmpq	$-1, %rax
	jne	.L3
	movl	$0, %eax
	testq	%rdi, %rdi
	je	.L4
	movb	$1, %al
	cmpq	$1, %rdi
	je	.L4
	leaq	-1(%rdi), %rdi
	call	fibb
	movq	%rax, %rbp
	leaq	-2(%rbx), %rdi
	call	fibb
	addq	%rbp, %rax
.L4:
	cmpq	$-1, num(,%rbx,8)
	jne	.L5
	movq	%rax, num(,%rbx,8)
.L5:
	movq	num(,%rbx,8), %rax
.L3:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE33:
	.size	fibb, .-fibb
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Value:%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB34:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	8(%rsi), %rdi
	movl	$10, %edx
	movl	$0, %esi
	call	strtol
	movslq	%eax, %rdi
	movl	$num, %eax
	movl	$num+1600, %ecx
	movq	$-1, %rdx
.L11:
	movq	%rdx, (%rax)
	addq	$8, %rax
	cmpq	%rcx, %rax
	jne	.L11
	call	fibb
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE34:
	.size	main, .-main
	.comm	num,1600,32
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
