global	ft_list_sort

section	.text

ft_list_sort:

	test	rdi, rdi
	jz		.done

	mov		rax, [rdi]
	
	test	rax, rax
	jz		.done

	test	rsi, rsi
	jz		.done

	push	r12
	push	r13
	push	r14

	mov		r12, [rdi]
	mov		r14, rsi

.loop:

	test	r12, r12
	jz		.end
 
	mov		r13, [r12 + 8]

.loop2:

	test	r13, r13
	jz		.mov_i2

	mov		rdi, [r12]
	mov		rsi, [r13]

	call	r14

	cmp		eax, 0
	jle		.mov_i

	mov		rax, [r12]
	mov		rdx, [r13]
	mov		[r12], rdx
	mov		[r13], rax

.mov_i:
	mov		r13, [r13 + 8]
	jmp		.loop2


.mov_i2:
	mov		r12, [r12 + 8]
	jmp		.loop

.end:
	pop		r12
	pop		r13
	pop		r14

.done
	ret