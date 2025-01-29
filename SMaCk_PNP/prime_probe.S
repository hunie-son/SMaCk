

.macro save_registers
    push %r11
    push %rdx
    push %rsi
    push %rcx
.endm

.macro rdtsc_begin
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
.endm

.macro rdtsc_end
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rcx
    pop %rsi
    pop %rdx
    pop %r11
    ret
.endm

.macro mrdtsc_rax
    .rept 0
    inc %rax
    .endr
    mfence
    #cpuid
    rdtsc 
    shl $32, %rdx
    add %rdx, %rax   
.endm

.align 0x1000
    .global oracle_code_page
oracle_code_page:
.rept 16384
    .rept 63
        nop
    .endr
    ret
.endr



        .global smc_target_set0_0    
    .align 0x1000
    .rept 0
        nop
    .endr      
smc_target_set0_0:
    nop
    jmp smc_target_set0_1
    
        .global smc_target_set0_1    
    .align 0x1000
    .rept 0
        nop
    .endr      
smc_target_set0_1:
    nop
    jmp smc_target_set0_2
    
        .global smc_target_set0_2    
    .align 0x1000
    .rept 0
        nop
    .endr      
smc_target_set0_2:
    nop
    jmp smc_target_set0_3
    
        .global smc_target_set0_3    
    .align 0x1000
    .rept 0
        nop
    .endr      
smc_target_set0_3:
    nop
    jmp smc_target_set0_4
    
        .global smc_target_set0_4    
    .align 0x1000
    .rept 0
        nop
    .endr      
smc_target_set0_4:
    nop
    jmp smc_target_set0_5
    
        .global smc_target_set0_5    
    .align 0x1000
    .rept 0
        nop
    .endr      
smc_target_set0_5:
    nop
    jmp smc_target_set0_6
    
        .global smc_target_set0_6    
    .align 0x1000
    .rept 0
        nop
    .endr      
smc_target_set0_6:
    nop
    jmp smc_target_set0_7
    
        .global smc_target_set0_7    
    .align 0x1000
    .rept 0
        nop
    .endr
smc_target_set0_7:
    nop
    jmp smc_target_set0_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set0
smc_prime_l1i_set0:
    jmp smc_target_set0_0
    smc_target_set0_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set0
smc_probe_l1i_set0:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set0_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set0_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set0_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set0_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set0_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set0_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set0_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set0_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set1_0    
    .align 0x1000
    .rept 64
        nop
    .endr      
smc_target_set1_0:
    nop
    jmp smc_target_set1_1
    
        .global smc_target_set1_1    
    .align 0x1000
    .rept 64
        nop
    .endr      
smc_target_set1_1:
    nop
    jmp smc_target_set1_2
    
        .global smc_target_set1_2    
    .align 0x1000
    .rept 64
        nop
    .endr      
smc_target_set1_2:
    nop
    jmp smc_target_set1_3
    
        .global smc_target_set1_3    
    .align 0x1000
    .rept 64
        nop
    .endr      
smc_target_set1_3:
    nop
    jmp smc_target_set1_4
    
        .global smc_target_set1_4    
    .align 0x1000
    .rept 64
        nop
    .endr      
smc_target_set1_4:
    nop
    jmp smc_target_set1_5
    
        .global smc_target_set1_5    
    .align 0x1000
    .rept 64
        nop
    .endr      
smc_target_set1_5:
    nop
    jmp smc_target_set1_6
    
        .global smc_target_set1_6    
    .align 0x1000
    .rept 64
        nop
    .endr      
smc_target_set1_6:
    nop
    jmp smc_target_set1_7
    
        .global smc_target_set1_7    
    .align 0x1000
    .rept 64
        nop
    .endr
smc_target_set1_7:
    nop
    jmp smc_target_set1_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set1
smc_prime_l1i_set1:
    jmp smc_target_set1_0
    smc_target_set1_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set1
smc_probe_l1i_set1:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set1_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set1_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set1_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set1_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set1_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set1_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set1_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set1_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set2_0    
    .align 0x1000
    .rept 128
        nop
    .endr      
smc_target_set2_0:
    nop
    jmp smc_target_set2_1
    
        .global smc_target_set2_1    
    .align 0x1000
    .rept 128
        nop
    .endr      
smc_target_set2_1:
    nop
    jmp smc_target_set2_2
    
        .global smc_target_set2_2    
    .align 0x1000
    .rept 128
        nop
    .endr      
smc_target_set2_2:
    nop
    jmp smc_target_set2_3
    
        .global smc_target_set2_3    
    .align 0x1000
    .rept 128
        nop
    .endr      
smc_target_set2_3:
    nop
    jmp smc_target_set2_4
    
        .global smc_target_set2_4    
    .align 0x1000
    .rept 128
        nop
    .endr      
smc_target_set2_4:
    nop
    jmp smc_target_set2_5
    
        .global smc_target_set2_5    
    .align 0x1000
    .rept 128
        nop
    .endr      
smc_target_set2_5:
    nop
    jmp smc_target_set2_6
    
        .global smc_target_set2_6    
    .align 0x1000
    .rept 128
        nop
    .endr      
smc_target_set2_6:
    nop
    jmp smc_target_set2_7
    
        .global smc_target_set2_7    
    .align 0x1000
    .rept 128
        nop
    .endr
smc_target_set2_7:
    nop
    jmp smc_target_set2_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set2
smc_prime_l1i_set2:
    jmp smc_target_set2_0
    smc_target_set2_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set2
smc_probe_l1i_set2:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set2_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set2_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set2_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set2_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set2_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set2_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set2_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set2_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set3_0    
    .align 0x1000
    .rept 192
        nop
    .endr      
smc_target_set3_0:
    nop
    jmp smc_target_set3_1
    
        .global smc_target_set3_1    
    .align 0x1000
    .rept 192
        nop
    .endr      
smc_target_set3_1:
    nop
    jmp smc_target_set3_2
    
        .global smc_target_set3_2    
    .align 0x1000
    .rept 192
        nop
    .endr      
smc_target_set3_2:
    nop
    jmp smc_target_set3_3
    
        .global smc_target_set3_3    
    .align 0x1000
    .rept 192
        nop
    .endr      
smc_target_set3_3:
    nop
    jmp smc_target_set3_4
    
        .global smc_target_set3_4    
    .align 0x1000
    .rept 192
        nop
    .endr      
smc_target_set3_4:
    nop
    jmp smc_target_set3_5
    
        .global smc_target_set3_5    
    .align 0x1000
    .rept 192
        nop
    .endr      
smc_target_set3_5:
    nop
    jmp smc_target_set3_6
    
        .global smc_target_set3_6    
    .align 0x1000
    .rept 192
        nop
    .endr      
smc_target_set3_6:
    nop
    jmp smc_target_set3_7
    
        .global smc_target_set3_7    
    .align 0x1000
    .rept 192
        nop
    .endr
smc_target_set3_7:
    nop
    jmp smc_target_set3_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set3
smc_prime_l1i_set3:
    jmp smc_target_set3_0
    smc_target_set3_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set3
smc_probe_l1i_set3:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set3_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set3_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set3_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set3_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set3_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set3_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set3_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set3_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set4_0    
    .align 0x1000
    .rept 256
        nop
    .endr      
smc_target_set4_0:
    nop
    jmp smc_target_set4_1
    
        .global smc_target_set4_1    
    .align 0x1000
    .rept 256
        nop
    .endr      
smc_target_set4_1:
    nop
    jmp smc_target_set4_2
    
        .global smc_target_set4_2    
    .align 0x1000
    .rept 256
        nop
    .endr      
smc_target_set4_2:
    nop
    jmp smc_target_set4_3
    
        .global smc_target_set4_3    
    .align 0x1000
    .rept 256
        nop
    .endr      
smc_target_set4_3:
    nop
    jmp smc_target_set4_4
    
        .global smc_target_set4_4    
    .align 0x1000
    .rept 256
        nop
    .endr      
smc_target_set4_4:
    nop
    jmp smc_target_set4_5
    
        .global smc_target_set4_5    
    .align 0x1000
    .rept 256
        nop
    .endr      
smc_target_set4_5:
    nop
    jmp smc_target_set4_6
    
        .global smc_target_set4_6    
    .align 0x1000
    .rept 256
        nop
    .endr      
smc_target_set4_6:
    nop
    jmp smc_target_set4_7
    
        .global smc_target_set4_7    
    .align 0x1000
    .rept 256
        nop
    .endr
smc_target_set4_7:
    nop
    jmp smc_target_set4_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set4
smc_prime_l1i_set4:
    jmp smc_target_set4_0
    smc_target_set4_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set4
smc_probe_l1i_set4:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set4_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set4_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set4_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set4_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set4_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set4_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set4_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set4_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set5_0    
    .align 0x1000
    .rept 320
        nop
    .endr      
smc_target_set5_0:
    nop
    jmp smc_target_set5_1
    
        .global smc_target_set5_1    
    .align 0x1000
    .rept 320
        nop
    .endr      
smc_target_set5_1:
    nop
    jmp smc_target_set5_2
    
        .global smc_target_set5_2    
    .align 0x1000
    .rept 320
        nop
    .endr      
smc_target_set5_2:
    nop
    jmp smc_target_set5_3
    
        .global smc_target_set5_3    
    .align 0x1000
    .rept 320
        nop
    .endr      
smc_target_set5_3:
    nop
    jmp smc_target_set5_4
    
        .global smc_target_set5_4    
    .align 0x1000
    .rept 320
        nop
    .endr      
smc_target_set5_4:
    nop
    jmp smc_target_set5_5
    
        .global smc_target_set5_5    
    .align 0x1000
    .rept 320
        nop
    .endr      
smc_target_set5_5:
    nop
    jmp smc_target_set5_6
    
        .global smc_target_set5_6    
    .align 0x1000
    .rept 320
        nop
    .endr      
smc_target_set5_6:
    nop
    jmp smc_target_set5_7
    
        .global smc_target_set5_7    
    .align 0x1000
    .rept 320
        nop
    .endr
smc_target_set5_7:
    nop
    jmp smc_target_set5_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set5
smc_prime_l1i_set5:
    jmp smc_target_set5_0
    smc_target_set5_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set5
smc_probe_l1i_set5:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set5_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set5_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set5_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set5_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set5_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set5_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set5_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set5_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set6_0    
    .align 0x1000
    .rept 384
        nop
    .endr      
smc_target_set6_0:
    nop
    jmp smc_target_set6_1
    
        .global smc_target_set6_1    
    .align 0x1000
    .rept 384
        nop
    .endr      
smc_target_set6_1:
    nop
    jmp smc_target_set6_2
    
        .global smc_target_set6_2    
    .align 0x1000
    .rept 384
        nop
    .endr      
smc_target_set6_2:
    nop
    jmp smc_target_set6_3
    
        .global smc_target_set6_3    
    .align 0x1000
    .rept 384
        nop
    .endr      
smc_target_set6_3:
    nop
    jmp smc_target_set6_4
    
        .global smc_target_set6_4    
    .align 0x1000
    .rept 384
        nop
    .endr      
smc_target_set6_4:
    nop
    jmp smc_target_set6_5
    
        .global smc_target_set6_5    
    .align 0x1000
    .rept 384
        nop
    .endr      
smc_target_set6_5:
    nop
    jmp smc_target_set6_6
    
        .global smc_target_set6_6    
    .align 0x1000
    .rept 384
        nop
    .endr      
smc_target_set6_6:
    nop
    jmp smc_target_set6_7
    
        .global smc_target_set6_7    
    .align 0x1000
    .rept 384
        nop
    .endr
smc_target_set6_7:
    nop
    jmp smc_target_set6_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set6
smc_prime_l1i_set6:
    jmp smc_target_set6_0
    smc_target_set6_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set6
smc_probe_l1i_set6:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set6_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set6_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set6_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set6_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set6_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set6_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set6_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set6_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set7_0    
    .align 0x1000
    .rept 448
        nop
    .endr      
smc_target_set7_0:
    nop
    jmp smc_target_set7_1
    
        .global smc_target_set7_1    
    .align 0x1000
    .rept 448
        nop
    .endr      
smc_target_set7_1:
    nop
    jmp smc_target_set7_2
    
        .global smc_target_set7_2    
    .align 0x1000
    .rept 448
        nop
    .endr      
smc_target_set7_2:
    nop
    jmp smc_target_set7_3
    
        .global smc_target_set7_3    
    .align 0x1000
    .rept 448
        nop
    .endr      
smc_target_set7_3:
    nop
    jmp smc_target_set7_4
    
        .global smc_target_set7_4    
    .align 0x1000
    .rept 448
        nop
    .endr      
smc_target_set7_4:
    nop
    jmp smc_target_set7_5
    
        .global smc_target_set7_5    
    .align 0x1000
    .rept 448
        nop
    .endr      
smc_target_set7_5:
    nop
    jmp smc_target_set7_6
    
        .global smc_target_set7_6    
    .align 0x1000
    .rept 448
        nop
    .endr      
