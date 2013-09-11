.section .text
.globl solve
.type solve, @function

solve:
    pushq %rbx
    pushq %r12
    pushq %r13
    movq $600851475143, %r13
    movq %r13, -8(%rsp)
    fildq -8(%rsp)
    fsqrt
    fistpq -8(%rsp)
    movq -8(%rsp), %rbx
    addq $1, %rbx
    
    movq %rbx, %rdi
    call sieve_create
    movq %rax, %rdi
    call sieve_init
    movq %rax, %r12

    1:
        decq %rbx
        movq %r12, %rdi
        movq %rbx, %rsi
        call sieve_is_prime
        cmpb $0, %al
        je 1b
        xorq %rdx, %rdx
        movq %r13, %rax
        divq %rbx
        cmpq $0, %rdx
        je 2f
        jmp 1b
    2:
    movq %r12, %rdi
    call sieve_destroy
    movq %rbx, %rax
    popq %r13
    popq %r12
    popq %rbx
    ret
