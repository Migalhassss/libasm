global	ft_write

section	.text

extern	__errno_location

ft_write:
	mov		rax, 1
	syscall

	test	rax, rax
	jns		.done

	neg		rax
	push	rax

	call	__errno_location wrt ..plt

	pop		rdx
	mov		[rax], rdx

	mov		rax, -1

.done:
	ret