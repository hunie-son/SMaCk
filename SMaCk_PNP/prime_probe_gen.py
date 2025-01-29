#!/usr/bin/env python
import sys


xrange = range
def gen_prime(set_number):
    align_nops = '''
        .global smc_target_set%s_%s    
    .align 0x1000
    .rept %s
        nop
    .endr'''

    iCL = '''      
smc_target_set%s_%s:
    nop
    jmp smc_target_set%s_%s
    '''

    iCLLast = '''
smc_target_set%s_7:
    nop
    jmp smc_target_set%s_prime_return
    '''

    prime = ""
    #Original : 7
    #Fixed : 10
    for i in xrange(7):
        prime += align_nops%(set_number, i, set_number * 64) + iCL%(set_number, i, set_number, i + 1)

    prime += align_nops%(set_number, 7, set_number * 64) + iCLLast%(set_number, set_number)

    return prime

def gen_prime_probe_flush_a(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    mfence
    clflush smc_target_<TARGET_SET>_7
    mfence
    clflush smc_target_<TARGET_SET>_6
    mfence
    clflush smc_target_<TARGET_SET>_5
    mfence
    clflush smc_target_<TARGET_SET>_4
    mfence
    clflush smc_target_<TARGET_SET>_3
    mfence
    clflush smc_target_<TARGET_SET>_2
    mfence
    clflush smc_target_<TARGET_SET>_1
    mfence
    clflush smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))


def gen_prime_probe_store_a(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    mfence
    movb $0x90, smc_target_<TARGET_SET>_7
    mfence
    movb $0x90, smc_target_<TARGET_SET>_6
    mfence
    movb $0x90, smc_target_<TARGET_SET>_5
    mfence
    movb $0x90, smc_target_<TARGET_SET>_4
    mfence
    movb $0x90, smc_target_<TARGET_SET>_3
    mfence
    movb $0x90, smc_target_<TARGET_SET>_2
    mfence
    movb $0x90, smc_target_<TARGET_SET>_1
    mfence
    movb $0x90, smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))

def gen_prime_probe_lms_a(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    mfence
    lock
    incb smc_target_<TARGET_SET>_7
    mfence
    lock
    incb smc_target_<TARGET_SET>_6
    mfence
    lock
    incb smc_target_<TARGET_SET>_5
    mfence
    lock
    incb smc_target_<TARGET_SET>_4
    mfence
    lock
    incb smc_target_<TARGET_SET>_3    
    mfence
    lock
    incb smc_target_<TARGET_SET>_2    
    mfence
    lock
    incb smc_target_<TARGET_SET>_1    
    mfence
    lock
    incb smc_target_<TARGET_SET>_0    
    mrdtsc_rax

mfence
    decb smc_target_<TARGET_SET>_7
    mfence
    decb smc_target_<TARGET_SET>_6
    mfence
    decb smc_target_<TARGET_SET>_5
    mfence
    decb smc_target_<TARGET_SET>_4
    mfence
    decb smc_target_<TARGET_SET>_3
    mfence
    decb smc_target_<TARGET_SET>_2
    mfence
    decb smc_target_<TARGET_SET>_1
    mfence
    decb smc_target_<TARGET_SET>_0
mfence     
    sub %rbx, %rax
    mov %rax,  0x0(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))



def gen_prime_probe_lms_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    lock
    incb smc_target_<TARGET_SET>_7
    decb smc_target_<TARGET_SET>_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    lock
    incb smc_target_<TARGET_SET>_6
    decb smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    lock
    incb smc_target_<TARGET_SET>_5
    decb smc_target_<TARGET_SET>_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    lock
    incb smc_target_<TARGET_SET>_4
    decb smc_target_<TARGET_SET>_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    lock
    incb smc_target_<TARGET_SET>_3    
    decb smc_target_<TARGET_SET>_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    lock
    incb smc_target_<TARGET_SET>_2    
    decb smc_target_<TARGET_SET>_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    lock
    incb smc_target_<TARGET_SET>_1    
    decb smc_target_<TARGET_SET>_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    lock
    incb smc_target_<TARGET_SET>_0    
    decb smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))



def gen_prime_probe_store_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 
    
    mrdtsc_rax
    mov %rax, %rbx
    movb $0x90, smc_target_<TARGET_SET>_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    movb $0x90, smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    movb $0x90, smc_target_<TARGET_SET>_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    movb $0x90, smc_target_<TARGET_SET>_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    movb $0x90, smc_target_<TARGET_SET>_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    movb $0x90, smc_target_<TARGET_SET>_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    movb $0x90, smc_target_<TARGET_SET>_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    movb $0x90, smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)
    


    
    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))

