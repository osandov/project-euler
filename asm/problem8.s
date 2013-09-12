.text

.globl solve
.type solve, @function
solve:
    xorq %r8, %r8 /* Cumulative max */

    movq $digits, %rsi
    leaq 995(%rsi), %rdi

    movq $5, %rcx
    1:
        xorq %rdx, %rdx

        movzbq (%rsi), %rax
        movzbq 1(%rsi), %rcx
        mulq %rcx
        movzbq 2(%rsi), %rcx
        mulq %rcx
        movzbq 3(%rsi), %rcx
        mulq %rcx
        movzbq 4(%rsi), %rcx
        mulq %rcx

        cmp %r8, %rax
        cmovg %rax, %r8
        addq $1, %rsi
        cmp %rdi, %rsi
        jle 1b
    movq %r8, %rax
    ret

.data
.type digits, @object
.size digits, 1000
digits:
    .byte 7; .byte 3; .byte 1; .byte 6; .byte 7; .byte 1; .byte 7; .byte 6
    .byte 5; .byte 3; .byte 1; .byte 3; .byte 3; .byte 0; .byte 6; .byte 2
    .byte 4; .byte 9; .byte 1; .byte 9; .byte 2; .byte 2; .byte 5; .byte 1
    .byte 1; .byte 9; .byte 6; .byte 7; .byte 4; .byte 4; .byte 2; .byte 6
    .byte 5; .byte 7; .byte 4; .byte 7; .byte 4; .byte 2; .byte 3; .byte 5
    .byte 5; .byte 3; .byte 4; .byte 9; .byte 1; .byte 9; .byte 4; .byte 9
    .byte 3; .byte 4; .byte 9; .byte 6; .byte 9; .byte 8; .byte 3; .byte 5
    .byte 2; .byte 0; .byte 3; .byte 1; .byte 2; .byte 7; .byte 7; .byte 4
    .byte 5; .byte 0; .byte 6; .byte 3; .byte 2; .byte 6; .byte 2; .byte 3
    .byte 9; .byte 5; .byte 7; .byte 8; .byte 3; .byte 1; .byte 8; .byte 0
    .byte 1; .byte 6; .byte 9; .byte 8; .byte 4; .byte 8; .byte 0; .byte 1
    .byte 8; .byte 6; .byte 9; .byte 4; .byte 7; .byte 8; .byte 8; .byte 5
    .byte 1; .byte 8; .byte 4; .byte 3; .byte 8; .byte 5; .byte 8; .byte 6
    .byte 1; .byte 5; .byte 6; .byte 0; .byte 7; .byte 8; .byte 9; .byte 1
    .byte 1; .byte 2; .byte 9; .byte 4; .byte 9; .byte 4; .byte 9; .byte 5
    .byte 4; .byte 5; .byte 9; .byte 5; .byte 0; .byte 1; .byte 7; .byte 3
    .byte 7; .byte 9; .byte 5; .byte 8; .byte 3; .byte 3; .byte 1; .byte 9
    .byte 5; .byte 2; .byte 8; .byte 5; .byte 3; .byte 2; .byte 0; .byte 8
    .byte 8; .byte 0; .byte 5; .byte 5; .byte 1; .byte 1; .byte 1; .byte 2
    .byte 5; .byte 4; .byte 0; .byte 6; .byte 9; .byte 8; .byte 7; .byte 4
    .byte 7; .byte 1; .byte 5; .byte 8; .byte 5; .byte 2; .byte 3; .byte 8
    .byte 6; .byte 3; .byte 0; .byte 5; .byte 0; .byte 7; .byte 1; .byte 5
    .byte 6; .byte 9; .byte 3; .byte 2; .byte 9; .byte 0; .byte 9; .byte 6
    .byte 3; .byte 2; .byte 9; .byte 5; .byte 2; .byte 2; .byte 7; .byte 4
    .byte 4; .byte 3; .byte 0; .byte 4; .byte 3; .byte 5; .byte 5; .byte 7
    .byte 6; .byte 6; .byte 8; .byte 9; .byte 6; .byte 6; .byte 4; .byte 8
    .byte 9; .byte 5; .byte 0; .byte 4; .byte 4; .byte 5; .byte 2; .byte 4
    .byte 4; .byte 5; .byte 2; .byte 3; .byte 1; .byte 6; .byte 1; .byte 7
    .byte 3; .byte 1; .byte 8; .byte 5; .byte 6; .byte 4; .byte 0; .byte 3
    .byte 0; .byte 9; .byte 8; .byte 7; .byte 1; .byte 1; .byte 1; .byte 2
    .byte 1; .byte 7; .byte 2; .byte 2; .byte 3; .byte 8; .byte 3; .byte 1
    .byte 1; .byte 3; .byte 6; .byte 2; .byte 2; .byte 2; .byte 9; .byte 8
    .byte 9; .byte 3; .byte 4; .byte 2; .byte 3; .byte 3; .byte 8; .byte 0
    .byte 3; .byte 0; .byte 8; .byte 1; .byte 3; .byte 5; .byte 3; .byte 3
    .byte 6; .byte 2; .byte 7; .byte 6; .byte 6; .byte 1; .byte 4; .byte 2
    .byte 8; .byte 2; .byte 8; .byte 0; .byte 6; .byte 4; .byte 4; .byte 4
    .byte 4; .byte 8; .byte 6; .byte 6; .byte 4; .byte 5; .byte 2; .byte 3
    .byte 8; .byte 7; .byte 4; .byte 9; .byte 3; .byte 0; .byte 3; .byte 5
    .byte 8; .byte 9; .byte 0; .byte 7; .byte 2; .byte 9; .byte 6; .byte 2
    .byte 9; .byte 0; .byte 4; .byte 9; .byte 1; .byte 5; .byte 6; .byte 0
    .byte 4; .byte 4; .byte 0; .byte 7; .byte 7; .byte 2; .byte 3; .byte 9
    .byte 0; .byte 7; .byte 1; .byte 3; .byte 8; .byte 1; .byte 0; .byte 5
    .byte 1; .byte 5; .byte 8; .byte 5; .byte 9; .byte 3; .byte 0; .byte 7
    .byte 9; .byte 6; .byte 0; .byte 8; .byte 6; .byte 6; .byte 7; .byte 0
    .byte 1; .byte 7; .byte 2; .byte 4; .byte 2; .byte 7; .byte 1; .byte 2
    .byte 1; .byte 8; .byte 8; .byte 3; .byte 9; .byte 9; .byte 8; .byte 7
    .byte 9; .byte 7; .byte 9; .byte 0; .byte 8; .byte 7; .byte 9; .byte 2
    .byte 2; .byte 7; .byte 4; .byte 9; .byte 2; .byte 1; .byte 9; .byte 0
    .byte 1; .byte 6; .byte 9; .byte 9; .byte 7; .byte 2; .byte 0; .byte 8
    .byte 8; .byte 8; .byte 0; .byte 9; .byte 3; .byte 7; .byte 7; .byte 6
    .byte 6; .byte 5; .byte 7; .byte 2; .byte 7; .byte 3; .byte 3; .byte 3
    .byte 0; .byte 0; .byte 1; .byte 0; .byte 5; .byte 3; .byte 3; .byte 6
    .byte 7; .byte 8; .byte 8; .byte 1; .byte 2; .byte 2; .byte 0; .byte 2
    .byte 3; .byte 5; .byte 4; .byte 2; .byte 1; .byte 8; .byte 0; .byte 9
    .byte 7; .byte 5; .byte 1; .byte 2; .byte 5; .byte 4; .byte 5; .byte 4
    .byte 0; .byte 5; .byte 9; .byte 4; .byte 7; .byte 5; .byte 2; .byte 2
    .byte 4; .byte 3; .byte 5; .byte 2; .byte 5; .byte 8; .byte 4; .byte 9
    .byte 0; .byte 7; .byte 7; .byte 1; .byte 1; .byte 6; .byte 7; .byte 0
    .byte 5; .byte 5; .byte 6; .byte 0; .byte 1; .byte 3; .byte 6; .byte 0
    .byte 4; .byte 8; .byte 3; .byte 9; .byte 5; .byte 8; .byte 6; .byte 4
    .byte 4; .byte 6; .byte 7; .byte 0; .byte 6; .byte 3; .byte 2; .byte 4
    .byte 4; .byte 1; .byte 5; .byte 7; .byte 2; .byte 2; .byte 1; .byte 5
    .byte 5; .byte 3; .byte 9; .byte 7; .byte 5; .byte 3; .byte 6; .byte 9
    .byte 7; .byte 8; .byte 1; .byte 7; .byte 9; .byte 7; .byte 7; .byte 8
    .byte 4; .byte 6; .byte 1; .byte 7; .byte 4; .byte 0; .byte 6; .byte 4
    .byte 9; .byte 5; .byte 5; .byte 1; .byte 4; .byte 9; .byte 2; .byte 9
    .byte 0; .byte 8; .byte 6; .byte 2; .byte 5; .byte 6; .byte 9; .byte 3
    .byte 2; .byte 1; .byte 9; .byte 7; .byte 8; .byte 4; .byte 6; .byte 8
    .byte 6; .byte 2; .byte 2; .byte 4; .byte 8; .byte 2; .byte 8; .byte 3
    .byte 9; .byte 7; .byte 2; .byte 2; .byte 4; .byte 1; .byte 3; .byte 7
    .byte 5; .byte 6; .byte 5; .byte 7; .byte 0; .byte 5; .byte 6; .byte 0
    .byte 5; .byte 7; .byte 4; .byte 9; .byte 0; .byte 2; .byte 6; .byte 1
    .byte 4; .byte 0; .byte 7; .byte 9; .byte 7; .byte 2; .byte 9; .byte 6
    .byte 8; .byte 6; .byte 5; .byte 2; .byte 4; .byte 1; .byte 4; .byte 5
    .byte 3; .byte 5; .byte 1; .byte 0; .byte 0; .byte 4; .byte 7; .byte 4
    .byte 8; .byte 2; .byte 1; .byte 6; .byte 6; .byte 3; .byte 7; .byte 0
    .byte 4; .byte 8; .byte 4; .byte 4; .byte 0; .byte 3; .byte 1; .byte 9
    .byte 9; .byte 8; .byte 9; .byte 0; .byte 0; .byte 0; .byte 8; .byte 8
    .byte 9; .byte 5; .byte 2; .byte 4; .byte 3; .byte 4; .byte 5; .byte 0
    .byte 6; .byte 5; .byte 8; .byte 5; .byte 4; .byte 1; .byte 2; .byte 2
    .byte 7; .byte 5; .byte 8; .byte 8; .byte 6; .byte 6; .byte 6; .byte 8
    .byte 8; .byte 1; .byte 1; .byte 6; .byte 4; .byte 2; .byte 7; .byte 1
    .byte 7; .byte 1; .byte 4; .byte 7; .byte 9; .byte 9; .byte 2; .byte 4
    .byte 4; .byte 4; .byte 2; .byte 9; .byte 2; .byte 8; .byte 2; .byte 3
    .byte 0; .byte 8; .byte 6; .byte 3; .byte 4; .byte 6; .byte 5; .byte 6
    .byte 7; .byte 4; .byte 8; .byte 1; .byte 3; .byte 9; .byte 1; .byte 9
    .byte 1; .byte 2; .byte 3; .byte 1; .byte 6; .byte 2; .byte 8; .byte 2
    .byte 4; .byte 5; .byte 8; .byte 6; .byte 1; .byte 7; .byte 8; .byte 6
    .byte 6; .byte 4; .byte 5; .byte 8; .byte 3; .byte 5; .byte 9; .byte 1
    .byte 2; .byte 4; .byte 5; .byte 6; .byte 6; .byte 5; .byte 2; .byte 9
    .byte 4; .byte 7; .byte 6; .byte 5; .byte 4; .byte 5; .byte 6; .byte 8
    .byte 2; .byte 8; .byte 4; .byte 8; .byte 9; .byte 1; .byte 2; .byte 8
    .byte 8; .byte 3; .byte 1; .byte 4; .byte 2; .byte 6; .byte 0; .byte 7
    .byte 6; .byte 9; .byte 0; .byte 0; .byte 4; .byte 2; .byte 2; .byte 4
    .byte 2; .byte 1; .byte 9; .byte 0; .byte 2; .byte 2; .byte 6; .byte 7
    .byte 1; .byte 0; .byte 5; .byte 5; .byte 6; .byte 2; .byte 6; .byte 3
    .byte 2; .byte 1; .byte 1; .byte 1; .byte 1; .byte 1; .byte 0; .byte 9
    .byte 3; .byte 7; .byte 0; .byte 5; .byte 4; .byte 4; .byte 2; .byte 1
    .byte 7; .byte 5; .byte 0; .byte 6; .byte 9; .byte 4; .byte 1; .byte 6
    .byte 5; .byte 8; .byte 9; .byte 6; .byte 0; .byte 4; .byte 0; .byte 8
    .byte 0; .byte 7; .byte 1; .byte 9; .byte 8; .byte 4; .byte 0; .byte 3
    .byte 8; .byte 5; .byte 0; .byte 9; .byte 6; .byte 2; .byte 4; .byte 5
    .byte 5; .byte 4; .byte 4; .byte 4; .byte 3; .byte 6; .byte 2; .byte 9
    .byte 8; .byte 1; .byte 2; .byte 3; .byte 0; .byte 9; .byte 8; .byte 7
    .byte 8; .byte 7; .byte 9; .byte 9; .byte 2; .byte 7; .byte 2; .byte 4
    .byte 4; .byte 2; .byte 8; .byte 4; .byte 9; .byte 0; .byte 9; .byte 1
    .byte 8; .byte 8; .byte 8; .byte 4; .byte 5; .byte 8; .byte 0; .byte 1
    .byte 5; .byte 6; .byte 1; .byte 6; .byte 6; .byte 0; .byte 9; .byte 7
    .byte 9; .byte 1; .byte 9; .byte 1; .byte 3; .byte 3; .byte 8; .byte 7
    .byte 5; .byte 4; .byte 9; .byte 9; .byte 2; .byte 0; .byte 0; .byte 5
    .byte 2; .byte 4; .byte 0; .byte 6; .byte 3; .byte 6; .byte 8; .byte 9
    .byte 9; .byte 1; .byte 2; .byte 5; .byte 6; .byte 0; .byte 7; .byte 1
    .byte 7; .byte 6; .byte 0; .byte 6; .byte 0; .byte 5; .byte 8; .byte 8
    .byte 6; .byte 1; .byte 1; .byte 6; .byte 4; .byte 6; .byte 7; .byte 1
    .byte 0; .byte 9; .byte 4; .byte 0; .byte 5; .byte 0; .byte 7; .byte 7
    .byte 5; .byte 4; .byte 1; .byte 0; .byte 0; .byte 2; .byte 2; .byte 5
    .byte 6; .byte 9; .byte 8; .byte 3; .byte 1; .byte 5; .byte 5; .byte 2
    .byte 0; .byte 0; .byte 0; .byte 5; .byte 5; .byte 9; .byte 3; .byte 5
    .byte 7; .byte 2; .byte 9; .byte 7; .byte 2; .byte 5; .byte 7; .byte 1
    .byte 6; .byte 3; .byte 6; .byte 2; .byte 6; .byte 9; .byte 5; .byte 6
    .byte 1; .byte 8; .byte 8; .byte 2; .byte 6; .byte 7; .byte 0; .byte 4
    .byte 2; .byte 8; .byte 2; .byte 5; .byte 2; .byte 4; .byte 8; .byte 3
    .byte 6; .byte 0; .byte 0; .byte 8; .byte 2; .byte 3; .byte 2; .byte 5
    .byte 7; .byte 5; .byte 3; .byte 0; .byte 4; .byte 2; .byte 0; .byte 7
    .byte 5; .byte 2; .byte 9; .byte 6; .byte 3; .byte 4; .byte 5; .byte 0