smc_target_set7_6:
    nop
    jmp smc_target_set7_7
    
        .global smc_target_set7_7    
    .align 0x1000
    .rept 448
        nop
    .endr
smc_target_set7_7:
    nop
    jmp smc_target_set7_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set7
smc_prime_l1i_set7:
    jmp smc_target_set7_0
    smc_target_set7_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set7
smc_probe_l1i_set7:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set7_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set7_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set7_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set7_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set7_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set7_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set7_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set7_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set8_0    
    .align 0x1000
    .rept 512
        nop
    .endr      
smc_target_set8_0:
    nop
    jmp smc_target_set8_1
    
        .global smc_target_set8_1    
    .align 0x1000
    .rept 512
        nop
    .endr      
smc_target_set8_1:
    nop
    jmp smc_target_set8_2
    
        .global smc_target_set8_2    
    .align 0x1000
    .rept 512
        nop
    .endr      
smc_target_set8_2:
    nop
    jmp smc_target_set8_3
    
        .global smc_target_set8_3    
    .align 0x1000
    .rept 512
        nop
    .endr      
smc_target_set8_3:
    nop
    jmp smc_target_set8_4
    
        .global smc_target_set8_4    
    .align 0x1000
    .rept 512
        nop
    .endr      
smc_target_set8_4:
    nop
    jmp smc_target_set8_5
    
        .global smc_target_set8_5    
    .align 0x1000
    .rept 512
        nop
    .endr      
smc_target_set8_5:
    nop
    jmp smc_target_set8_6
    
        .global smc_target_set8_6    
    .align 0x1000
    .rept 512
        nop
    .endr      
smc_target_set8_6:
    nop
    jmp smc_target_set8_7
    
        .global smc_target_set8_7    
    .align 0x1000
    .rept 512
        nop
    .endr
smc_target_set8_7:
    nop
    jmp smc_target_set8_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set8
smc_prime_l1i_set8:
    jmp smc_target_set8_0
    smc_target_set8_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set8
smc_probe_l1i_set8:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set8_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set8_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set8_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set8_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set8_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set8_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set8_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set8_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set9_0    
    .align 0x1000
    .rept 576
        nop
    .endr      
smc_target_set9_0:
    nop
    jmp smc_target_set9_1
    
        .global smc_target_set9_1    
    .align 0x1000
    .rept 576
        nop
    .endr      
smc_target_set9_1:
    nop
    jmp smc_target_set9_2
    
        .global smc_target_set9_2    
    .align 0x1000
    .rept 576
        nop
    .endr      
smc_target_set9_2:
    nop
    jmp smc_target_set9_3
    
        .global smc_target_set9_3    
    .align 0x1000
    .rept 576
        nop
    .endr      
smc_target_set9_3:
    nop
    jmp smc_target_set9_4
    
        .global smc_target_set9_4    
    .align 0x1000
    .rept 576
        nop
    .endr      
smc_target_set9_4:
    nop
    jmp smc_target_set9_5
    
        .global smc_target_set9_5    
    .align 0x1000
    .rept 576
        nop
    .endr      
smc_target_set9_5:
    nop
    jmp smc_target_set9_6
    
        .global smc_target_set9_6    
    .align 0x1000
    .rept 576
        nop
    .endr      
smc_target_set9_6:
    nop
    jmp smc_target_set9_7
    
        .global smc_target_set9_7    
    .align 0x1000
    .rept 576
        nop
    .endr
smc_target_set9_7:
    nop
    jmp smc_target_set9_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set9
smc_prime_l1i_set9:
    jmp smc_target_set9_0
    smc_target_set9_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set9
smc_probe_l1i_set9:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set9_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set9_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set9_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set9_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set9_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set9_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set9_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set9_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set10_0    
    .align 0x1000
    .rept 640
        nop
    .endr      
smc_target_set10_0:
    nop
    jmp smc_target_set10_1
    
        .global smc_target_set10_1    
    .align 0x1000
    .rept 640
        nop
    .endr      
smc_target_set10_1:
    nop
    jmp smc_target_set10_2
    
        .global smc_target_set10_2    
    .align 0x1000
    .rept 640
        nop
    .endr      
smc_target_set10_2:
    nop
    jmp smc_target_set10_3
    
        .global smc_target_set10_3    
    .align 0x1000
    .rept 640
        nop
    .endr      
smc_target_set10_3:
    nop
    jmp smc_target_set10_4
    
        .global smc_target_set10_4    
    .align 0x1000
    .rept 640
        nop
    .endr      
smc_target_set10_4:
    nop
    jmp smc_target_set10_5
    
        .global smc_target_set10_5    
    .align 0x1000
    .rept 640
        nop
    .endr      
smc_target_set10_5:
    nop
    jmp smc_target_set10_6
    
        .global smc_target_set10_6    
    .align 0x1000
    .rept 640
        nop
    .endr      
smc_target_set10_6:
    nop
    jmp smc_target_set10_7
    
        .global smc_target_set10_7    
    .align 0x1000
    .rept 640
        nop
    .endr
smc_target_set10_7:
    nop
    jmp smc_target_set10_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set10
smc_prime_l1i_set10:
    jmp smc_target_set10_0
    smc_target_set10_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set10
smc_probe_l1i_set10:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set10_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set10_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set10_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set10_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set10_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set10_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set10_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set10_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set11_0    
    .align 0x1000
    .rept 704
        nop
    .endr      
smc_target_set11_0:
    nop
    jmp smc_target_set11_1
    
        .global smc_target_set11_1    
    .align 0x1000
    .rept 704
        nop
    .endr      
smc_target_set11_1:
    nop
    jmp smc_target_set11_2
    
        .global smc_target_set11_2    
    .align 0x1000
    .rept 704
        nop
    .endr      
smc_target_set11_2:
    nop
    jmp smc_target_set11_3
    
        .global smc_target_set11_3    
    .align 0x1000
    .rept 704
        nop
    .endr      
smc_target_set11_3:
    nop
    jmp smc_target_set11_4
    
        .global smc_target_set11_4    
    .align 0x1000
    .rept 704
        nop
    .endr      
smc_target_set11_4:
    nop
    jmp smc_target_set11_5
    
        .global smc_target_set11_5    
    .align 0x1000
    .rept 704
        nop
    .endr      
smc_target_set11_5:
    nop
    jmp smc_target_set11_6
    
        .global smc_target_set11_6    
    .align 0x1000
    .rept 704
        nop
    .endr      
smc_target_set11_6:
    nop
    jmp smc_target_set11_7
    
        .global smc_target_set11_7    
    .align 0x1000
    .rept 704
        nop
    .endr
smc_target_set11_7:
    nop
    jmp smc_target_set11_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set11
smc_prime_l1i_set11:
    jmp smc_target_set11_0
    smc_target_set11_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set11
smc_probe_l1i_set11:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set11_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set11_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set11_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set11_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set11_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set11_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set11_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set11_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set12_0    
    .align 0x1000
    .rept 768
        nop
    .endr      
smc_target_set12_0:
    nop
    jmp smc_target_set12_1
    
        .global smc_target_set12_1    
    .align 0x1000
    .rept 768
        nop
    .endr      
smc_target_set12_1:
    nop
    jmp smc_target_set12_2
    
        .global smc_target_set12_2    
    .align 0x1000
    .rept 768
        nop
    .endr      
smc_target_set12_2:
    nop
    jmp smc_target_set12_3
    
        .global smc_target_set12_3    
    .align 0x1000
    .rept 768
        nop
    .endr      
smc_target_set12_3:
    nop
    jmp smc_target_set12_4
    
        .global smc_target_set12_4    
    .align 0x1000
    .rept 768
        nop
    .endr      
smc_target_set12_4:
    nop
    jmp smc_target_set12_5
    
        .global smc_target_set12_5    
    .align 0x1000
    .rept 768
        nop
    .endr      
smc_target_set12_5:
    nop
    jmp smc_target_set12_6
    
        .global smc_target_set12_6    
    .align 0x1000
    .rept 768
        nop
    .endr      
smc_target_set12_6:
    nop
    jmp smc_target_set12_7
    
        .global smc_target_set12_7    
    .align 0x1000
    .rept 768
        nop
    .endr
smc_target_set12_7:
    nop
    jmp smc_target_set12_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set12
smc_prime_l1i_set12:
    jmp smc_target_set12_0
    smc_target_set12_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set12
smc_probe_l1i_set12:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set12_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set12_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set12_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set12_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set12_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set12_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set12_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set12_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set13_0    
    .align 0x1000
    .rept 832
        nop
    .endr      
smc_target_set13_0:
    nop
    jmp smc_target_set13_1
    
        .global smc_target_set13_1    
    .align 0x1000
    .rept 832
        nop
    .endr      
smc_target_set13_1:
    nop
    jmp smc_target_set13_2
    
        .global smc_target_set13_2    
    .align 0x1000
    .rept 832
        nop
    .endr      
smc_target_set13_2:
    nop
    jmp smc_target_set13_3
    
        .global smc_target_set13_3    
    .align 0x1000
    .rept 832
        nop
    .endr      
smc_target_set13_3:
    nop
    jmp smc_target_set13_4
    
        .global smc_target_set13_4    
    .align 0x1000
    .rept 832
        nop
    .endr      
smc_target_set13_4:
    nop
    jmp smc_target_set13_5
    
        .global smc_target_set13_5    
    .align 0x1000
    .rept 832
        nop
    .endr      
smc_target_set13_5:
    nop
    jmp smc_target_set13_6
    
        .global smc_target_set13_6    
    .align 0x1000
    .rept 832
        nop
    .endr      
smc_target_set13_6:
    nop
    jmp smc_target_set13_7
    
        .global smc_target_set13_7    
    .align 0x1000
    .rept 832
        nop
    .endr
smc_target_set13_7:
    nop
    jmp smc_target_set13_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set13
smc_prime_l1i_set13:
    jmp smc_target_set13_0
    smc_target_set13_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set13
smc_probe_l1i_set13:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set13_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set13_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set13_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set13_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set13_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set13_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set13_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set13_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set14_0    
    .align 0x1000
    .rept 896
        nop
    .endr      
smc_target_set14_0:
    nop
    jmp smc_target_set14_1
    
        .global smc_target_set14_1    
    .align 0x1000
    .rept 896
        nop
    .endr      
smc_target_set14_1:
    nop
    jmp smc_target_set14_2
    
        .global smc_target_set14_2    
    .align 0x1000
    .rept 896
        nop
    .endr      
smc_target_set14_2:
    nop
    jmp smc_target_set14_3
    
        .global smc_target_set14_3    
    .align 0x1000
    .rept 896
        nop
    .endr      
smc_target_set14_3:
    nop
    jmp smc_target_set14_4
    
        .global smc_target_set14_4    
    .align 0x1000
    .rept 896
        nop
    .endr      
smc_target_set14_4:
    nop
    jmp smc_target_set14_5
    
        .global smc_target_set14_5    
    .align 0x1000
    .rept 896
        nop
    .endr      
smc_target_set14_5:
    nop
    jmp smc_target_set14_6
    
        .global smc_target_set14_6    
    .align 0x1000
    .rept 896
        nop
    .endr      
smc_target_set14_6:
    nop
    jmp smc_target_set14_7
    
        .global smc_target_set14_7    
    .align 0x1000
    .rept 896
        nop
    .endr
smc_target_set14_7:
    nop
    jmp smc_target_set14_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set14
smc_prime_l1i_set14:
    jmp smc_target_set14_0
    smc_target_set14_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set14
smc_probe_l1i_set14:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set14_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set14_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set14_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set14_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set14_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set14_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set14_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set14_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set15_0    
    .align 0x1000
    .rept 960
        nop
    .endr      
smc_target_set15_0:
    nop
    jmp smc_target_set15_1
    
        .global smc_target_set15_1    
    .align 0x1000
    .rept 960
        nop
    .endr      
smc_target_set15_1:
    nop
    jmp smc_target_set15_2
    
        .global smc_target_set15_2    
    .align 0x1000
    .rept 960
        nop
    .endr      
smc_target_set15_2:
    nop
    jmp smc_target_set15_3
    
        .global smc_target_set15_3    
    .align 0x1000
    .rept 960
        nop
    .endr      
smc_target_set15_3:
    nop
    jmp smc_target_set15_4
    
        .global smc_target_set15_4    
    .align 0x1000
    .rept 960
        nop
    .endr      
smc_target_set15_4:
    nop
    jmp smc_target_set15_5
    
        .global smc_target_set15_5    
    .align 0x1000
    .rept 960
        nop
    .endr      
smc_target_set15_5:
    nop
    jmp smc_target_set15_6
    
        .global smc_target_set15_6    
    .align 0x1000
    .rept 960
        nop
    .endr      
smc_target_set15_6:
    nop
    jmp smc_target_set15_7
    
        .global smc_target_set15_7    
    .align 0x1000
    .rept 960
        nop
    .endr
