
    .data
    .global dummy
dummy:
    .quad 0

big_16mb:
    .space 16 * 1024 * 1024, 0xcc


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


.text
.align 0x1000

    .global evict_n
evict_n:
    push %r11
    lea big_16mb, %r11
evict_n_label:
    mov (%r11, %rdi, 1), %rax
    sub $64, %rdi
    jnz evict_n_label
    mfence
    pop %r11
    ret

    .global base_line
base_line:
    save_registers
    rdtsc_begin    
    rdtsc_end

    .global load_time
load_time:
    save_registers
    rdtsc_begin
    mov (%rdi), %rax
    rdtsc_end

    .global flush_time
flush_time:
    save_registers
    rdtsc_begin
    clflush (%rdi)
    rdtsc_end


    .global flushopt_time
flushopt_time:
    save_registers
    rdtsc_begin
    clflushopt (%rdi)
    rdtsc_end

.global store_time
store_time:
    save_registers
    rdtsc_begin
    movb $0x90, (%rdi)
    rdtsc_end

    .global lms_time
lms_time:
    save_registers
    rdtsc_begin
    lock
    incb (%rdi)
    mfence
    decb (%rdi)
    rdtsc_end

    .global prefetch_time
prefetch_time:
    save_registers
    rdtsc_begin
    prefetch (%rdi)
    rdtsc_end



    .global prefetchnta_time
prefetchnta_time:
    save_registers
    rdtsc_begin
    prefetchnta (%rdi)
    rdtsc_end


    .global exec_time
exec_time:
    save_registers
    rdtsc_begin
    call oracle_code_page
    rdtsc_end


.align 0x1000
    .global oracle_code_page
oracle_code_page:
.rept 16384
    .rept 63
        nop
    .endr
    ret  
.endr