def gen_prime_probe_store_i_single(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 
    
#    mrdtsc_rax
#    mov %rax, %rbx
#    movb $0x90, smc_target_<TARGET_SET>_7
#    mrdtsc_rax
#    sub %rbx, %rax
#    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    movb $0x90, smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
#    mrdtsc_rax
#    mov %rax, %rbx
#    movb $0x90, smc_target_<TARGET_SET>_5
#    mrdtsc_rax
#    sub %rbx, %rax
#    mov %rax,  0x10(%rdi)
    
#    mrdtsc_rax
#    mov %rax, %rbx
#    movb $0x90, smc_target_<TARGET_SET>_4
#    mrdtsc_rax
#    sub %rbx, %rax
#    mov %rax,  0x18(%rdi)

#    mrdtsc_rax
#    mov %rax, %rbx
#    movb $0x90, smc_target_<TARGET_SET>_3
#    mrdtsc_rax
#    sub %rbx, %rax
#    mov %rax,  0x20(%rdi)

#    mrdtsc_rax
#    mov %rax, %rbx
#    movb $0x90, smc_target_<TARGET_SET>_2
#    mrdtsc_rax
#    sub %rbx, %rax
#    mov %rax,  0x28(%rdi)

#    mrdtsc_rax
#    mov %rax, %rbx
#    movb $0x90, smc_target_<TARGET_SET>_1
#    mrdtsc_rax
#    sub %rbx, %rax
#    mov %rax,  0x30(%rdi)

#    mrdtsc_rax
#    mov %rax, %rbx    
#    movb $0x90, smc_target_<TARGET_SET>_0
#    mrdtsc_rax
#    sub %rbx, %rax
#    mov %rax,  0x38(%rdi)
    


    
    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))


def gen_prime_probe_prefetchnta_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    prefetchnta smc_target_<TARGET_SET>_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    prefetchnta smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    prefetchnta smc_target_<TARGET_SET>_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    prefetchnta  smc_target_<TARGET_SET>_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    prefetchnta  smc_target_<TARGET_SET>_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    prefetchnta smc_target_<TARGET_SET>_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    prefetchnta smc_target_<TARGET_SET>_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    prefetchnta smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))



def gen_prime_probe_prefetch_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    prefetch smc_target_<TARGET_SET>_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    prefetch smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    prefetch smc_target_<TARGET_SET>_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    prefetch  smc_target_<TARGET_SET>_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    prefetch  smc_target_<TARGET_SET>_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    prefetch smc_target_<TARGET_SET>_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    prefetch smc_target_<TARGET_SET>_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    prefetch smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))




def gen_prime_probe_flush_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_<TARGET_SET>_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_<TARGET_SET>_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_<TARGET_SET>_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_<TARGET_SET>_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_<TARGET_SET>_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflush smc_target_<TARGET_SET>_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflush smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))

def gen_prime_probe_flushopt_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clflushopt smc_target_<TARGET_SET>_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflushopt smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflushopt smc_target_<TARGET_SET>_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clflushopt smc_target_<TARGET_SET>_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflushopt smc_target_<TARGET_SET>_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflushopt smc_target_<TARGET_SET>_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clflushopt smc_target_<TARGET_SET>_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clflushopt smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))

def gen_prime_probe_execute_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    call oracle_code_page
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    call oracle_code_page
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    call oracle_code_page
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    call oracle_code_page
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    call oracle_code_page
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    call oracle_code_page
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    call oracle_code_page
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    call oracle_code_page
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))



def gen_prime_probe_load_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    mov smc_target_<TARGET_SET>_7, %rax
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    mov smc_target_<TARGET_SET>_6, %rax
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    mov smc_target_<TARGET_SET>_5, %rax
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    mov smc_target_<TARGET_SET>_4, %rax
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    mov smc_target_<TARGET_SET>_3, %rax
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    mov smc_target_<TARGET_SET>_2, %rax
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    mov smc_target_<TARGET_SET>_1, %rax
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    mov smc_target_<TARGET_SET>_0, %rax
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))


def gen_prime_probe_clwb_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clwb smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))