smc_target_set15_7:
    nop
    jmp smc_target_set15_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set15
smc_prime_l1i_set15:
    jmp smc_target_set15_0
    smc_target_set15_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set15
smc_probe_l1i_set15:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set15_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set15_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set15_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set15_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set15_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set15_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set15_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set15_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set16_0    
    .align 0x1000
    .rept 1024
        nop
    .endr      
smc_target_set16_0:
    nop
    jmp smc_target_set16_1
    
        .global smc_target_set16_1    
    .align 0x1000
    .rept 1024
        nop
    .endr      
smc_target_set16_1:
    nop
    jmp smc_target_set16_2
    
        .global smc_target_set16_2    
    .align 0x1000
    .rept 1024
        nop
    .endr      
smc_target_set16_2:
    nop
    jmp smc_target_set16_3
    
        .global smc_target_set16_3    
    .align 0x1000
    .rept 1024
        nop
    .endr      
smc_target_set16_3:
    nop
    jmp smc_target_set16_4
    
        .global smc_target_set16_4    
    .align 0x1000
    .rept 1024
        nop
    .endr      
smc_target_set16_4:
    nop
    jmp smc_target_set16_5
    
        .global smc_target_set16_5    
    .align 0x1000
    .rept 1024
        nop
    .endr      
smc_target_set16_5:
    nop
    jmp smc_target_set16_6
    
        .global smc_target_set16_6    
    .align 0x1000
    .rept 1024
        nop
    .endr      
smc_target_set16_6:
    nop
    jmp smc_target_set16_7
    
        .global smc_target_set16_7    
    .align 0x1000
    .rept 1024
        nop
    .endr
smc_target_set16_7:
    nop
    jmp smc_target_set16_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set16
smc_prime_l1i_set16:
    jmp smc_target_set16_0
    smc_target_set16_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set16
smc_probe_l1i_set16:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set16_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set16_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set16_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set16_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set16_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set16_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set16_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set16_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set17_0    
    .align 0x1000
    .rept 1088
        nop
    .endr      
smc_target_set17_0:
    nop
    jmp smc_target_set17_1
    
        .global smc_target_set17_1    
    .align 0x1000
    .rept 1088
        nop
    .endr      
smc_target_set17_1:
    nop
    jmp smc_target_set17_2
    
        .global smc_target_set17_2    
    .align 0x1000
    .rept 1088
        nop
    .endr      
smc_target_set17_2:
    nop
    jmp smc_target_set17_3
    
        .global smc_target_set17_3    
    .align 0x1000
    .rept 1088
        nop
    .endr      
smc_target_set17_3:
    nop
    jmp smc_target_set17_4
    
        .global smc_target_set17_4    
    .align 0x1000
    .rept 1088
        nop
    .endr      
smc_target_set17_4:
    nop
    jmp smc_target_set17_5
    
        .global smc_target_set17_5    
    .align 0x1000
    .rept 1088
        nop
    .endr      
smc_target_set17_5:
    nop
    jmp smc_target_set17_6
    
        .global smc_target_set17_6    
    .align 0x1000
    .rept 1088
        nop
    .endr      
smc_target_set17_6:
    nop
    jmp smc_target_set17_7
    
        .global smc_target_set17_7    
    .align 0x1000
    .rept 1088
        nop
    .endr
smc_target_set17_7:
    nop
    jmp smc_target_set17_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set17
smc_prime_l1i_set17:
    jmp smc_target_set17_0
    smc_target_set17_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set17
smc_probe_l1i_set17:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set17_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set17_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set17_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set17_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set17_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set17_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set17_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set17_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set18_0    
    .align 0x1000
    .rept 1152
        nop
    .endr      
smc_target_set18_0:
    nop
    jmp smc_target_set18_1
    
        .global smc_target_set18_1    
    .align 0x1000
    .rept 1152
        nop
    .endr      
smc_target_set18_1:
    nop
    jmp smc_target_set18_2
    
        .global smc_target_set18_2    
    .align 0x1000
    .rept 1152
        nop
    .endr      
smc_target_set18_2:
    nop
    jmp smc_target_set18_3
    
        .global smc_target_set18_3    
    .align 0x1000
    .rept 1152
        nop
    .endr      
smc_target_set18_3:
    nop
    jmp smc_target_set18_4
    
        .global smc_target_set18_4    
    .align 0x1000
    .rept 1152
        nop
    .endr      
smc_target_set18_4:
    nop
    jmp smc_target_set18_5
    
        .global smc_target_set18_5    
    .align 0x1000
    .rept 1152
        nop
    .endr      
smc_target_set18_5:
    nop
    jmp smc_target_set18_6
    
        .global smc_target_set18_6    
    .align 0x1000
    .rept 1152
        nop
    .endr      
smc_target_set18_6:
    nop
    jmp smc_target_set18_7
    
        .global smc_target_set18_7    
    .align 0x1000
    .rept 1152
        nop
    .endr
smc_target_set18_7:
    nop
    jmp smc_target_set18_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set18
smc_prime_l1i_set18:
    jmp smc_target_set18_0
    smc_target_set18_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set18
smc_probe_l1i_set18:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set18_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set18_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set18_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set18_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set18_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set18_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set18_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set18_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set19_0    
    .align 0x1000
    .rept 1216
        nop
    .endr      
smc_target_set19_0:
    nop
    jmp smc_target_set19_1
    
        .global smc_target_set19_1    
    .align 0x1000
    .rept 1216
        nop
    .endr      
smc_target_set19_1:
    nop
    jmp smc_target_set19_2
    
        .global smc_target_set19_2    
    .align 0x1000
    .rept 1216
        nop
    .endr      
smc_target_set19_2:
    nop
    jmp smc_target_set19_3
    
        .global smc_target_set19_3    
    .align 0x1000
    .rept 1216
        nop
    .endr      
smc_target_set19_3:
    nop
    jmp smc_target_set19_4
    
        .global smc_target_set19_4    
    .align 0x1000
    .rept 1216
        nop
    .endr      
smc_target_set19_4:
    nop
    jmp smc_target_set19_5
    
        .global smc_target_set19_5    
    .align 0x1000
    .rept 1216
        nop
    .endr      
smc_target_set19_5:
    nop
    jmp smc_target_set19_6
    
        .global smc_target_set19_6    
    .align 0x1000
    .rept 1216
        nop
    .endr      
smc_target_set19_6:
    nop
    jmp smc_target_set19_7
    
        .global smc_target_set19_7    
    .align 0x1000
    .rept 1216
        nop
    .endr
smc_target_set19_7:
    nop
    jmp smc_target_set19_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set19
smc_prime_l1i_set19:
    jmp smc_target_set19_0
    smc_target_set19_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set19
smc_probe_l1i_set19:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set19_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set19_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set19_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set19_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set19_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set19_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set19_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set19_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set20_0    
    .align 0x1000
    .rept 1280
        nop
    .endr      
smc_target_set20_0:
    nop
    jmp smc_target_set20_1
    
        .global smc_target_set20_1    
    .align 0x1000
    .rept 1280
        nop
    .endr      
smc_target_set20_1:
    nop
    jmp smc_target_set20_2
    
        .global smc_target_set20_2    
    .align 0x1000
    .rept 1280
        nop
    .endr      
smc_target_set20_2:
    nop
    jmp smc_target_set20_3
    
        .global smc_target_set20_3    
    .align 0x1000
    .rept 1280
        nop
    .endr      
smc_target_set20_3:
    nop
    jmp smc_target_set20_4
    
        .global smc_target_set20_4    
    .align 0x1000
    .rept 1280
        nop
    .endr      
smc_target_set20_4:
    nop
    jmp smc_target_set20_5
    
        .global smc_target_set20_5    
    .align 0x1000
    .rept 1280
        nop
    .endr      
smc_target_set20_5:
    nop
    jmp smc_target_set20_6
    
        .global smc_target_set20_6    
    .align 0x1000
    .rept 1280
        nop
    .endr      
smc_target_set20_6:
    nop
    jmp smc_target_set20_7
    
        .global smc_target_set20_7    
    .align 0x1000
    .rept 1280
        nop
    .endr
smc_target_set20_7:
    nop
    jmp smc_target_set20_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set20
smc_prime_l1i_set20:
    jmp smc_target_set20_0
    smc_target_set20_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set20
smc_probe_l1i_set20:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set20_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set20_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set20_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set20_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set20_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set20_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set20_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set20_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set21_0    
    .align 0x1000
    .rept 1344
        nop
    .endr      
smc_target_set21_0:
    nop
    jmp smc_target_set21_1
    
        .global smc_target_set21_1    
    .align 0x1000
    .rept 1344
        nop
    .endr      
smc_target_set21_1:
    nop
    jmp smc_target_set21_2
    
        .global smc_target_set21_2    
    .align 0x1000
    .rept 1344
        nop
    .endr      
smc_target_set21_2:
    nop
    jmp smc_target_set21_3
    
        .global smc_target_set21_3    
    .align 0x1000
    .rept 1344
        nop
    .endr      
smc_target_set21_3:
    nop
    jmp smc_target_set21_4
    
        .global smc_target_set21_4    
    .align 0x1000
    .rept 1344
        nop
    .endr      
smc_target_set21_4:
    nop
    jmp smc_target_set21_5
    
        .global smc_target_set21_5    
    .align 0x1000
    .rept 1344
        nop
    .endr      
smc_target_set21_5:
    nop
    jmp smc_target_set21_6
    
        .global smc_target_set21_6    
    .align 0x1000
    .rept 1344
        nop
    .endr      
smc_target_set21_6:
    nop
    jmp smc_target_set21_7
    
        .global smc_target_set21_7    
    .align 0x1000
    .rept 1344
        nop
    .endr
smc_target_set21_7:
    nop
    jmp smc_target_set21_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set21
smc_prime_l1i_set21:
    jmp smc_target_set21_0
    smc_target_set21_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set21
smc_probe_l1i_set21:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set21_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set21_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set21_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set21_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set21_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set21_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set21_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set21_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set22_0    
    .align 0x1000
    .rept 1408
        nop
    .endr      
smc_target_set22_0:
    nop
    jmp smc_target_set22_1
    
        .global smc_target_set22_1    
    .align 0x1000
    .rept 1408
        nop
    .endr      
smc_target_set22_1:
    nop
    jmp smc_target_set22_2
    
        .global smc_target_set22_2    
    .align 0x1000
    .rept 1408
        nop
    .endr      
smc_target_set22_2:
    nop
    jmp smc_target_set22_3
    
        .global smc_target_set22_3    
    .align 0x1000
    .rept 1408
        nop
    .endr      
smc_target_set22_3:
    nop
    jmp smc_target_set22_4
    
        .global smc_target_set22_4    
    .align 0x1000
    .rept 1408
        nop
    .endr      
smc_target_set22_4:
    nop
    jmp smc_target_set22_5
    
        .global smc_target_set22_5    
    .align 0x1000
    .rept 1408
        nop
    .endr      
smc_target_set22_5:
    nop
    jmp smc_target_set22_6
    
        .global smc_target_set22_6    
    .align 0x1000
    .rept 1408
        nop
    .endr      
smc_target_set22_6:
    nop
    jmp smc_target_set22_7
    
        .global smc_target_set22_7    
    .align 0x1000
    .rept 1408
        nop
    .endr
smc_target_set22_7:
    nop
    jmp smc_target_set22_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set22
smc_prime_l1i_set22:
    jmp smc_target_set22_0
    smc_target_set22_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set22
smc_probe_l1i_set22:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set22_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set22_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set22_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set22_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set22_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set22_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set22_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set22_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set23_0    
    .align 0x1000
    .rept 1472
        nop
    .endr      
smc_target_set23_0:
    nop
    jmp smc_target_set23_1
    
        .global smc_target_set23_1    
    .align 0x1000
    .rept 1472
        nop
    .endr      
smc_target_set23_1:
    nop
    jmp smc_target_set23_2
    
        .global smc_target_set23_2    
    .align 0x1000
    .rept 1472
        nop
    .endr      
smc_target_set23_2:
    nop
    jmp smc_target_set23_3
    
        .global smc_target_set23_3    
    .align 0x1000
    .rept 1472
        nop
    .endr      
smc_target_set23_3:
    nop
    jmp smc_target_set23_4
    
        .global smc_target_set23_4    
    .align 0x1000
    .rept 1472
        nop
    .endr      
smc_target_set23_4:
    nop
    jmp smc_target_set23_5
    
        .global smc_target_set23_5    
    .align 0x1000
    .rept 1472
        nop
    .endr      
smc_target_set23_5:
    nop
    jmp smc_target_set23_6
    
        .global smc_target_set23_6    
    .align 0x1000
    .rept 1472
        nop
    .endr      
smc_target_set23_6:
    nop
    jmp smc_target_set23_7
    
        .global smc_target_set23_7    
    .align 0x1000
    .rept 1472
        nop
    .endr
smc_target_set23_7:
    nop
    jmp smc_target_set23_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set23
