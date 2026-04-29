# Assembly program that asks user for a number then prints out double the value

.section .data
prompt:
  .ascii "Enter a number: "
prompt_length = . - prompt

output:
  .ascii "The double is: "
output_length = . - output

.section .bss
input:
  .skip 32

.section .text
.globl _start

_start:
  # Print prompt
  mov $1, %rax # syscall number for write
  movq $1, %rdi # 1 = stdout
  movq $prompt, %rsi # addr msg
  movq $prompt_length, %rdx # length odf mgg
  syscall

  # Read input
  movq $0, %rax # syscall num for read
  movq $0, %rdi # 0 = stdin
  movq $input, %rsi # buffer
  movq $32, %rdx # max bytes to read
  syscall

  # Conv toi nt 

  # Double number

  # Conv to ascii

  # Save output pointer

  # save no bytes read
  movq %rax, %r8

  # write 1 output output_length
  mov $1, %rax # syscall number for write
  movq $1, %rdi # 1 = stdout
  movq $output, %rsi # addr msg
  movq $output_length, %rdx # length odf mgg
  syscall

  # write 1 prompt prompt_length
  mov $1, %rax # syscall number for write
  movq $1, %rdi # 1 = stdout
  movq $input, %rsi # addr msg
  movq %r8, %rdx # length odf mgg
  syscall

  # exit
  mov $60, %rax # this is syscall no for exit
  xor %rdi, %rdi # exit status 0
  syscall
