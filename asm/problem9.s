.section .text
.globl solve
.type solve, @function

solve:
    xorq %rdi, %rdi /* b */
    xorq %rdx, %rdx
    1:
        addq $1, %rdi
        movq %rdi, %rax 
        mulq %rdi
        movq %rax, %rcx /* Store b^2 in %rcx */
        xorq %rsi, %rsi /* a */
        2:
            addq $1, %rsi
            cmp %rdi, %rsi
            je 1b

            movq $1000, %r8 /* c = 1000 - a - b */
            subq %rdi, %r8
            subq %rsi, %r8
            movq %r8, %rax
            mulq %r8
            movq %rax, %r9 /* c^2 */

            movq %rsi, %rax
            mulq %rsi /* Compute a^2 */
            addq %rcx, %rax /* a^2 + b^2 */
            cmpq %r9, %rax
            je 3f
            jmp 2b
    3: 
    movq %rsi, %rax
    mulq %rdi
    mulq %r8

    ret