smc_prime_l1i_set23:
    jmp smc_target_set23_0
    smc_target_set23_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set23
smc_probe_l1i_set23:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set23_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set23_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set23_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set23_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set23_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set23_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set23_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set23_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set24_0    
    .align 0x1000
    .rept 1536
        nop
    .endr      
smc_target_set24_0:
    nop
    jmp smc_target_set24_1
    
        .global smc_target_set24_1    
    .align 0x1000
    .rept 1536
        nop
    .endr      
smc_target_set24_1:
    nop
    jmp smc_target_set24_2
    
        .global smc_target_set24_2    
    .align 0x1000
    .rept 1536
        nop
    .endr      
smc_target_set24_2:
    nop
    jmp smc_target_set24_3
    
        .global smc_target_set24_3    
    .align 0x1000
    .rept 1536
        nop
    .endr      
smc_target_set24_3:
    nop
    jmp smc_target_set24_4
    
        .global smc_target_set24_4    
    .align 0x1000
    .rept 1536
        nop
    .endr      
smc_target_set24_4:
    nop
    jmp smc_target_set24_5
    
        .global smc_target_set24_5    
    .align 0x1000
    .rept 1536
        nop
    .endr      
smc_target_set24_5:
    nop
    jmp smc_target_set24_6
    
        .global smc_target_set24_6    
    .align 0x1000
    .rept 1536
        nop
    .endr      
smc_target_set24_6:
    nop
    jmp smc_target_set24_7
    
        .global smc_target_set24_7    
    .align 0x1000
    .rept 1536
        nop
    .endr
smc_target_set24_7:
    nop
    jmp smc_target_set24_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set24
smc_prime_l1i_set24:
    jmp smc_target_set24_0
    smc_target_set24_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set24
smc_probe_l1i_set24:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set24_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set24_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set24_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set24_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set24_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set24_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set24_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set24_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set25_0    
    .align 0x1000
    .rept 1600
        nop
    .endr      
smc_target_set25_0:
    nop
    jmp smc_target_set25_1
    
        .global smc_target_set25_1    
    .align 0x1000
    .rept 1600
        nop
    .endr      
smc_target_set25_1:
    nop
    jmp smc_target_set25_2
    
        .global smc_target_set25_2    
    .align 0x1000
    .rept 1600
        nop
    .endr      
smc_target_set25_2:
    nop
    jmp smc_target_set25_3
    
        .global smc_target_set25_3    
    .align 0x1000
    .rept 1600
        nop
    .endr      
smc_target_set25_3:
    nop
    jmp smc_target_set25_4
    
        .global smc_target_set25_4    
    .align 0x1000
    .rept 1600
        nop
    .endr      
smc_target_set25_4:
    nop
    jmp smc_target_set25_5
    
        .global smc_target_set25_5    
    .align 0x1000
    .rept 1600
        nop
    .endr      
smc_target_set25_5:
    nop
    jmp smc_target_set25_6
    
        .global smc_target_set25_6    
    .align 0x1000
    .rept 1600
        nop
    .endr      
smc_target_set25_6:
    nop
    jmp smc_target_set25_7
    
        .global smc_target_set25_7    
    .align 0x1000
    .rept 1600
        nop
    .endr
smc_target_set25_7:
    nop
    jmp smc_target_set25_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set25
smc_prime_l1i_set25:
    jmp smc_target_set25_0
    smc_target_set25_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set25
smc_probe_l1i_set25:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set25_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set25_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set25_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set25_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set25_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set25_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set25_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set25_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set26_0    
    .align 0x1000
    .rept 1664
        nop
    .endr      
smc_target_set26_0:
    nop
    jmp smc_target_set26_1
    
        .global smc_target_set26_1    
    .align 0x1000
    .rept 1664
        nop
    .endr      
smc_target_set26_1:
    nop
    jmp smc_target_set26_2
    
        .global smc_target_set26_2    
    .align 0x1000
    .rept 1664
        nop
    .endr      
smc_target_set26_2:
    nop
    jmp smc_target_set26_3
    
        .global smc_target_set26_3    
    .align 0x1000
    .rept 1664
        nop
    .endr      
smc_target_set26_3:
    nop
    jmp smc_target_set26_4
    
        .global smc_target_set26_4    
    .align 0x1000
    .rept 1664
        nop
    .endr      
smc_target_set26_4:
    nop
    jmp smc_target_set26_5
    
        .global smc_target_set26_5    
    .align 0x1000
    .rept 1664
        nop
    .endr      
smc_target_set26_5:
    nop
    jmp smc_target_set26_6
    
        .global smc_target_set26_6    
    .align 0x1000
    .rept 1664
        nop
    .endr      
smc_target_set26_6:
    nop
    jmp smc_target_set26_7
    
        .global smc_target_set26_7    
    .align 0x1000
    .rept 1664
        nop
    .endr
smc_target_set26_7:
    nop
    jmp smc_target_set26_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set26
smc_prime_l1i_set26:
    jmp smc_target_set26_0
    smc_target_set26_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set26
smc_probe_l1i_set26:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set26_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set26_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set26_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set26_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set26_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set26_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set26_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set26_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set27_0    
    .align 0x1000
    .rept 1728
        nop
    .endr      
smc_target_set27_0:
    nop
    jmp smc_target_set27_1
    
        .global smc_target_set27_1    
    .align 0x1000
    .rept 1728
        nop
    .endr      
smc_target_set27_1:
    nop
    jmp smc_target_set27_2
    
        .global smc_target_set27_2    
    .align 0x1000
    .rept 1728
        nop
    .endr      
smc_target_set27_2:
    nop
    jmp smc_target_set27_3
    
        .global smc_target_set27_3    
    .align 0x1000
    .rept 1728
        nop
    .endr      
smc_target_set27_3:
    nop
    jmp smc_target_set27_4
    
        .global smc_target_set27_4    
    .align 0x1000
    .rept 1728
        nop
    .endr      
smc_target_set27_4:
    nop
    jmp smc_target_set27_5
    
        .global smc_target_set27_5    
    .align 0x1000
    .rept 1728
        nop
    .endr      
smc_target_set27_5:
    nop
    jmp smc_target_set27_6
    
        .global smc_target_set27_6    
    .align 0x1000
    .rept 1728
        nop
    .endr      
smc_target_set27_6:
    nop
    jmp smc_target_set27_7
    
        .global smc_target_set27_7    
    .align 0x1000
    .rept 1728
        nop
    .endr
smc_target_set27_7:
    nop
    jmp smc_target_set27_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set27
smc_prime_l1i_set27:
    jmp smc_target_set27_0
    smc_target_set27_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set27
smc_probe_l1i_set27:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set27_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set27_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set27_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set27_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set27_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set27_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set27_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set27_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set28_0    
    .align 0x1000
    .rept 1792
        nop
    .endr      
smc_target_set28_0:
    nop
    jmp smc_target_set28_1
    
        .global smc_target_set28_1    
    .align 0x1000
    .rept 1792
        nop
    .endr      
smc_target_set28_1:
    nop
    jmp smc_target_set28_2
    
        .global smc_target_set28_2    
    .align 0x1000
    .rept 1792
        nop
    .endr      
smc_target_set28_2:
    nop
    jmp smc_target_set28_3
    
        .global smc_target_set28_3    
    .align 0x1000
    .rept 1792
        nop
    .endr      
smc_target_set28_3:
    nop
    jmp smc_target_set28_4
    
        .global smc_target_set28_4    
    .align 0x1000
    .rept 1792
        nop
    .endr      
smc_target_set28_4:
    nop
    jmp smc_target_set28_5
    
        .global smc_target_set28_5    
    .align 0x1000
    .rept 1792
        nop
    .endr      
smc_target_set28_5:
    nop
    jmp smc_target_set28_6
    
        .global smc_target_set28_6    
    .align 0x1000
    .rept 1792
        nop
    .endr      
smc_target_set28_6:
    nop
    jmp smc_target_set28_7
    
        .global smc_target_set28_7    
    .align 0x1000
    .rept 1792
        nop
    .endr
smc_target_set28_7:
    nop
    jmp smc_target_set28_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set28
smc_prime_l1i_set28:
    jmp smc_target_set28_0
    smc_target_set28_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set28
smc_probe_l1i_set28:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set28_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set28_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set28_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set28_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set28_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set28_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set28_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set28_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set29_0    
    .align 0x1000
    .rept 1856
        nop
    .endr      
smc_target_set29_0:
    nop
    jmp smc_target_set29_1
    
        .global smc_target_set29_1    
    .align 0x1000
    .rept 1856
        nop
    .endr      
smc_target_set29_1:
    nop
    jmp smc_target_set29_2
    
        .global smc_target_set29_2    
    .align 0x1000
    .rept 1856
        nop
    .endr      
smc_target_set29_2:
    nop
    jmp smc_target_set29_3
    
        .global smc_target_set29_3    
    .align 0x1000
    .rept 1856
        nop
    .endr      
smc_target_set29_3:
    nop
    jmp smc_target_set29_4
    
        .global smc_target_set29_4    
    .align 0x1000
    .rept 1856
        nop
    .endr      
smc_target_set29_4:
    nop
    jmp smc_target_set29_5
    
        .global smc_target_set29_5    
    .align 0x1000
    .rept 1856
        nop
    .endr      
smc_target_set29_5:
    nop
    jmp smc_target_set29_6
    
        .global smc_target_set29_6    
    .align 0x1000
    .rept 1856
        nop
    .endr      
smc_target_set29_6:
    nop
    jmp smc_target_set29_7
    
        .global smc_target_set29_7    
    .align 0x1000
    .rept 1856
        nop
    .endr
smc_target_set29_7:
    nop
    jmp smc_target_set29_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set29
smc_prime_l1i_set29:
    jmp smc_target_set29_0
    smc_target_set29_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set29
smc_probe_l1i_set29:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set29_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set29_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set29_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set29_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set29_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set29_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set29_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set29_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set30_0    
    .align 0x1000
    .rept 1920
        nop
    .endr      
smc_target_set30_0:
    nop
    jmp smc_target_set30_1
    
        .global smc_target_set30_1    
    .align 0x1000
    .rept 1920
        nop
    .endr      
smc_target_set30_1:
    nop
    jmp smc_target_set30_2
    
        .global smc_target_set30_2    
    .align 0x1000
    .rept 1920
        nop
    .endr      
smc_target_set30_2:
    nop
    jmp smc_target_set30_3
    
        .global smc_target_set30_3    
    .align 0x1000
    .rept 1920
        nop
    .endr      
smc_target_set30_3:
    nop
    jmp smc_target_set30_4
    
        .global smc_target_set30_4    
    .align 0x1000
    .rept 1920
        nop
    .endr      
smc_target_set30_4:
    nop
    jmp smc_target_set30_5
    
        .global smc_target_set30_5    
    .align 0x1000
    .rept 1920
        nop
    .endr      
smc_target_set30_5:
    nop
    jmp smc_target_set30_6
    
        .global smc_target_set30_6    
    .align 0x1000
    .rept 1920
        nop
    .endr      
smc_target_set30_6:
    nop
    jmp smc_target_set30_7
    
        .global smc_target_set30_7    
    .align 0x1000
    .rept 1920
        nop
    .endr
smc_target_set30_7:
    nop
    jmp smc_target_set30_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set30
smc_prime_l1i_set30:
    jmp smc_target_set30_0
    smc_target_set30_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set30
smc_probe_l1i_set30:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set30_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set30_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set30_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set30_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set30_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set30_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set30_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set30_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set31_0    
    .align 0x1000
    .rept 1984
        nop
    .endr      
smc_target_set31_0:
    nop
    jmp smc_target_set31_1
    
        .global smc_target_set31_1    
    .align 0x1000
    .rept 1984
        nop
    .endr      
smc_target_set31_1:
    nop
    jmp smc_target_set31_2
    
        .global smc_target_set31_2    
    .align 0x1000
    .rept 1984
        nop
    .endr      
smc_target_set31_2:
    nop
    jmp smc_target_set31_3
    
        .global smc_target_set31_3    
    .align 0x1000
    .rept 1984
        nop
    .endr      
smc_target_set31_3:
    nop
    jmp smc_target_set31_4
    
        .global smc_target_set31_4    
    .align 0x1000
    .rept 1984
        nop
    .endr      
smc_target_set31_4:
    nop
    jmp smc_target_set31_5
    
        .global smc_target_set31_5    
    .align 0x1000
    .rept 1984
        nop
    .endr      
smc_target_set31_5:
    nop
    jmp smc_target_set31_6
    
        .global smc_target_set31_6    
    .align 0x1000
    .rept 1984
        nop
    .endr      
smc_target_set31_6:
    nop
    jmp smc_target_set31_7
    
        .global smc_target_set31_7    
    .align 0x1000
    .rept 1984
        nop
    .endr
smc_target_set31_7:
    nop
    jmp smc_target_set31_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set31
smc_prime_l1i_set31:
    jmp smc_target_set31_0
    smc_target_set31_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set31
