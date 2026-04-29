# Assembly program that asks user for a number then prints out double the value

.section .data
prompt:
  .ascii "Enter a number: "
prompt_length = . - prompt

result:
  .ascii "The double is: "
result_length = . - result

.section .bss
input:
  .skip 32

output:
  .skip 32

.section .text
.globl _start

_start:
  # Print prompt
  mov $1, %rax # syscall number for write
  movq $1, %rdi # 1 = stdout
  movq $prompt, %rsi # address of prompt
  movq $prompt_length, %rdx # length of prompt
  syscall

  # Read input
  movq $0, %rax # syscall number for read
  movq $0, %rdi # 0 = stdin
  movq $input, %rsi # input buffer
  movq $32, %rdx # max bytes to read
  syscall

  movq $input, %rsi # rsi points to input
  xorq %rax, %rax  # rax will store integer

  ascii_to_int:
    # Convert ascii to ascii 
    movzbq (%rsi), %rbx # load one input char into rbx
    cmpq $10, %rbx
    je double_number

    cmpq $0, %rbx
    je double_number

    subq $48, %rbx # convert ascii to int
    imulq $10, %rax # current num * 10
    addq %rbx, %rax # current number + int

    incq %rsi # move to next char
    jmp ascii_to_int

  double_number:
    # Double number
    addq %rax, %rax # rax = rax * 2
    
    # Convert int to ascii
    movq $output + 31, %rsi # point to end of output buffer
    movb $0, (%rsi) # null terminate
    movq $10, %rbx # divisor

  int_to_ascii:
    # Convert int to ascii
    xorq %rdx, %rdx # clear rdx
    divq %rbx # divide rax by 10

    addb $48, %dl # convert to ascii whats left
    decq %rsi # go back in output buffer
    movb %dl, (%rsi) # store

    cmpq $0, %rax
    jne int_to_ascii

    # Calculate number of bytes in output number
    movq $output + 31, %rdx
    subq %rsi, %rdx # rdx = output length

    # Save output pointer and length
    movq %rsi, %r8
    movq %rdx, %r9

    # Print result message
    mov $1, %rax # syscall number for write
    movq $1, %rdi # 1 = stdout
    movq $result, %rsi # address of result
    movq $result_length, %rdx # length of result
    syscall

    # Print doubled number
    mov $1, %rax # syscall number for write
    movq $1, %rdi # 1 = stdout
    movq %r8, %rsi # address of output number
    movq %r9, %rdx # length of output number
    syscall

    # Exit
    mov $60, %rax # syscall exit
    xor %rdi, %rdi # exit status 0
    syscall
