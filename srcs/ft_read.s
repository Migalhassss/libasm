global ft_read

section .text

extern __errno_location

ft_read:
	mov		rax, 0
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