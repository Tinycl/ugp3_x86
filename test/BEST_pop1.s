
						.data

						m8_init_1:
							.byte 0xff
						m8_init_2:
							.byte 0x5a
						m8_init_3:
							.byte 0xa5
						m8_init_4:
							.byte 0x00

						.align 2
						m16_init_1:
							.short 0xffff
						.align 2
						m16_init_2:
							.short 0xa55a
						.align 2
						m16_init_3:
							.short 0x5a5a
						.align 2
						m16_init_4:
							.short 0x0000							

						.align 4
						m32_init_1:
							.long 0xffffffff
						.align 4
						m32_init_2:
							.long 0xa5a55a5a
						.align 4
						m32_init_3:
							.long 0x5a5aa5a5
						.align 4
						m32_init_4:
							.long 0x00000000

						.align 8
						m64_init_1:
							.long 0xffffffff
							.long 0xffffffff
						.align 8
						m64_init_2:
							.long 0xa5a5a5a5
							.long 0x5a5a5a5a
						.align 8
						m64_init_3:
							.long 0x5a5a5a5a
							.long 0xa5a5a5a5
						.align 8
						m64_init_4:
							.long 0x00000000	
							.long 0x00000000							

						
						m80_init_1:
							.byte 0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff,0xff
						
						m80_init_2:
							.byte 0xa5,0xa5,0xa5,0xa5,0xa5,0x5a,0x5a,0x5a,0x5a,0x5a
						
						m80_init_3:
							.byte 0x5a,0x5a,0x5a,0x5a,0x5a,0xa5,0xa5,0xa5,0xa5,0xa5
						
						m80_init_4:
							.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00	


						.align 16
						m128_init_1:
							.long 0xffffffff
							.long 0xffffffff
							.long 0xffffffff
							.long 0xffffffff
						.align 16
						m128_init_2:
							.long 0xa5a5a5a5
							.long 0x5a5a5a5a							
							.long 0x5a5a5a5a
							.long 0xa5a5a5a5							
						.align 16
						m128_init_3:
							.long 0x5a5a5a5a
							.long 0xa5a5a5a5							
							.long 0xa5a5a55a
							.long 0xa5a5aaaa							
						.align 16
						m128_init_4:
							.long 0x00000000	
							.long 0x00000000	
							.long 0x00000000	
							.long 0x00000000


						.align 32
						m256_init_1:
							.long 0xffffffff
							.long 0xffffffff
							.long 0xffffffff
							.long 0xffffffff
							.long 0xffffffff
							.long 0xffffffff
							.long 0xffffffff
							.long 0xffffffff
						.align 32
						m256_init_2:
							.long 0xaaaaaaaa
							.long 0xaaaaaaaa
							.long 0xaaaaaaaa
							.long 0xaaaaaaaa								
							.long 0x55555555
							.long 0x55555555
							.long 0x55555555
							.long 0x55555555							
						.align 32
						m256_init_3:
							.long 0x55555555
							.long 0x55555555
							.long 0x55555555
							.long 0x55555555								
							.long 0xaaaaaaaa
							.long 0xaaaaaaaa
							.long 0xaaaaaaaa
							.long 0xaaaaaaaa								
						.align 32
						m256_init_4:
							.long 0x00000000	
							.long 0x00000000	
							.long 0x00000000	
							.long 0x00000000
							.long 0x00000000	
							.long 0x00000000	
							.long 0x00000000	
							.long 0x00000000							

						# fpu
						.align 2
						m16int_init_1:
							.short 0xffff
						m16int_init_2:
							.short 0xa5a5
						m16int_init_3:
							.short 0x5a5a
						m16int_init_4:
							.short 0x0000
						
						.align 4
						m32int_init_1:
							.long 0xffffffff
						m32int_init_2:
							.long 0xa5a5a5a5
						m32int_init_3:
							.long 0x5a5a5a5a
						m32int_init_4:
							.long 0x00000000

						.align 8
						m64int_init_1:
							.long 0xffffffff
							.long 0xffffffff
						m64int_init_2:
							.long 0xa5a5a5a5
							.long 0xa5a5a5a5
						m64int_init_3:
							.long 0x5a5a5a5a
							.long 0x5a5a5a5a
						m64int_init_4:
							.long 0x00000000
							.long 0x00000000
							
						.align 4
						m32fp_init_1:
							.float 0.000001
						m32fp_init_2:
							.float -0.000001
						m32fp_init_3:
							.float -999.99999
						m32fp_init_4:
							.float 999.99999					
						
						.align 8
						m64fp_init_1:
							.double 0.0000000001
						m64fp_init_2:
							.double -0.0000000001
						m64fp_init_3:
							.double -99999.9999999
						m64fp_init_4:
							.double  9999.99999999


						# ymm init
						.align 32
						.simdvalue:
							.long   0xaaaaaaaa
							.long   0x55555555
							.long   0x33333333
							.long   0xcccccccc
							.long   0xaaaaaaaa
							.long   0x55555555
							.long   0x33333333
							.long   0xcccccccc

						.text
						.globl	evolved_function
						.type	evolved_function, @function
					evolved_function:
					.LFB0:
						.cfi_startproc

						pushq   %rbp
						#.cfi_def_cfa_offset 8
						#.cfi_offset 5, -8
						movq    %rsp, %rbp
						#.cfi_def_cfa_register 5

						pushq %rbx
						pushq %rcx
						pushq %rdx

						#reg init
						mov $0x55555555, %rax
						mov $0x33333333, %rbx
						mov $0x22222222, %rdx
						mov $0x44444444, %rsi
						mov $0x77777777, %rdi
				
						fldpi
						fldpi
						fldpi
						fldpi
						fldpi
						fldpi
						fldpi
						
						vmovdqa .simdvalue(%rip), %ymm0
						vmovdqa .simdvalue(%rip), %ymm1
						vmovdqa .simdvalue(%rip), %ymm2
						vmovdqa .simdvalue(%rip), %ymm3
						vmovdqa .simdvalue(%rip), %ymm4
						vmovdqa .simdvalue(%rip), %ymm5
						vmovdqa .simdvalue(%rip), %ymm6
						vmovdqa .simdvalue(%rip), %ymm7
						vmovdqa .simdvalue(%rip), %ymm8
						vmovdqa .simdvalue(%rip), %ymm9
						vmovdqa .simdvalue(%rip), %ymm10
						vmovdqa .simdvalue(%rip), %ymm11
						vmovdqa .simdvalue(%rip), %ymm12
						vmovdqa .simdvalue(%rip), %ymm13
						vmovdqa .simdvalue(%rip), %ymm14
						vmovdqa .simdvalue(%rip), %ymm15
				
						mov $50000000, %rcx  #leave for i--
						#subq    $304, %rsp

					.LOOP:
				 
								fcmovbe	%st(1), %st(0)
							 
								cmpb	%r11b, uc_c1(%rip)
							 
								fcom	uc_c1(%rip)
							 
								fistp	m16int_init_3(%rip)
							 
								fld	m80_init_1(%rip)
							 
								fstp	m80_init_1(%rip)
							 
								fstp	m80_init_3(%rip)
							 
								fld1 
							 
	
								fist	m32int_init_2(%rip)
							 
								crc32	%si, %eax
							 
								fsubr	m32fp_init_4(%rip)
							 
								shld	$233, %r10w, m16_init_2(%rip)
							 
								ficom	m32int_init_2(%rip)
							 
								finit 
							 
								fmul	m64fp_init_4(%rip)
							 
								fcmovbe	%st(1), %st(0)
							 
								fcmovnu	%st(1), %st(0)
							 
	
							 


							

						#sub $1,%rcx #remove this and below comment for fixed iterations
						#cmp $0, %rcx
						#jne 	.LOOP
						#jmp    .LOOP
						#leave
						#.cfi_restore 5
						#.cfi_def_cfa 4, 4
						#retq
						
						popq %rdx
						popq %rcx
						popq %rbx
						
						movq %rbp, %rsp
						popq %rbp
						retq
						
						.cfi_endproc
					.LFE0:
						.size	evolved_function, .-evolved_function
						.ident	"MicroGP"
						.section	.note.GNU-stack,"",@progbits
				