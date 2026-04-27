// fooooooooooo

.global _start

.section .text

_start:
  // just exit
  mov $60, %rax
  xor %rdi, %rdi
  syscall
