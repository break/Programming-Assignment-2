	.file	"mystery.c"
	.comm	num,1600,32
	.text
	.globl	add
	.type	add, @function
add:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rax
	movq	-8(%rbp), %rdx
	addq	%rdx, %rax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	add, .-add
	.globl	fibb
	.type	fibb, @function
fibb:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	num(,%rax,8), %rax
	cmpq	$-1, %rax
	jne	.L4
	movq	$-1, -32(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L5
	movq	$0, -32(%rbp)
	jmp	.L6
.L5:
	cmpq	$1, -40(%rbp)
	jne	.L7
	movq	$1, -32(%rbp)
	jmp	.L6
.L7:
	movq	-40(%rbp), %rax
	subq	$1, %rax
	movq	%rax, %rdi
	call	fibb
	movq	%rax, %rbx
	movq	-40(%rbp), %rax
	subq	$2, %rax
	movq	%rax, %rdi
	call	fibb
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	add
	movq	%rax, -32(%rbp)
.L6:
	movq	-40(%rbp), %rax
	movq	num(,%rax,8), %rax
	cmpq	$-1, %rax
	jne	.L8
	movq	-40(%rbp), %rax
	movq	-32(%rbp), %rdx
	movq	%rdx, num(,%rax,8)
.L8:
	movq	-40(%rbp), %rax
	movq	num(,%rax,8), %rax
	movq	%rax, -24(%rbp)
	jmp	.L9
.L4:
	movq	-40(%rbp), %rax
	movq	num(,%rax,8), %rax
	movq	%rax, -24(%rbp)
.L9:
	movq	-24(%rbp), %rax
	addq	$40, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	fibb, .-fibb
	.section	.rodata
.LC0:
	.string	"Value:%ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	-32(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	atoi
	cltq
	movq	%rax, -16(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L12
.L13:
	movl	-4(%rbp), %eax
	cltq
	movq	$-1, num(,%rax,8)
	addl	$1, -4(%rbp)
.L12:
	cmpl	$199, -4(%rbp)
	jle	.L13
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fibb
	movq	%rax, %rsi
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
