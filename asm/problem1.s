.section .text
.globl solve
.type solve, @function

solve:
    xorq %rdi, %rdi /* Accumulator */
    movq $999, %rcx
    1:
        /* Mod by 3 and check */
        xorq %rdx, %rdx
        movq %rcx, %rax
        movq $3, %rsi
        divq %rsi
        cmpq $0, %rdx
        jne 2f
        addq %rcx, %rdi
        jmp 3f

        2: /* Mod by 5 and check */
        xorq %rdx, %rdx
        movq %rcx, %rax
        movq $5, %rsi
        divq %rsi
        cmpq $0, %rdx
        jne 3f
        addq %rcx, %rdi
    3: loop 1b
    movq %rdi, %rax
    ret
