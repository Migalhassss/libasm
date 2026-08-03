global	ft_list_push_front

section	.text

extern	malloc

ft_list_push_front:

	push	r12
	push	r13

	mov		r12, rdi
	mov		r13, rsi

	mov		rdi, 16
	call	malloc wrt ..plt

	test	rax, rax
	jz		.done


	move	[rax], r13

	mov		[rax], r13

	mov		rdx, [R12]
	mov		[rax + 8], rdx

	mov		[r12], rax

	pop		r13
	pop		r12

	ret

.done:
	pop		r13
	pop		r12

	ret