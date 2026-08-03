global	ft_strdup

section	.text

extern	malloc
extern	ft_strlen
extern	ft_strcpy

ft_strdup:
	push	r12

	mov		r12, rdi

	call	ft_strlen wrt ..plt

	inc		rax

	mov		rdi, rax

	call	malloc wrt ..plt

	test	rax, rax
	je		.error

	mov		rdi, rax
	mov		rsi, r12

	call	ft_strcpy wrt ..plt

	pop		r12
	ret

.error:
	mov		rax, 0
	pop		r12
	ret