smc_probe_l1i_set31:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set31_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set31_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set31_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set31_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set31_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set31_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set31_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set31_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set32_0    
    .align 0x1000
    .rept 2048
        nop
    .endr      
smc_target_set32_0:
    nop
    jmp smc_target_set32_1
    
        .global smc_target_set32_1    
    .align 0x1000
    .rept 2048
        nop
    .endr      
smc_target_set32_1:
    nop
    jmp smc_target_set32_2
    
        .global smc_target_set32_2    
    .align 0x1000
    .rept 2048
        nop
    .endr      
smc_target_set32_2:
    nop
    jmp smc_target_set32_3
    
        .global smc_target_set32_3    
    .align 0x1000
    .rept 2048
        nop
    .endr      
smc_target_set32_3:
    nop
    jmp smc_target_set32_4
    
        .global smc_target_set32_4    
    .align 0x1000
    .rept 2048
        nop
    .endr      
smc_target_set32_4:
    nop
    jmp smc_target_set32_5
    
        .global smc_target_set32_5    
    .align 0x1000
    .rept 2048
        nop
    .endr      
smc_target_set32_5:
    nop
    jmp smc_target_set32_6
    
        .global smc_target_set32_6    
    .align 0x1000
    .rept 2048
        nop
    .endr      
smc_target_set32_6:
    nop
    jmp smc_target_set32_7
    
        .global smc_target_set32_7    
    .align 0x1000
    .rept 2048
        nop
    .endr
smc_target_set32_7:
    nop
    jmp smc_target_set32_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set32
smc_prime_l1i_set32:
    jmp smc_target_set32_0
    smc_target_set32_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set32
smc_probe_l1i_set32:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set32_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set32_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set32_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set32_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set32_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set32_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set32_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set32_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set33_0    
    .align 0x1000
    .rept 2112
        nop
    .endr      
smc_target_set33_0:
    nop
    jmp smc_target_set33_1
    
        .global smc_target_set33_1    
    .align 0x1000
    .rept 2112
        nop
    .endr      
smc_target_set33_1:
    nop
    jmp smc_target_set33_2
    
        .global smc_target_set33_2    
    .align 0x1000
    .rept 2112
        nop
    .endr      
smc_target_set33_2:
    nop
    jmp smc_target_set33_3
    
        .global smc_target_set33_3    
    .align 0x1000
    .rept 2112
        nop
    .endr      
smc_target_set33_3:
    nop
    jmp smc_target_set33_4
    
        .global smc_target_set33_4    
    .align 0x1000
    .rept 2112
        nop
    .endr      
smc_target_set33_4:
    nop
    jmp smc_target_set33_5
    
        .global smc_target_set33_5    
    .align 0x1000
    .rept 2112
        nop
    .endr      
smc_target_set33_5:
    nop
    jmp smc_target_set33_6
    
        .global smc_target_set33_6    
    .align 0x1000
    .rept 2112
        nop
    .endr      
smc_target_set33_6:
    nop
    jmp smc_target_set33_7
    
        .global smc_target_set33_7    
    .align 0x1000
    .rept 2112
        nop
    .endr
smc_target_set33_7:
    nop
    jmp smc_target_set33_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set33
smc_prime_l1i_set33:
    jmp smc_target_set33_0
    smc_target_set33_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set33
smc_probe_l1i_set33:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set33_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set33_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set33_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set33_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set33_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set33_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set33_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set33_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set34_0    
    .align 0x1000
    .rept 2176
        nop
    .endr      
smc_target_set34_0:
    nop
    jmp smc_target_set34_1
    
        .global smc_target_set34_1    
    .align 0x1000
    .rept 2176
        nop
    .endr      
smc_target_set34_1:
    nop
    jmp smc_target_set34_2
    
        .global smc_target_set34_2    
    .align 0x1000
    .rept 2176
        nop
    .endr      
smc_target_set34_2:
    nop
    jmp smc_target_set34_3
    
        .global smc_target_set34_3    
    .align 0x1000
    .rept 2176
        nop
    .endr      
smc_target_set34_3:
    nop
    jmp smc_target_set34_4
    
        .global smc_target_set34_4    
    .align 0x1000
    .rept 2176
        nop
    .endr      
smc_target_set34_4:
    nop
    jmp smc_target_set34_5
    
        .global smc_target_set34_5    
    .align 0x1000
    .rept 2176
        nop
    .endr      
smc_target_set34_5:
    nop
    jmp smc_target_set34_6
    
        .global smc_target_set34_6    
    .align 0x1000
    .rept 2176
        nop
    .endr      
smc_target_set34_6:
    nop
    jmp smc_target_set34_7
    
        .global smc_target_set34_7    
    .align 0x1000
    .rept 2176
        nop
    .endr
smc_target_set34_7:
    nop
    jmp smc_target_set34_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set34
smc_prime_l1i_set34:
    jmp smc_target_set34_0
    smc_target_set34_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set34
smc_probe_l1i_set34:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set34_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set34_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set34_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set34_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set34_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set34_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set34_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set34_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set35_0    
    .align 0x1000
    .rept 2240
        nop
    .endr      
smc_target_set35_0:
    nop
    jmp smc_target_set35_1
    
        .global smc_target_set35_1    
    .align 0x1000
    .rept 2240
        nop
    .endr      
smc_target_set35_1:
    nop
    jmp smc_target_set35_2
    
        .global smc_target_set35_2    
    .align 0x1000
    .rept 2240
        nop
    .endr      
smc_target_set35_2:
    nop
    jmp smc_target_set35_3
    
        .global smc_target_set35_3    
    .align 0x1000
    .rept 2240
        nop
    .endr      
smc_target_set35_3:
    nop
    jmp smc_target_set35_4
    
        .global smc_target_set35_4    
    .align 0x1000
    .rept 2240
        nop
    .endr      
smc_target_set35_4:
    nop
    jmp smc_target_set35_5
    
        .global smc_target_set35_5    
    .align 0x1000
    .rept 2240
        nop
    .endr      
smc_target_set35_5:
    nop
    jmp smc_target_set35_6
    
        .global smc_target_set35_6    
    .align 0x1000
    .rept 2240
        nop
    .endr      
smc_target_set35_6:
    nop
    jmp smc_target_set35_7
    
        .global smc_target_set35_7    
    .align 0x1000
    .rept 2240
        nop
    .endr
smc_target_set35_7:
    nop
    jmp smc_target_set35_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set35
smc_prime_l1i_set35:
    jmp smc_target_set35_0
    smc_target_set35_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set35
smc_probe_l1i_set35:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set35_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set35_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set35_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set35_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set35_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set35_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set35_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set35_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set36_0    
    .align 0x1000
    .rept 2304
        nop
    .endr      
smc_target_set36_0:
    nop
    jmp smc_target_set36_1
    
        .global smc_target_set36_1    
    .align 0x1000
    .rept 2304
        nop
    .endr      
smc_target_set36_1:
    nop
    jmp smc_target_set36_2
    
        .global smc_target_set36_2    
    .align 0x1000
    .rept 2304
        nop
    .endr      
smc_target_set36_2:
    nop
    jmp smc_target_set36_3
    
        .global smc_target_set36_3    
    .align 0x1000
    .rept 2304
        nop
    .endr      
smc_target_set36_3:
    nop
    jmp smc_target_set36_4
    
        .global smc_target_set36_4    
    .align 0x1000
    .rept 2304
        nop
    .endr      
smc_target_set36_4:
    nop
    jmp smc_target_set36_5
    
        .global smc_target_set36_5    
    .align 0x1000
    .rept 2304
        nop
    .endr      
smc_target_set36_5:
    nop
    jmp smc_target_set36_6
    
        .global smc_target_set36_6    
    .align 0x1000
    .rept 2304
        nop
    .endr      
smc_target_set36_6:
    nop
    jmp smc_target_set36_7
    
        .global smc_target_set36_7    
    .align 0x1000
    .rept 2304
        nop
    .endr
smc_target_set36_7:
    nop
    jmp smc_target_set36_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set36
smc_prime_l1i_set36:
    jmp smc_target_set36_0
    smc_target_set36_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set36
smc_probe_l1i_set36:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set36_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set36_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set36_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set36_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set36_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set36_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set36_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set36_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set37_0    
    .align 0x1000
    .rept 2368
        nop
    .endr      
smc_target_set37_0:
    nop
    jmp smc_target_set37_1
    
        .global smc_target_set37_1    
    .align 0x1000
    .rept 2368
        nop
    .endr      
smc_target_set37_1:
    nop
    jmp smc_target_set37_2
    
        .global smc_target_set37_2    
    .align 0x1000
    .rept 2368
        nop
    .endr      
smc_target_set37_2:
    nop
    jmp smc_target_set37_3
    
        .global smc_target_set37_3    
    .align 0x1000
    .rept 2368
        nop
    .endr      
smc_target_set37_3:
    nop
    jmp smc_target_set37_4
    
        .global smc_target_set37_4    
    .align 0x1000
    .rept 2368
        nop
    .endr      
smc_target_set37_4:
    nop
    jmp smc_target_set37_5
    
        .global smc_target_set37_5    
    .align 0x1000
    .rept 2368
        nop
    .endr      
smc_target_set37_5:
    nop
    jmp smc_target_set37_6
    
        .global smc_target_set37_6    
    .align 0x1000
    .rept 2368
        nop
    .endr      
smc_target_set37_6:
    nop
    jmp smc_target_set37_7
    
        .global smc_target_set37_7    
    .align 0x1000
    .rept 2368
        nop
    .endr
smc_target_set37_7:
    nop
    jmp smc_target_set37_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set37
smc_prime_l1i_set37:
    jmp smc_target_set37_0
    smc_target_set37_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set37
smc_probe_l1i_set37:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set37_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set37_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set37_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set37_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set37_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set37_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set37_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set37_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set38_0    
    .align 0x1000
    .rept 2432
        nop
    .endr      
smc_target_set38_0:
    nop
    jmp smc_target_set38_1
    
        .global smc_target_set38_1    
    .align 0x1000
    .rept 2432
        nop
    .endr      
smc_target_set38_1:
    nop
    jmp smc_target_set38_2
    
        .global smc_target_set38_2    
    .align 0x1000
    .rept 2432
        nop
    .endr      
smc_target_set38_2:
    nop
    jmp smc_target_set38_3
    
        .global smc_target_set38_3    
    .align 0x1000
    .rept 2432
        nop
    .endr      
smc_target_set38_3:
    nop
    jmp smc_target_set38_4
    
        .global smc_target_set38_4    
    .align 0x1000
    .rept 2432
        nop
    .endr      
smc_target_set38_4:
    nop
    jmp smc_target_set38_5
    
        .global smc_target_set38_5    
    .align 0x1000
    .rept 2432
        nop
    .endr      
smc_target_set38_5:
    nop
    jmp smc_target_set38_6
    
        .global smc_target_set38_6    
    .align 0x1000
    .rept 2432
        nop
    .endr      
smc_target_set38_6:
    nop
    jmp smc_target_set38_7
    
        .global smc_target_set38_7    
    .align 0x1000
    .rept 2432
        nop
    .endr
smc_target_set38_7:
    nop
    jmp smc_target_set38_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set38
smc_prime_l1i_set38:
    jmp smc_target_set38_0
    smc_target_set38_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set38
smc_probe_l1i_set38:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set38_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set38_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set38_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set38_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set38_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set38_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set38_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set38_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set39_0    
    .align 0x1000
    .rept 2496
        nop
    .endr      
smc_target_set39_0:
    nop
    jmp smc_target_set39_1
    
        .global smc_target_set39_1    
    .align 0x1000
    .rept 2496
        nop
    .endr      
smc_target_set39_1:
    nop
    jmp smc_target_set39_2
    
        .global smc_target_set39_2    
    .align 0x1000
    .rept 2496
        nop
    .endr      
smc_target_set39_2:
    nop
    jmp smc_target_set39_3
    
        .global smc_target_set39_3    
    .align 0x1000
    .rept 2496
        nop
    .endr      
smc_target_set39_3:
    nop
    jmp smc_target_set39_4
    
        .global smc_target_set39_4    
    .align 0x1000
    .rept 2496
        nop
    .endr      
smc_target_set39_4:
    nop
    jmp smc_target_set39_5
    
        .global smc_target_set39_5    
    .align 0x1000
    .rept 2496
        nop
    .endr      
smc_target_set39_5:
    nop
    jmp smc_target_set39_6
    
        .global smc_target_set39_6    
    .align 0x1000
    .rept 2496
        nop
    .endr      
smc_target_set39_6:
    nop
    jmp smc_target_set39_7
    
        .global smc_target_set39_7    
    .align 0x1000
    .rept 2496
        nop
    .endr
smc_target_set39_7:
    nop
    jmp smc_target_set39_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set39
smc_prime_l1i_set39:
    jmp smc_target_set39_0
    smc_target_set39_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set39
