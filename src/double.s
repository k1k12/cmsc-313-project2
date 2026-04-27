# fooooooooooo

.section .data
prompt:
  .ascii "Enter no -> "
prompt_length = . - prompt

.section .text
.globl _start

_start:
  # write 1 prompt prompt_length
  mov $1, %rax # syscall number for write
  movq $1, %rdi # 1 = stdout
  movq $prompt, %rsi # addr msg
  movq $prompt_length, %rdx # length odf mgg
  syscall

  # exit
  mov $60, %rax # this is syscall no for exit
  xor %rdi, %rdi # exit status 0
  syscall
