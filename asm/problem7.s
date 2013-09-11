.section .text
.globl solve
.type solve, @function

solve:
    pushq %rbx
    pushq %r12
    pushq %r13
    
    movq $1000000, %rdi
    call sieve_create
    movq %rax, %rdi
    call sieve_init
    movq %rax, %r12

    movq $3, %r13 /* Start at 3 so we can increment by 2 */
    movq $1, %rbx /* Start the count at 1 because we skipped 2 */
    1:
        movq %r12, %rdi
        movq %r13, %rsi
        call sieve_is_prime
        cmpb $0, %al
        je 2f
        addq $1, %rbx
        2:
        cmp $10001, %rbx
        je 3f
        addq $2, %r13
        jmp 1b
    3:
    movq %r12, %rdi
    call sieve_destroy
    movq %r13, %rax
    popq %r13
    popq %r12
    popq %rbx
    ret