smc_probe_l1i_set39:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set39_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set39_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set39_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set39_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set39_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set39_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set39_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set39_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set40_0    
    .align 0x1000
    .rept 2560
        nop
    .endr      
smc_target_set40_0:
    nop
    jmp smc_target_set40_1
    
        .global smc_target_set40_1    
    .align 0x1000
    .rept 2560
        nop
    .endr      
smc_target_set40_1:
    nop
    jmp smc_target_set40_2
    
        .global smc_target_set40_2    
    .align 0x1000
    .rept 2560
        nop
    .endr      
smc_target_set40_2:
    nop
    jmp smc_target_set40_3
    
        .global smc_target_set40_3    
    .align 0x1000
    .rept 2560
        nop
    .endr      
smc_target_set40_3:
    nop
    jmp smc_target_set40_4
    
        .global smc_target_set40_4    
    .align 0x1000
    .rept 2560
        nop
    .endr      
smc_target_set40_4:
    nop
    jmp smc_target_set40_5
    
        .global smc_target_set40_5    
    .align 0x1000
    .rept 2560
        nop
    .endr      
smc_target_set40_5:
    nop
    jmp smc_target_set40_6
    
        .global smc_target_set40_6    
    .align 0x1000
    .rept 2560
        nop
    .endr      
smc_target_set40_6:
    nop
    jmp smc_target_set40_7
    
        .global smc_target_set40_7    
    .align 0x1000
    .rept 2560
        nop
    .endr
smc_target_set40_7:
    nop
    jmp smc_target_set40_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set40
smc_prime_l1i_set40:
    jmp smc_target_set40_0
    smc_target_set40_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set40
smc_probe_l1i_set40:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set40_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set40_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set40_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set40_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set40_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set40_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set40_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set40_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set41_0    
    .align 0x1000
    .rept 2624
        nop
    .endr      
smc_target_set41_0:
    nop
    jmp smc_target_set41_1
    
        .global smc_target_set41_1    
    .align 0x1000
    .rept 2624
        nop
    .endr      
smc_target_set41_1:
    nop
    jmp smc_target_set41_2
    
        .global smc_target_set41_2    
    .align 0x1000
    .rept 2624
        nop
    .endr      
smc_target_set41_2:
    nop
    jmp smc_target_set41_3
    
        .global smc_target_set41_3    
    .align 0x1000
    .rept 2624
        nop
    .endr      
smc_target_set41_3:
    nop
    jmp smc_target_set41_4
    
        .global smc_target_set41_4    
    .align 0x1000
    .rept 2624
        nop
    .endr      
smc_target_set41_4:
    nop
    jmp smc_target_set41_5
    
        .global smc_target_set41_5    
    .align 0x1000
    .rept 2624
        nop
    .endr      
smc_target_set41_5:
    nop
    jmp smc_target_set41_6
    
        .global smc_target_set41_6    
    .align 0x1000
    .rept 2624
        nop
    .endr      
smc_target_set41_6:
    nop
    jmp smc_target_set41_7
    
        .global smc_target_set41_7    
    .align 0x1000
    .rept 2624
        nop
    .endr
smc_target_set41_7:
    nop
    jmp smc_target_set41_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set41
smc_prime_l1i_set41:
    jmp smc_target_set41_0
    smc_target_set41_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set41
smc_probe_l1i_set41:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set41_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set41_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set41_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set41_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set41_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set41_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set41_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set41_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set42_0    
    .align 0x1000
    .rept 2688
        nop
    .endr      
smc_target_set42_0:
    nop
    jmp smc_target_set42_1
    
        .global smc_target_set42_1    
    .align 0x1000
    .rept 2688
        nop
    .endr      
smc_target_set42_1:
    nop
    jmp smc_target_set42_2
    
        .global smc_target_set42_2    
    .align 0x1000
    .rept 2688
        nop
    .endr      
smc_target_set42_2:
    nop
    jmp smc_target_set42_3
    
        .global smc_target_set42_3    
    .align 0x1000
    .rept 2688
        nop
    .endr      
smc_target_set42_3:
    nop
    jmp smc_target_set42_4
    
        .global smc_target_set42_4    
    .align 0x1000
    .rept 2688
        nop
    .endr      
smc_target_set42_4:
    nop
    jmp smc_target_set42_5
    
        .global smc_target_set42_5    
    .align 0x1000
    .rept 2688
        nop
    .endr      
smc_target_set42_5:
    nop
    jmp smc_target_set42_6
    
        .global smc_target_set42_6    
    .align 0x1000
    .rept 2688
        nop
    .endr      
smc_target_set42_6:
    nop
    jmp smc_target_set42_7
    
        .global smc_target_set42_7    
    .align 0x1000
    .rept 2688
        nop
    .endr
smc_target_set42_7:
    nop
    jmp smc_target_set42_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set42
smc_prime_l1i_set42:
    jmp smc_target_set42_0
    smc_target_set42_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set42
smc_probe_l1i_set42:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set42_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set42_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set42_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set42_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set42_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set42_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set42_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set42_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set43_0    
    .align 0x1000
    .rept 2752
        nop
    .endr      
smc_target_set43_0:
    nop
    jmp smc_target_set43_1
    
        .global smc_target_set43_1    
    .align 0x1000
    .rept 2752
        nop
    .endr      
smc_target_set43_1:
    nop
    jmp smc_target_set43_2
    
        .global smc_target_set43_2    
    .align 0x1000
    .rept 2752
        nop
    .endr      
smc_target_set43_2:
    nop
    jmp smc_target_set43_3
    
        .global smc_target_set43_3    
    .align 0x1000
    .rept 2752
        nop
    .endr      
smc_target_set43_3:
    nop
    jmp smc_target_set43_4
    
        .global smc_target_set43_4    
    .align 0x1000
    .rept 2752
        nop
    .endr      
smc_target_set43_4:
    nop
    jmp smc_target_set43_5
    
        .global smc_target_set43_5    
    .align 0x1000
    .rept 2752
        nop
    .endr      
smc_target_set43_5:
    nop
    jmp smc_target_set43_6
    
        .global smc_target_set43_6    
    .align 0x1000
    .rept 2752
        nop
    .endr      
smc_target_set43_6:
    nop
    jmp smc_target_set43_7
    
        .global smc_target_set43_7    
    .align 0x1000
    .rept 2752
        nop
    .endr
smc_target_set43_7:
    nop
    jmp smc_target_set43_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set43
smc_prime_l1i_set43:
    jmp smc_target_set43_0
    smc_target_set43_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set43
smc_probe_l1i_set43:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set43_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set43_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set43_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set43_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set43_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set43_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set43_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set43_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set44_0    
    .align 0x1000
    .rept 2816
        nop
    .endr      
smc_target_set44_0:
    nop
    jmp smc_target_set44_1
    
        .global smc_target_set44_1    
    .align 0x1000
    .rept 2816
        nop
    .endr      
smc_target_set44_1:
    nop
    jmp smc_target_set44_2
    
        .global smc_target_set44_2    
    .align 0x1000
    .rept 2816
        nop
    .endr      
smc_target_set44_2:
    nop
    jmp smc_target_set44_3
    
        .global smc_target_set44_3    
    .align 0x1000
    .rept 2816
        nop
    .endr      
smc_target_set44_3:
    nop
    jmp smc_target_set44_4
    
        .global smc_target_set44_4    
    .align 0x1000
    .rept 2816
        nop
    .endr      
smc_target_set44_4:
    nop
    jmp smc_target_set44_5
    
        .global smc_target_set44_5    
    .align 0x1000
    .rept 2816
        nop
    .endr      
smc_target_set44_5:
    nop
    jmp smc_target_set44_6
    
        .global smc_target_set44_6    
    .align 0x1000
    .rept 2816
        nop
    .endr      
smc_target_set44_6:
    nop
    jmp smc_target_set44_7
    
        .global smc_target_set44_7    
    .align 0x1000
    .rept 2816
        nop
    .endr
smc_target_set44_7:
    nop
    jmp smc_target_set44_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set44
smc_prime_l1i_set44:
    jmp smc_target_set44_0
    smc_target_set44_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set44
smc_probe_l1i_set44:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set44_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set44_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set44_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set44_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set44_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set44_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set44_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set44_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set45_0    
    .align 0x1000
    .rept 2880
        nop
    .endr      
smc_target_set45_0:
    nop
    jmp smc_target_set45_1
    
        .global smc_target_set45_1    
    .align 0x1000
    .rept 2880
        nop
    .endr      
smc_target_set45_1:
    nop
    jmp smc_target_set45_2
    
        .global smc_target_set45_2    
    .align 0x1000
    .rept 2880
        nop
    .endr      
smc_target_set45_2:
    nop
    jmp smc_target_set45_3
    
        .global smc_target_set45_3    
    .align 0x1000
    .rept 2880
        nop
    .endr      
smc_target_set45_3:
    nop
    jmp smc_target_set45_4
    
        .global smc_target_set45_4    
    .align 0x1000
    .rept 2880
        nop
    .endr      
smc_target_set45_4:
    nop
    jmp smc_target_set45_5
    
        .global smc_target_set45_5    
    .align 0x1000
    .rept 2880
        nop
    .endr      
smc_target_set45_5:
    nop
    jmp smc_target_set45_6
    
        .global smc_target_set45_6    
    .align 0x1000
    .rept 2880
        nop
    .endr      
smc_target_set45_6:
    nop
    jmp smc_target_set45_7
    
        .global smc_target_set45_7    
    .align 0x1000
    .rept 2880
        nop
    .endr
smc_target_set45_7:
    nop
    jmp smc_target_set45_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set45
smc_prime_l1i_set45:
    jmp smc_target_set45_0
    smc_target_set45_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set45
smc_probe_l1i_set45:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set45_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set45_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set45_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set45_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set45_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set45_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set45_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set45_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set46_0    
    .align 0x1000
    .rept 2944
        nop
    .endr      
smc_target_set46_0:
    nop
    jmp smc_target_set46_1
    
        .global smc_target_set46_1    
    .align 0x1000
    .rept 2944
        nop
    .endr      
smc_target_set46_1:
    nop
    jmp smc_target_set46_2
    
        .global smc_target_set46_2    
    .align 0x1000
    .rept 2944
        nop
    .endr      
smc_target_set46_2:
    nop
    jmp smc_target_set46_3
    
        .global smc_target_set46_3    
    .align 0x1000
    .rept 2944
        nop
    .endr      
smc_target_set46_3:
    nop
    jmp smc_target_set46_4
    
        .global smc_target_set46_4    
    .align 0x1000
    .rept 2944
        nop
    .endr      
smc_target_set46_4:
    nop
    jmp smc_target_set46_5
    
        .global smc_target_set46_5    
    .align 0x1000
    .rept 2944
        nop
    .endr      
smc_target_set46_5:
    nop
    jmp smc_target_set46_6
    
        .global smc_target_set46_6    
    .align 0x1000
    .rept 2944
        nop
    .endr      
smc_target_set46_6:
    nop
    jmp smc_target_set46_7
    
        .global smc_target_set46_7    
    .align 0x1000
    .rept 2944
        nop
    .endr
smc_target_set46_7:
    nop
    jmp smc_target_set46_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set46
smc_prime_l1i_set46:
    jmp smc_target_set46_0
    smc_target_set46_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set46
smc_probe_l1i_set46:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set46_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set46_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set46_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set46_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set46_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set46_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set46_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set46_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set47_0    
    .align 0x1000
    .rept 3008
        nop
    .endr      
smc_target_set47_0:
    nop
    jmp smc_target_set47_1
    
        .global smc_target_set47_1    
    .align 0x1000
    .rept 3008
        nop
    .endr      
smc_target_set47_1:
    nop
    jmp smc_target_set47_2
    
        .global smc_target_set47_2    
    .align 0x1000
    .rept 3008
        nop
    .endr      
smc_target_set47_2:
    nop
    jmp smc_target_set47_3
    
        .global smc_target_set47_3    
    .align 0x1000
    .rept 3008
        nop
    .endr      
smc_target_set47_3:
    nop
    jmp smc_target_set47_4
    
        .global smc_target_set47_4    
    .align 0x1000
    .rept 3008
        nop
    .endr      
smc_target_set47_4:
    nop
    jmp smc_target_set47_5
    
        .global smc_target_set47_5    
    .align 0x1000
    .rept 3008
        nop
    .endr      
smc_target_set47_5:
    nop
    jmp smc_target_set47_6
    
        .global smc_target_set47_6    
    .align 0x1000
    .rept 3008
        nop
    .endr      
smc_target_set47_6:
    nop
    jmp smc_target_set47_7
    
        .global smc_target_set47_7    
    .align 0x1000
    .rept 3008
        nop
    .endr
smc_target_set47_7:
    nop
    jmp smc_target_set47_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set47
smc_prime_l1i_set47:
    jmp smc_target_set47_0
    smc_target_set47_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set47
