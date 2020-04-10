
        .file   "main.s"
        .data

		.align 2
		m16_init:
			.short 0x1111
		.align 4
		m32_init:
			.long 0x11111111
		m64_init:
			.long 0x11111111
			.long 0x11111111
		m128_init:
			.long 0x11111111
			.long 0x11111111
			.long 0x11111111
			.long 0x11111111
		m256_init:
			.long 0x11111111
			.long 0x11111111
			.long 0x11111111
			.long 0x11111111
			.long 0x11111111
			.long 0x11111111
			.long 0x11111111
			.long 0x11111111
		
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
        .globl  main
        main:
.LFB0:
		.cfi_startproc
		pushq   %rbp
		#.cfi_def_cfa_offset 8
		#.cfi_offset 5, -8
		movq    %rsp, %rbp
		#.cfi_def_cfa_register 5



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

.L2:
		fcom %st(0)      
		cmpxchgl  %r14d, m32_init
        btrw    $255, m32_init(%rip)
        btc    %ecx, %ecx
		vcvtpd2ps	m128_init(%rip), %ymm0
		vcvtpd2ps	m256_init(%rip), %ymm0
		vcvttpd2dq  m256_init,%ymm0
		vcvtpd2dq	m128_init, %ymm0
        #sub $1,%rcx #remove this and below comment for fixed iterations
        #cmp $0, %rcx
        #jmp     .L2

						
		movq %rbp, %rsp
		popq %rbp
		retq				
        .cfi_endproc
.LFE0:
        .ident  "GCC: (GNU) 6.4.0"