#MASTIK
def gen_prime_probe_mastik_i(set_number):
    prime_probe = '''
.align 0x1000   
    .global smc_prime_l1i_<TARGET_SET>
smc_prime_l1i_<TARGET_SET>:
    jmp smc_target_<TARGET_SET>_0
    smc_target_<TARGET_SET>_prime_return:
    ret

    # rdi = samples
    # rsi = unused
    # rdx = unused
    # rcx = unused
    .global smc_probe_l1i_<TARGET_SET>
smc_probe_l1i_<TARGET_SET>:
    push %rax
    push %rbx
    push %rdx 

    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_7
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x00(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_6
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x08(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_5
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x10(%rdi)
    
    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_4
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x18(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_3
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x20(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_2
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x28(%rdi)

    mrdtsc_rax
    mov %rax, %rbx
    clwb smc_target_<TARGET_SET>_1
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x30(%rdi)

    mrdtsc_rax
    mov %rax, %rbx    
    clwb smc_target_<TARGET_SET>_0
    mrdtsc_rax
    sub %rbx, %rax
    mov %rax,  0x38(%rdi)

    pop %rdx
    pop %rbx
    pop %rax
    ret'''
    return prime_probe.replace('<TARGET_SET>', "set%s"%(set_number))



def gen_header(set_number):
    head = '''
extern void smc_prime_l1i_set%s();
extern void smc_probe_l1i_set%s(sample_block * samples);
'''

    target = '''extern void smc_target_set%s_%s();
'''

    head = head%(set_number, set_number)
    #Original : 8
    #Fixed : 11
    for i in xrange(8):
        head += target%(set_number, i)

    return head

def gen_mprotect(set_number):
    mprotect = '''mprotect(smc_target_set%s_%s - %s, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC);
    '''
    mprotect_block = ""
    for i in xrange(8):
        mprotect_block += mprotect%(set_number, i, set_number * 64)
    return mprotect_block



asm = open('prime_probe.S', 'w')
header = open('prime_probe.h', 'w')

header.write('''
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/mman.h>


#define SET_ASSOC 8
#define PAGE_SIZE 4096

typedef struct sample_block_t{
    uint64_t lines[SET_ASSOC];
}sample_block;


typedef void (* type_smc_prime_l1i)();
type_smc_prime_l1i prime_set_func[64];

typedef void (* type_smc_probe_l1i)(sample_block *);
type_smc_probe_l1i probe_set_func[64];
''')

mprotect_function = '''
void prime_probe_mprotect_all(){
%s
}'''

mprotects = ""
function_list = ""

 
asm.write('''

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


''')

for i in xrange(64):    
    asm.write(gen_prime(i))
    if sys.argv[1] == 'flush' and sys.argv[2] == 'a':
        asm.write(gen_prime_probe_flush_a(i))
    elif sys.argv[1] == 'flush' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_flush_i(i))
    elif sys.argv[1] == 'flushopt' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_flushopt_i(i))
    elif sys.argv[1] == 'store' and sys.argv[2] == 'a':
        asm.write(gen_prime_probe_store_a(i))
    elif sys.argv[1] == 'store' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_store_i(i))
    elif sys.argv[1] == 'lms' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_lms_i(i))
    elif sys.argv[1] == 'lms' and sys.argv[2] == 'a':
        asm.write(gen_prime_probe_lms_a(i))
    elif sys.argv[1] == 'store' and sys.argv[2] == 's':
        asm.write(gen_prime_probe_store_i_single(i))
    elif sys.argv[1] == 'prefetch' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_prefetch_i(i))

    elif sys.argv[1] == 'prefetchnta' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_prefetchnta_i(i))
    elif sys.argv[1] == 'execute' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_execute_i(i))
    elif sys.argv[1] == 'load' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_load_i(i))
    elif sys.argv[1] == 'clwriteback' and sys.argv[2] == 'i':
        asm.write(gen_prime_probe_clwb_i(i))

    #Mastik toolkit
    #elif sys.argv[1] == 'mastik' and sys.argv[2] == 'i':
    #    asm.write(gen_prime_probe_mastik_i(i))

    else:
        print("<function_name> <a/i>")



    header.write(gen_header(i))
    mprotects += gen_mprotect(i) + '''prime_set_func[%s] = smc_prime_l1i_set%s;probe_set_func[%s] = smc_probe_l1i_set%s;
    
    '''%(i, i, i, i)
    
header.write(mprotect_function%(mprotects))
header.write(function_list)

asm.close()
header.close()