smc_probe_l1i_set47:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set47_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set47_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set47_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set47_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set47_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set47_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set47_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set47_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set48_0    
    .align 0x1000
    .rept 3072
        nop
    .endr      
smc_target_set48_0:
    nop
    jmp smc_target_set48_1
    
        .global smc_target_set48_1    
    .align 0x1000
    .rept 3072
        nop
    .endr      
smc_target_set48_1:
    nop
    jmp smc_target_set48_2
    
        .global smc_target_set48_2    
    .align 0x1000
    .rept 3072
        nop
    .endr      
smc_target_set48_2:
    nop
    jmp smc_target_set48_3
    
        .global smc_target_set48_3    
    .align 0x1000
    .rept 3072
        nop
    .endr      
smc_target_set48_3:
    nop
    jmp smc_target_set48_4
    
        .global smc_target_set48_4    
    .align 0x1000
    .rept 3072
        nop
    .endr      
smc_target_set48_4:
    nop
    jmp smc_target_set48_5
    
        .global smc_target_set48_5    
    .align 0x1000
    .rept 3072
        nop
    .endr      
smc_target_set48_5:
    nop
    jmp smc_target_set48_6
    
        .global smc_target_set48_6    
    .align 0x1000
    .rept 3072
        nop
    .endr      
smc_target_set48_6:
    nop
    jmp smc_target_set48_7
    
        .global smc_target_set48_7    
    .align 0x1000
    .rept 3072
        nop
    .endr
smc_target_set48_7:
    nop
    jmp smc_target_set48_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set48
smc_prime_l1i_set48:
    jmp smc_target_set48_0
    smc_target_set48_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set48
smc_probe_l1i_set48:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set48_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set48_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set48_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set48_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set48_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set48_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set48_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set48_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set49_0    
    .align 0x1000
    .rept 3136
        nop
    .endr      
smc_target_set49_0:
    nop
    jmp smc_target_set49_1
    
        .global smc_target_set49_1    
    .align 0x1000
    .rept 3136
        nop
    .endr      
smc_target_set49_1:
    nop
    jmp smc_target_set49_2
    
        .global smc_target_set49_2    
    .align 0x1000
    .rept 3136
        nop
    .endr      
smc_target_set49_2:
    nop
    jmp smc_target_set49_3
    
        .global smc_target_set49_3    
    .align 0x1000
    .rept 3136
        nop
    .endr      
smc_target_set49_3:
    nop
    jmp smc_target_set49_4
    
        .global smc_target_set49_4    
    .align 0x1000
    .rept 3136
        nop
    .endr      
smc_target_set49_4:
    nop
    jmp smc_target_set49_5
    
        .global smc_target_set49_5    
    .align 0x1000
    .rept 3136
        nop
    .endr      
smc_target_set49_5:
    nop
    jmp smc_target_set49_6
    
        .global smc_target_set49_6    
    .align 0x1000
    .rept 3136
        nop
    .endr      
smc_target_set49_6:
    nop
    jmp smc_target_set49_7
    
        .global smc_target_set49_7    
    .align 0x1000
    .rept 3136
        nop
    .endr
smc_target_set49_7:
    nop
    jmp smc_target_set49_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set49
smc_prime_l1i_set49:
    jmp smc_target_set49_0
    smc_target_set49_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set49
smc_probe_l1i_set49:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set49_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set49_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set49_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set49_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set49_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set49_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set49_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set49_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set50_0    
    .align 0x1000
    .rept 3200
        nop
    .endr      
smc_target_set50_0:
    nop
    jmp smc_target_set50_1
    
        .global smc_target_set50_1    
    .align 0x1000
    .rept 3200
        nop
    .endr      
smc_target_set50_1:
    nop
    jmp smc_target_set50_2
    
        .global smc_target_set50_2    
    .align 0x1000
    .rept 3200
        nop
    .endr      
smc_target_set50_2:
    nop
    jmp smc_target_set50_3
    
        .global smc_target_set50_3    
    .align 0x1000
    .rept 3200
        nop
    .endr      
smc_target_set50_3:
    nop
    jmp smc_target_set50_4
    
        .global smc_target_set50_4    
    .align 0x1000
    .rept 3200
        nop
    .endr      
smc_target_set50_4:
    nop
    jmp smc_target_set50_5
    
        .global smc_target_set50_5    
    .align 0x1000
    .rept 3200
        nop
    .endr      
smc_target_set50_5:
    nop
    jmp smc_target_set50_6
    
        .global smc_target_set50_6    
    .align 0x1000
    .rept 3200
        nop
    .endr      
smc_target_set50_6:
    nop
    jmp smc_target_set50_7
    
        .global smc_target_set50_7    
    .align 0x1000
    .rept 3200
        nop
    .endr
smc_target_set50_7:
    nop
    jmp smc_target_set50_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set50
smc_prime_l1i_set50:
    jmp smc_target_set50_0
    smc_target_set50_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set50
smc_probe_l1i_set50:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set50_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set50_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set50_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set50_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set50_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set50_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set50_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set50_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set51_0    
    .align 0x1000
    .rept 3264
        nop
    .endr      
smc_target_set51_0:
    nop
    jmp smc_target_set51_1
    
        .global smc_target_set51_1    
    .align 0x1000
    .rept 3264
        nop
    .endr      
smc_target_set51_1:
    nop
    jmp smc_target_set51_2
    
        .global smc_target_set51_2    
    .align 0x1000
    .rept 3264
        nop
    .endr      
smc_target_set51_2:
    nop
    jmp smc_target_set51_3
    
        .global smc_target_set51_3    
    .align 0x1000
    .rept 3264
        nop
    .endr      
smc_target_set51_3:
    nop
    jmp smc_target_set51_4
    
        .global smc_target_set51_4    
    .align 0x1000
    .rept 3264
        nop
    .endr      
smc_target_set51_4:
    nop
    jmp smc_target_set51_5
    
        .global smc_target_set51_5    
    .align 0x1000
    .rept 3264
        nop
    .endr      
smc_target_set51_5:
    nop
    jmp smc_target_set51_6
    
        .global smc_target_set51_6    
    .align 0x1000
    .rept 3264
        nop
    .endr      
smc_target_set51_6:
    nop
    jmp smc_target_set51_7
    
        .global smc_target_set51_7    
    .align 0x1000
    .rept 3264
        nop
    .endr
smc_target_set51_7:
    nop
    jmp smc_target_set51_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set51
smc_prime_l1i_set51:
    jmp smc_target_set51_0
    smc_target_set51_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set51
smc_probe_l1i_set51:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set51_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set51_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set51_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set51_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set51_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set51_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set51_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set51_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set52_0    
    .align 0x1000
    .rept 3328
        nop
    .endr      
smc_target_set52_0:
    nop
    jmp smc_target_set52_1
    
        .global smc_target_set52_1    
    .align 0x1000
    .rept 3328
        nop
    .endr      
smc_target_set52_1:
    nop
    jmp smc_target_set52_2
    
        .global smc_target_set52_2    
    .align 0x1000
    .rept 3328
        nop
    .endr      
smc_target_set52_2:
    nop
    jmp smc_target_set52_3
    
        .global smc_target_set52_3    
    .align 0x1000
    .rept 3328
        nop
    .endr      
smc_target_set52_3:
    nop
    jmp smc_target_set52_4
    
        .global smc_target_set52_4    
    .align 0x1000
    .rept 3328
        nop
    .endr      
smc_target_set52_4:
    nop
    jmp smc_target_set52_5
    
        .global smc_target_set52_5    
    .align 0x1000
    .rept 3328
        nop
    .endr      
smc_target_set52_5:
    nop
    jmp smc_target_set52_6
    
        .global smc_target_set52_6    
    .align 0x1000
    .rept 3328
        nop
    .endr      
smc_target_set52_6:
    nop
    jmp smc_target_set52_7
    
        .global smc_target_set52_7    
    .align 0x1000
    .rept 3328
        nop
    .endr
smc_target_set52_7:
    nop
    jmp smc_target_set52_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set52
smc_prime_l1i_set52:
    jmp smc_target_set52_0
    smc_target_set52_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set52
smc_probe_l1i_set52:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set52_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set52_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set52_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set52_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set52_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set52_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set52_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set52_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set53_0    
    .align 0x1000
    .rept 3392
        nop
    .endr      
smc_target_set53_0:
    nop
    jmp smc_target_set53_1
    
        .global smc_target_set53_1    
    .align 0x1000
    .rept 3392
        nop
    .endr      
smc_target_set53_1:
    nop
    jmp smc_target_set53_2
    
        .global smc_target_set53_2    
    .align 0x1000
    .rept 3392
        nop
    .endr      
smc_target_set53_2:
    nop
    jmp smc_target_set53_3
    
        .global smc_target_set53_3    
    .align 0x1000
    .rept 3392
        nop
    .endr      
smc_target_set53_3:
    nop
    jmp smc_target_set53_4
    
        .global smc_target_set53_4    
    .align 0x1000
    .rept 3392
        nop
    .endr      
smc_target_set53_4:
    nop
    jmp smc_target_set53_5
    
        .global smc_target_set53_5    
    .align 0x1000
    .rept 3392
        nop
    .endr      
smc_target_set53_5:
    nop
    jmp smc_target_set53_6
    
        .global smc_target_set53_6    
    .align 0x1000
    .rept 3392
        nop
    .endr      
smc_target_set53_6:
    nop
    jmp smc_target_set53_7
    
        .global smc_target_set53_7    
    .align 0x1000
    .rept 3392
        nop
    .endr
smc_target_set53_7:
    nop
    jmp smc_target_set53_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set53
smc_prime_l1i_set53:
    jmp smc_target_set53_0
    smc_target_set53_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set53
smc_probe_l1i_set53:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set53_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set53_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set53_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set53_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set53_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set53_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set53_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set53_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set54_0    
    .align 0x1000
    .rept 3456
        nop
    .endr      
smc_target_set54_0:
    nop
    jmp smc_target_set54_1
    
        .global smc_target_set54_1    
    .align 0x1000
    .rept 3456
        nop
    .endr      
smc_target_set54_1:
    nop
    jmp smc_target_set54_2
    
        .global smc_target_set54_2    
    .align 0x1000
    .rept 3456
        nop
    .endr      
smc_target_set54_2:
    nop
    jmp smc_target_set54_3
    
        .global smc_target_set54_3    
    .align 0x1000
    .rept 3456
        nop
    .endr      
smc_target_set54_3:
    nop
    jmp smc_target_set54_4
    
        .global smc_target_set54_4    
    .align 0x1000
    .rept 3456
        nop
    .endr      
smc_target_set54_4:
    nop
    jmp smc_target_set54_5
    
        .global smc_target_set54_5    
    .align 0x1000
    .rept 3456
        nop
    .endr      
smc_target_set54_5:
    nop
    jmp smc_target_set54_6
    
        .global smc_target_set54_6    
    .align 0x1000
    .rept 3456
        nop
    .endr      
smc_target_set54_6:
    nop
    jmp smc_target_set54_7
    
        .global smc_target_set54_7    
    .align 0x1000
    .rept 3456
        nop
    .endr
smc_target_set54_7:
    nop
    jmp smc_target_set54_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set54
smc_prime_l1i_set54:
    jmp smc_target_set54_0
    smc_target_set54_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set54
smc_probe_l1i_set54:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set54_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set54_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set54_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set54_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set54_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set54_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set54_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set54_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set55_0    
    .align 0x1000
    .rept 3520
        nop
    .endr      
smc_target_set55_0:
    nop
    jmp smc_target_set55_1
    
        .global smc_target_set55_1    
    .align 0x1000
    .rept 3520
        nop
    .endr      
smc_target_set55_1:
    nop
    jmp smc_target_set55_2
    
        .global smc_target_set55_2    
    .align 0x1000
    .rept 3520
        nop
    .endr      
smc_target_set55_2:
    nop
    jmp smc_target_set55_3
    
        .global smc_target_set55_3    
    .align 0x1000
    .rept 3520
        nop
    .endr      
smc_target_set55_3:
    nop
    jmp smc_target_set55_4
    
        .global smc_target_set55_4    
    .align 0x1000
    .rept 3520
        nop
    .endr      
smc_target_set55_4:
    nop
    jmp smc_target_set55_5
    
        .global smc_target_set55_5    
    .align 0x1000
    .rept 3520
        nop
    .endr      
smc_target_set55_5:
    nop
    jmp smc_target_set55_6
    
        .global smc_target_set55_6    
    .align 0x1000
    .rept 3520
        nop
    .endr      
smc_target_set55_6:
    nop
    jmp smc_target_set55_7
    
        .global smc_target_set55_7    
    .align 0x1000
    .rept 3520
        nop
    .endr
smc_target_set55_7:
    nop
    jmp smc_target_set55_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set55
smc_prime_l1i_set55:
    jmp smc_target_set55_0
    smc_target_set55_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set55
smc_probe_l1i_set55:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set55_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set55_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set55_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set55_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set55_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set55_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set55_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set55_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set56_0    
    .align 0x1000
    .rept 3584
        nop
    .endr      
