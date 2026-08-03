global	ft_list_size

section	.text


ft_list_size:

	xor	rax, rax

.loop:

	test	rdi, rdi
	jz		.done


	inc		rax


	mov		rdi, [rdi + 8]
	
	jmp		.loop


.done

	ret
