.text

.globl solve
.type solve, @function
solve:
    xorq %rdi, %rdi
    1: /* Loop %rdi over [1,2..] */
        addq $1, %rdi
        movq $20, %rcx
        2: /* Loop %rcx over [20,19,..1] */
            xorq %rdx, %rdx
            movq %rdi, %rax
            divq %rcx
            cmpq $0, %rdx
            jne 3f /* Break if %rdi isn't divisible by %rcx */
        loop 2b
        3: cmpq $0, %rcx /* If %rcx is zero, then %rdi was divisible by all */
        je 4f            /* of the numbers, so break the outer loop */
    jmp 1b
    4: movq %rdi, %rax
    ret