smc_target_set56_0:
    nop
    jmp smc_target_set56_1
    
        .global smc_target_set56_1    
    .align 0x1000
    .rept 3584
        nop
    .endr      
smc_target_set56_1:
    nop
    jmp smc_target_set56_2
    
        .global smc_target_set56_2    
    .align 0x1000
    .rept 3584
        nop
    .endr      
smc_target_set56_2:
    nop
    jmp smc_target_set56_3
    
        .global smc_target_set56_3    
    .align 0x1000
    .rept 3584
        nop
    .endr      
smc_target_set56_3:
    nop
    jmp smc_target_set56_4
    
        .global smc_target_set56_4    
    .align 0x1000
    .rept 3584
        nop
    .endr      
smc_target_set56_4:
    nop
    jmp smc_target_set56_5
    
        .global smc_target_set56_5    
    .align 0x1000
    .rept 3584
        nop
    .endr      
smc_target_set56_5:
    nop
    jmp smc_target_set56_6
    
        .global smc_target_set56_6    
    .align 0x1000
    .rept 3584
        nop
    .endr      
smc_target_set56_6:
    nop
    jmp smc_target_set56_7
    
        .global smc_target_set56_7    
    .align 0x1000
    .rept 3584
        nop
    .endr
smc_target_set56_7:
    nop
    jmp smc_target_set56_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set56
smc_prime_l1i_set56:
    jmp smc_target_set56_0
    smc_target_set56_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set56
smc_probe_l1i_set56:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set56_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set56_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set56_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set56_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set56_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set56_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set56_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set56_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set57_0    
    .align 0x1000
    .rept 3648
        nop
    .endr      
smc_target_set57_0:
    nop
    jmp smc_target_set57_1
    
        .global smc_target_set57_1    
    .align 0x1000
    .rept 3648
        nop
    .endr      
smc_target_set57_1:
    nop
    jmp smc_target_set57_2
    
        .global smc_target_set57_2    
    .align 0x1000
    .rept 3648
        nop
    .endr      
smc_target_set57_2:
    nop
    jmp smc_target_set57_3
    
        .global smc_target_set57_3    
    .align 0x1000
    .rept 3648
        nop
    .endr      
smc_target_set57_3:
    nop
    jmp smc_target_set57_4
    
        .global smc_target_set57_4    
    .align 0x1000
    .rept 3648
        nop
    .endr      
smc_target_set57_4:
    nop
    jmp smc_target_set57_5
    
        .global smc_target_set57_5    
    .align 0x1000
    .rept 3648
        nop
    .endr      
smc_target_set57_5:
    nop
    jmp smc_target_set57_6
    
        .global smc_target_set57_6    
    .align 0x1000
    .rept 3648
        nop
    .endr      
smc_target_set57_6:
    nop
    jmp smc_target_set57_7
    
        .global smc_target_set57_7    
    .align 0x1000
    .rept 3648
        nop
    .endr
smc_target_set57_7:
    nop
    jmp smc_target_set57_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set57
smc_prime_l1i_set57:
    jmp smc_target_set57_0
    smc_target_set57_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set57
smc_probe_l1i_set57:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set57_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set57_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set57_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set57_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set57_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set57_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set57_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set57_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set58_0    
    .align 0x1000
    .rept 3712
        nop
    .endr      
smc_target_set58_0:
    nop
    jmp smc_target_set58_1
    
        .global smc_target_set58_1    
    .align 0x1000
    .rept 3712
        nop
    .endr      
smc_target_set58_1:
    nop
    jmp smc_target_set58_2
    
        .global smc_target_set58_2    
    .align 0x1000
    .rept 3712
        nop
    .endr      
smc_target_set58_2:
    nop
    jmp smc_target_set58_3
    
        .global smc_target_set58_3    
    .align 0x1000
    .rept 3712
        nop
    .endr      
smc_target_set58_3:
    nop
    jmp smc_target_set58_4
    
        .global smc_target_set58_4    
    .align 0x1000
    .rept 3712
        nop
    .endr      
smc_target_set58_4:
    nop
    jmp smc_target_set58_5
    
        .global smc_target_set58_5    
    .align 0x1000
    .rept 3712
        nop
    .endr      
smc_target_set58_5:
    nop
    jmp smc_target_set58_6
    
        .global smc_target_set58_6    
    .align 0x1000
    .rept 3712
        nop
    .endr      
smc_target_set58_6:
    nop
    jmp smc_target_set58_7
    
        .global smc_target_set58_7    
    .align 0x1000
    .rept 3712
        nop
    .endr
smc_target_set58_7:
    nop
    jmp smc_target_set58_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set58
smc_prime_l1i_set58:
    jmp smc_target_set58_0
    smc_target_set58_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set58
smc_probe_l1i_set58:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set58_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set58_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set58_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set58_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set58_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set58_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set58_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set58_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set59_0    
    .align 0x1000
    .rept 3776
        nop
    .endr      
smc_target_set59_0:
    nop
    jmp smc_target_set59_1
    
        .global smc_target_set59_1    
    .align 0x1000
    .rept 3776
        nop
    .endr      
smc_target_set59_1:
    nop
    jmp smc_target_set59_2
    
        .global smc_target_set59_2    
    .align 0x1000
    .rept 3776
        nop
    .endr      
smc_target_set59_2:
    nop
    jmp smc_target_set59_3
    
        .global smc_target_set59_3    
    .align 0x1000
    .rept 3776
        nop
    .endr      
smc_target_set59_3:
    nop
    jmp smc_target_set59_4
    
        .global smc_target_set59_4    
    .align 0x1000
    .rept 3776
        nop
    .endr      
smc_target_set59_4:
    nop
    jmp smc_target_set59_5
    
        .global smc_target_set59_5    
    .align 0x1000
    .rept 3776
        nop
    .endr      
smc_target_set59_5:
    nop
    jmp smc_target_set59_6
    
        .global smc_target_set59_6    
    .align 0x1000
    .rept 3776
        nop
    .endr      
smc_target_set59_6:
    nop
    jmp smc_target_set59_7
    
        .global smc_target_set59_7    
    .align 0x1000
    .rept 3776
        nop
    .endr
smc_target_set59_7:
    nop
    jmp smc_target_set59_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set59
smc_prime_l1i_set59:
    jmp smc_target_set59_0
    smc_target_set59_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set59
smc_probe_l1i_set59:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set59_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set59_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set59_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set59_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set59_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set59_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set59_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set59_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set60_0    
    .align 0x1000
    .rept 3840
        nop
    .endr      
smc_target_set60_0:
    nop
    jmp smc_target_set60_1
    
        .global smc_target_set60_1    
    .align 0x1000
    .rept 3840
        nop
    .endr      
smc_target_set60_1:
    nop
    jmp smc_target_set60_2
    
        .global smc_target_set60_2    
    .align 0x1000
    .rept 3840
        nop
    .endr      
smc_target_set60_2:
    nop
    jmp smc_target_set60_3
    
        .global smc_target_set60_3    
    .align 0x1000
    .rept 3840
        nop
    .endr      
smc_target_set60_3:
    nop
    jmp smc_target_set60_4
    
        .global smc_target_set60_4    
    .align 0x1000
    .rept 3840
        nop
    .endr      
smc_target_set60_4:
    nop
    jmp smc_target_set60_5
    
        .global smc_target_set60_5    
    .align 0x1000
    .rept 3840
        nop
    .endr      
smc_target_set60_5:
    nop
    jmp smc_target_set60_6
    
        .global smc_target_set60_6    
    .align 0x1000
    .rept 3840
        nop
    .endr      
smc_target_set60_6:
    nop
    jmp smc_target_set60_7
    
        .global smc_target_set60_7    
    .align 0x1000
    .rept 3840
        nop
    .endr
smc_target_set60_7:
    nop
    jmp smc_target_set60_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set60
smc_prime_l1i_set60:
    jmp smc_target_set60_0
    smc_target_set60_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set60
smc_probe_l1i_set60:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set60_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set60_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set60_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set60_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set60_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set60_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set60_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set60_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set61_0    
    .align 0x1000
    .rept 3904
        nop
    .endr      
smc_target_set61_0:
    nop
    jmp smc_target_set61_1
    
        .global smc_target_set61_1    
    .align 0x1000
    .rept 3904
        nop
    .endr      
smc_target_set61_1:
    nop
    jmp smc_target_set61_2
    
        .global smc_target_set61_2    
    .align 0x1000
    .rept 3904
        nop
    .endr      
smc_target_set61_2:
    nop
    jmp smc_target_set61_3
    
        .global smc_target_set61_3    
    .align 0x1000
    .rept 3904
        nop
    .endr      
smc_target_set61_3:
    nop
    jmp smc_target_set61_4
    
        .global smc_target_set61_4    
    .align 0x1000
    .rept 3904
        nop
    .endr      
smc_target_set61_4:
    nop
    jmp smc_target_set61_5
    
        .global smc_target_set61_5    
    .align 0x1000
    .rept 3904
        nop
    .endr      
smc_target_set61_5:
    nop
    jmp smc_target_set61_6
    
        .global smc_target_set61_6    
    .align 0x1000
    .rept 3904
        nop
    .endr      
smc_target_set61_6:
    nop
    jmp smc_target_set61_7
    
        .global smc_target_set61_7    
    .align 0x1000
    .rept 3904
        nop
    .endr
smc_target_set61_7:
    nop
    jmp smc_target_set61_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set61
smc_prime_l1i_set61:
    jmp smc_target_set61_0
    smc_target_set61_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set61
smc_probe_l1i_set61:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set61_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set61_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set61_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set61_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set61_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set61_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set61_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set61_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set62_0    
    .align 0x1000
    .rept 3968
        nop
    .endr      
smc_target_set62_0:
    nop
    jmp smc_target_set62_1
    
        .global smc_target_set62_1    
    .align 0x1000
    .rept 3968
        nop
    .endr      
smc_target_set62_1:
    nop
    jmp smc_target_set62_2
    
        .global smc_target_set62_2    
    .align 0x1000
    .rept 3968
        nop
    .endr      
smc_target_set62_2:
    nop
    jmp smc_target_set62_3
    
        .global smc_target_set62_3    
    .align 0x1000
    .rept 3968
        nop
    .endr      
smc_target_set62_3:
    nop
    jmp smc_target_set62_4
    
        .global smc_target_set62_4    
    .align 0x1000
    .rept 3968
        nop
    .endr      
smc_target_set62_4:
    nop
    jmp smc_target_set62_5
    
        .global smc_target_set62_5    
    .align 0x1000
    .rept 3968
        nop
    .endr      
smc_target_set62_5:
    nop
    jmp smc_target_set62_6
    
        .global smc_target_set62_6    
    .align 0x1000
    .rept 3968
        nop
    .endr      
smc_target_set62_6:
    nop
    jmp smc_target_set62_7
    
        .global smc_target_set62_7    
    .align 0x1000
    .rept 3968
        nop
    .endr
smc_target_set62_7:
    nop
    jmp smc_target_set62_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set62
smc_prime_l1i_set62:
    jmp smc_target_set62_0
    smc_target_set62_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set62
smc_probe_l1i_set62:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set62_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set62_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set62_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set62_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set62_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set62_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set62_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set62_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret
        .global smc_target_set63_0    
    .align 0x1000
    .rept 4032
        nop
    .endr      
smc_target_set63_0:
    nop
    jmp smc_target_set63_1
    
        .global smc_target_set63_1    
    .align 0x1000
    .rept 4032
        nop
    .endr      
smc_target_set63_1:
    nop
    jmp smc_target_set63_2
    
        .global smc_target_set63_2    
    .align 0x1000
    .rept 4032
        nop
    .endr      
smc_target_set63_2:
    nop
    jmp smc_target_set63_3
    
        .global smc_target_set63_3    
    .align 0x1000
    .rept 4032
        nop
    .endr      
smc_target_set63_3:
    nop
    jmp smc_target_set63_4
    
        .global smc_target_set63_4    
    .align 0x1000
    .rept 4032
        nop
    .endr      
smc_target_set63_4:
    nop
    jmp smc_target_set63_5
    
        .global smc_target_set63_5    
    .align 0x1000
    .rept 4032
        nop
    .endr      
smc_target_set63_5:
    nop
    jmp smc_target_set63_6
    
        .global smc_target_set63_6    
    .align 0x1000
    .rept 4032
        nop
    .endr      
smc_target_set63_6:
    nop
    jmp smc_target_set63_7
    
        .global smc_target_set63_7    
    .align 0x1000
    .rept 4032
        nop
    .endr
smc_target_set63_7:
    nop
    jmp smc_target_set63_prime_return
    
.align 0x1000   
    .global smc_prime_l1i_set63
smc_prime_l1i_set63:
    jmp smc_target_set63_0
    smc_target_set63_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_set63
smc_probe_l1i_set63:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set63_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set63_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set63_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set63_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set63_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set63_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_set63_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_set63_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret