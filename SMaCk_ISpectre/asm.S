.text

.align 0x1000
    .global oracle_code_page
oracle_code_page:
.rept 256
    ret
    .rept 1023
        nop
    .endr
.endr

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

    # %rdi target offset

.align 0x1000
    .global load_time
load_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    mov (%r11), %rax
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret


.align 0x1000
    .global flush_time
flush_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    clflush (%r11)
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret

.align 0x1000
    .global flushopt_time
flushopt_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    clflushopt (%r11)
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret


.align 0x1000
    .global store_time
store_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    movb $0x90, (%r11)
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret

.align 0x1000
    .global lms_time
lms_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    lock
    incb (%r11)
    decb (%r11)
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret

.align 0x1000
    .global prefetch_time
prefetch_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    prefetch (%r11)
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret

.align 0x1000
    .global prefetchnta_time
prefetchnta_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    prefetchnta (%r11)
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret


.align 0x1000
    .global clwriteback_time
clwriteback_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    clwb (%r11)
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret


.align 0x1000
    .global exec_time
exec_time:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    mov %rax, %rsi
    call oracle_code_page
    mfence
    rdtsc
    shl $32, %rdx
    add %rdx, %rax
    sub %rsi, %rax
    pop %rsi
    pop %rdx
    pop %r11
    ret


.align 0x1000
    .global flush_oracle
flush_oracle:
    push %r11
    push %rdx
    push %rsi
    lea oracle_code_page, %r11
    add %rdi, %r11
    clflush (%r11)
    clflush (%r11)
    clflush (%r11)
    mfence
    pop %rsi
    pop %rdx
    pop %r11
    ret
