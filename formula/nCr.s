	.globl	nCr
	.type	nCr, @function
nCr:
.LFB2:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r12
	pushq	%rbx
	subq	$32, %rsp
	movl	%edi, -36(%rbp)
	movl	%esi, -40(%rbp)
	movl	-36(%rbp), %eax
	movl	%eax, %edi
	call	Factorial
	movl	%eax, %ebx
	movl	-40(%rbp), %eax
	movl	%eax, %edi
	call	Factorial
	movl	%eax, %r12d
	movl	-40(%rbp), %eax
	movl	-36(%rbp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edi
	call	Factorial
	movl	%r12d, %edx
	imull	%eax, %edx
	movl	%edx, %ecx
	movl	%ebx, %eax
	cltd
	idivl	%ecx
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jns	.L2
	movl	$0, %eax
	jmp	.L3
.L2:
	movl	-20(%rbp), %eax
.L3:
	addq	$32, %rsp
	popq	%rbx
	popq	%r12
	popq	%rbp
	ret
.LFE2:
	.size	nCr, .-nCr
	.globl	Factorial
	.type	Factorial, @function
Factorial:
.LFB3:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.L5
	movl	-4(%rbp), %eax
	subl	$1, %eax
	movl	%eax, %edi
	call	Factorial
	imull	-4(%rbp), %eax
	jmp	.L6
.L5:
	movl	$1, %eax
.L6:
	leave
	ret
.LFE3:
	.size	Factorial, .-Factorial
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-11)"
	.section	.note.GNU-stack,"",@progbits
