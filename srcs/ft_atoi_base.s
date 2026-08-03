global	ft_atoi_base

section	.text

extern	ft_strlen

ft_atoi_base:

	push	rdi				
	mov		rdi, rsi		
	call	ft_strlen wrt ..plt
	pop		rdi				

	cmp		rax, 2
	jl		.done_error		

	mov		r9, rax			
	mov		rcx, 0			




.check_dup:
	movzx	rdx, byte [rsi + rcx]
	test	rdx, rdx
	jz		.base_valida	


	cmp		rdx, '+'
	je		.done_error
	cmp		rdx, '-'
	je		.done_error
	cmp		rdx, 32			
	je		.done_error
	cmp		rdx, 9			
	je		.done_error
	cmp		rdx, 10			
	je		.done_error
	cmp		rdx, 11			
	je		.done_error
	cmp		rdx, 12			
	je		.done_error
	cmp		rdx, 13			
	je		.done_error


	mov		r8, rcx
.loop_interno:
	inc		r8
	movzx	r10, byte [rsi + r8]
	test	r10, r10
	jz		.proxima_letra_base
	cmp		rdx, r10
	je		.done_error		
	jmp		.loop_interno

.proxima_letra_base:
	inc		rcx
	jmp		.check_dup




.base_valida:
	mov		r8, 1			

.loop_espacos:
	movzx	rdx, byte [rdi]
	test	rdx, rdx
	jz		.done_error


	cmp		rdx, 32
	je		.avancar_espaco
	cmp		rdx, 9
	je		.avancar_espaco
	cmp		rdx, 10
	je		.avancar_espaco
	cmp		rdx, 11
	je		.avancar_espaco
	cmp		rdx, 12
	je		.avancar_espaco
	cmp		rdx, 13
	je		.avancar_espaco

	jmp		.fase_sinal		

.avancar_espaco:
	inc		rdi
	jmp		.loop_espacos

.fase_sinal:
	movzx	rdx, byte [rdi]
	cmp		rdx, '-'
	je		.sinal_menos
	cmp		rdx, '+'
	je		.sinal_mais
	jmp		.preparar_conversao

.sinal_menos:
	mov		r8, -1			
	inc		rdi				
	jmp		.preparar_conversao

.sinal_mais:
	inc		rdi				
	jmp		.preparar_conversao

.preparar_conversao:
	mov		rax, 0			




.loop2:
	movzx	rdx, byte [rdi]	
	test	rdx, rdx
	jz		.finalizar_com_sinal


	mov		rcx, 0

.procurar_letra_na_base:
	movzx	r10, byte [rsi + rcx]
	test	r10, r10
	jz		.finalizar_com_sinal 

	cmp		rdx, r10
	je		.letra_encontrada
	inc		rcx
	jmp		.procurar_letra_na_base

.letra_encontrada:

	imul	rax, r9			
	add		rax, rcx		

	inc		rdi				
	jmp		.loop2			




.finalizar_com_sinal:
	imul	rax, r8			
	ret

.done_error:
	mov		rax, 0			
	ret
