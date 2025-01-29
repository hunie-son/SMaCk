.align 0x1000  
    .global delay
delay:
    dec %rdi
    jnz delay
    ret 
    