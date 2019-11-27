
test2:     file format elf64-x86-64


Disassembly of section .init:

00000000000006a0 <_init>:
 6a0:	48 83 ec 08          	sub    $0x8,%rsp
 6a4:	48 8b 05 3d 09 20 00 	mov    0x20093d(%rip),%rax        # 200fe8 <__gmon_start__>
 6ab:	48 85 c0             	test   %rax,%rax
 6ae:	74 02                	je     6b2 <_init+0x12>
 6b0:	ff d0                	callq  *%rax
 6b2:	48 83 c4 08          	add    $0x8,%rsp
 6b6:	c3                   	retq   

Disassembly of section .plt:

00000000000006c0 <.plt>:
 6c0:	ff 35 d2 08 20 00    	pushq  0x2008d2(%rip)        # 200f98 <_GLOBAL_OFFSET_TABLE_+0x8>
 6c6:	ff 25 d4 08 20 00    	jmpq   *0x2008d4(%rip)        # 200fa0 <_GLOBAL_OFFSET_TABLE_+0x10>
 6cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000006d0 <puts@plt>:
 6d0:	ff 25 d2 08 20 00    	jmpq   *0x2008d2(%rip)        # 200fa8 <puts@GLIBC_2.2.5>
 6d6:	68 00 00 00 00       	pushq  $0x0
 6db:	e9 e0 ff ff ff       	jmpq   6c0 <.plt>

00000000000006e0 <__stack_chk_fail@plt>:
 6e0:	ff 25 ca 08 20 00    	jmpq   *0x2008ca(%rip)        # 200fb0 <__stack_chk_fail@GLIBC_2.4>
 6e6:	68 01 00 00 00       	pushq  $0x1
 6eb:	e9 d0 ff ff ff       	jmpq   6c0 <.plt>

00000000000006f0 <printf@plt>:
 6f0:	ff 25 c2 08 20 00    	jmpq   *0x2008c2(%rip)        # 200fb8 <printf@GLIBC_2.2.5>
 6f6:	68 02 00 00 00       	pushq  $0x2
 6fb:	e9 c0 ff ff ff       	jmpq   6c0 <.plt>

0000000000000700 <logf@plt>:
 700:	ff 25 ba 08 20 00    	jmpq   *0x2008ba(%rip)        # 200fc0 <logf@GLIBC_2.27>
 706:	68 03 00 00 00       	pushq  $0x3
 70b:	e9 b0 ff ff ff       	jmpq   6c0 <.plt>

0000000000000710 <fgets@plt>:
 710:	ff 25 b2 08 20 00    	jmpq   *0x2008b2(%rip)        # 200fc8 <fgets@GLIBC_2.2.5>
 716:	68 04 00 00 00       	pushq  $0x4
 71b:	e9 a0 ff ff ff       	jmpq   6c0 <.plt>

0000000000000720 <time@plt>:
 720:	ff 25 aa 08 20 00    	jmpq   *0x2008aa(%rip)        # 200fd0 <time@GLIBC_2.2.5>
 726:	68 05 00 00 00       	pushq  $0x5
 72b:	e9 90 ff ff ff       	jmpq   6c0 <.plt>

Disassembly of section .plt.got:

0000000000000730 <__cxa_finalize@plt>:
 730:	ff 25 c2 08 20 00    	jmpq   *0x2008c2(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 736:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000740 <_start>:
 740:	31 ed                	xor    %ebp,%ebp
 742:	49 89 d1             	mov    %rdx,%r9
 745:	5e                   	pop    %rsi
 746:	48 89 e2             	mov    %rsp,%rdx
 749:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 74d:	50                   	push   %rax
 74e:	54                   	push   %rsp
 74f:	4c 8d 05 6a 03 00 00 	lea    0x36a(%rip),%r8        # ac0 <__libc_csu_fini>
 756:	48 8d 0d f3 02 00 00 	lea    0x2f3(%rip),%rcx        # a50 <__libc_csu_init>
 75d:	48 8d 3d 71 02 00 00 	lea    0x271(%rip),%rdi        # 9d5 <main>
 764:	ff 15 76 08 20 00    	callq  *0x200876(%rip)        # 200fe0 <__libc_start_main@GLIBC_2.2.5>
 76a:	f4                   	hlt    
 76b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000770 <deregister_tm_clones>:
 770:	48 8d 3d 99 08 20 00 	lea    0x200899(%rip),%rdi        # 201010 <stdin@@GLIBC_2.2.5>
 777:	55                   	push   %rbp
 778:	48 8d 05 91 08 20 00 	lea    0x200891(%rip),%rax        # 201010 <stdin@@GLIBC_2.2.5>
 77f:	48 39 f8             	cmp    %rdi,%rax
 782:	48 89 e5             	mov    %rsp,%rbp
 785:	74 19                	je     7a0 <deregister_tm_clones+0x30>
 787:	48 8b 05 4a 08 20 00 	mov    0x20084a(%rip),%rax        # 200fd8 <_ITM_deregisterTMCloneTable>
 78e:	48 85 c0             	test   %rax,%rax
 791:	74 0d                	je     7a0 <deregister_tm_clones+0x30>
 793:	5d                   	pop    %rbp
 794:	ff e0                	jmpq   *%rax
 796:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 79d:	00 00 00 
 7a0:	5d                   	pop    %rbp
 7a1:	c3                   	retq   
 7a2:	0f 1f 40 00          	nopl   0x0(%rax)
 7a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 7ad:	00 00 00 

00000000000007b0 <register_tm_clones>:
 7b0:	48 8d 3d 59 08 20 00 	lea    0x200859(%rip),%rdi        # 201010 <stdin@@GLIBC_2.2.5>
 7b7:	48 8d 35 52 08 20 00 	lea    0x200852(%rip),%rsi        # 201010 <stdin@@GLIBC_2.2.5>
 7be:	55                   	push   %rbp
 7bf:	48 29 fe             	sub    %rdi,%rsi
 7c2:	48 89 e5             	mov    %rsp,%rbp
 7c5:	48 c1 fe 03          	sar    $0x3,%rsi
 7c9:	48 89 f0             	mov    %rsi,%rax
 7cc:	48 c1 e8 3f          	shr    $0x3f,%rax
 7d0:	48 01 c6             	add    %rax,%rsi
 7d3:	48 d1 fe             	sar    %rsi
 7d6:	74 18                	je     7f0 <register_tm_clones+0x40>
 7d8:	48 8b 05 11 08 20 00 	mov    0x200811(%rip),%rax        # 200ff0 <_ITM_registerTMCloneTable>
 7df:	48 85 c0             	test   %rax,%rax
 7e2:	74 0c                	je     7f0 <register_tm_clones+0x40>
 7e4:	5d                   	pop    %rbp
 7e5:	ff e0                	jmpq   *%rax
 7e7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 7ee:	00 00 
 7f0:	5d                   	pop    %rbp
 7f1:	c3                   	retq   
 7f2:	0f 1f 40 00          	nopl   0x0(%rax)
 7f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 7fd:	00 00 00 

0000000000000800 <__do_global_dtors_aux>:
 800:	80 3d 11 08 20 00 00 	cmpb   $0x0,0x200811(%rip)        # 201018 <completed.7696>
 807:	75 2f                	jne    838 <__do_global_dtors_aux+0x38>
 809:	48 83 3d e7 07 20 00 	cmpq   $0x0,0x2007e7(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 810:	00 
 811:	55                   	push   %rbp
 812:	48 89 e5             	mov    %rsp,%rbp
 815:	74 0c                	je     823 <__do_global_dtors_aux+0x23>
 817:	48 8b 3d ea 07 20 00 	mov    0x2007ea(%rip),%rdi        # 201008 <__dso_handle>
 81e:	e8 0d ff ff ff       	callq  730 <__cxa_finalize@plt>
 823:	e8 48 ff ff ff       	callq  770 <deregister_tm_clones>
 828:	c6 05 e9 07 20 00 01 	movb   $0x1,0x2007e9(%rip)        # 201018 <completed.7696>
 82f:	5d                   	pop    %rbp
 830:	c3                   	retq   
 831:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 838:	f3 c3                	repz retq 
 83a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000840 <frame_dummy>:
 840:	55                   	push   %rbp
 841:	48 89 e5             	mov    %rsp,%rbp
 844:	5d                   	pop    %rbp
 845:	e9 66 ff ff ff       	jmpq   7b0 <register_tm_clones>

000000000000084a <convert>:
 84a:	55                   	push   %rbp
 84b:	48 89 e5             	mov    %rsp,%rbp
 84e:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
 852:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
 856:	4c 8b 07             	mov    (%rdi),%r8
 859:	4c 89 06             	mov    %r8,(%rsi)
 85c:	90                   	nop
 85d:	5d                   	pop    %rbp
 85e:	c3                   	retq   

000000000000085f <getRand>:
 85f:	55                   	push   %rbp
 860:	48 89 e5             	mov    %rsp,%rbp
 863:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
 867:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
 86b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 872:	00 00 
 874:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 878:	31 c0                	xor    %eax,%eax
 87a:	f2 0f 10 05 e6 02 00 	movsd  0x2e6(%rip),%xmm0        # b68 <_IO_stdin_used+0x98>
 881:	00 
 882:	f2 0f 11 45 98       	movsd  %xmm0,-0x68(%rbp)
 887:	48 b8 bb aa ff ee dd 	movabs $0xaabbccddeeffaabb,%rax
 88e:	cc bb aa 
 891:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
 895:	48 8d 3d 3c 02 00 00 	lea    0x23c(%rip),%rdi        # ad8 <_IO_stdin_used+0x8>
 89c:	e8 2f fe ff ff       	callq  6d0 <puts@plt>
 8a1:	48 8b 15 68 07 20 00 	mov    0x200768(%rip),%rdx        # 201010 <stdin@@GLIBC_2.2.5>
 8a8:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 8ac:	be 32 00 00 00       	mov    $0x32,%esi
 8b1:	48 89 c7             	mov    %rax,%rdi
 8b4:	e8 57 fe ff ff       	callq  710 <fgets@plt>
 8b9:	f3 0f 10 05 af 02 00 	movss  0x2af(%rip),%xmm0        # b70 <_IO_stdin_used+0xa0>
 8c0:	00 
 8c1:	f3 0f 11 45 90       	movss  %xmm0,-0x70(%rbp)
 8c6:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 8ca:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 8ce:	eb 21                	jmp    8f1 <getRand+0x92>
 8d0:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 8d4:	0f b6 00             	movzbl (%rax),%eax
 8d7:	0f be c0             	movsbl %al,%eax
 8da:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
 8de:	f3 0f 10 4d 90       	movss  -0x70(%rbp),%xmm1
 8e3:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
 8e7:	f3 0f 11 45 90       	movss  %xmm0,-0x70(%rbp)
 8ec:	48 83 45 b0 01       	addq   $0x1,-0x50(%rbp)
 8f1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 8f5:	0f b6 00             	movzbl (%rax),%eax
 8f8:	84 c0                	test   %al,%al
 8fa:	74 0b                	je     907 <getRand+0xa8>
 8fc:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 900:	0f b6 00             	movzbl (%rax),%eax
 903:	3c 0a                	cmp    $0xa,%al
 905:	75 c9                	jne    8d0 <getRand+0x71>
 907:	f3 0f 5a 45 90       	cvtss2sd -0x70(%rbp),%xmm0
 90c:	48 8d 3d d6 01 00 00 	lea    0x1d6(%rip),%rdi        # ae9 <_IO_stdin_used+0x19>
 913:	b8 01 00 00 00       	mov    $0x1,%eax
 918:	e8 d3 fd ff ff       	callq  6f0 <printf@plt>
 91d:	8b 45 90             	mov    -0x70(%rbp),%eax
 920:	89 45 84             	mov    %eax,-0x7c(%rbp)
 923:	f3 0f 10 45 84       	movss  -0x7c(%rbp),%xmm0
 928:	e8 d3 fd ff ff       	callq  700 <logf@plt>
 92d:	0f 28 c8             	movaps %xmm0,%xmm1
 930:	f3 0f 10 05 3c 02 00 	movss  0x23c(%rip),%xmm0        # b74 <_IO_stdin_used+0xa4>
 937:	00 
 938:	f3 0f 5e c8          	divss  %xmm0,%xmm1
 93c:	0f 28 c1             	movaps %xmm1,%xmm0
 93f:	f3 0f 11 45 94       	movss  %xmm0,-0x6c(%rbp)
 944:	f3 0f 5a 45 94       	cvtss2sd -0x6c(%rbp),%xmm0
 949:	48 8d 3d b6 01 00 00 	lea    0x1b6(%rip),%rdi        # b06 <_IO_stdin_used+0x36>
 950:	b8 01 00 00 00       	mov    $0x1,%eax
 955:	e8 96 fd ff ff       	callq  6f0 <printf@plt>
 95a:	48 8d 45 a8          	lea    -0x58(%rbp),%rax
 95e:	48 89 c7             	mov    %rax,%rdi
 961:	e8 ba fd ff ff       	callq  720 <time@plt>
 966:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 96a:	48 89 c6             	mov    %rax,%rsi
 96d:	48 8d 3d a3 01 00 00 	lea    0x1a3(%rip),%rdi        # b17 <_IO_stdin_used+0x47>
 974:	b8 00 00 00 00       	mov    $0x0,%eax
 979:	e8 72 fd ff ff       	callq  6f0 <printf@plt>
 97e:	f3 0f 5a 45 90       	cvtss2sd -0x70(%rbp),%xmm0
 983:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
 988:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 98c:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
 991:	f2 0f 5e 45 b8       	divsd  -0x48(%rbp),%xmm0
 996:	f2 0f 11 45 98       	movsd  %xmm0,-0x68(%rbp)
 99b:	f2 0f 10 45 98       	movsd  -0x68(%rbp),%xmm0
 9a0:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 9a4:	f2 0f 11 00          	movsd  %xmm0,(%rax)
 9a8:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
 9ac:	48 8d 45 98          	lea    -0x68(%rbp),%rax
 9b0:	48 89 d6             	mov    %rdx,%rsi
 9b3:	48 89 c7             	mov    %rax,%rdi
 9b6:	e8 8f fe ff ff       	callq  84a <convert>
 9bb:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 9bf:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 9c3:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 9ca:	00 00 
 9cc:	74 05                	je     9d3 <getRand+0x174>
 9ce:	e8 0d fd ff ff       	callq  6e0 <__stack_chk_fail@plt>
 9d3:	c9                   	leaveq 
 9d4:	c3                   	retq   

00000000000009d5 <main>:
 9d5:	55                   	push   %rbp
 9d6:	48 89 e5             	mov    %rsp,%rbp
 9d9:	48 83 ec 40          	sub    $0x40,%rsp
 9dd:	89 7d dc             	mov    %edi,-0x24(%rbp)
 9e0:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
 9e4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 9eb:	00 00 
 9ed:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 9f1:	31 c0                	xor    %eax,%eax
 9f3:	48 8d 45 e8          	lea    -0x18(%rbp),%rax
 9f7:	48 89 c7             	mov    %rax,%rdi
 9fa:	e8 60 fe ff ff       	callq  85f <getRand>
 9ff:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
 a03:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 a07:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
 a0b:	48 8b 4d f0          	mov    -0x10(%rbp),%rcx
 a0f:	48 89 ce             	mov    %rcx,%rsi
 a12:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
 a16:	f2 0f 10 45 c8       	movsd  -0x38(%rbp),%xmm0
 a1b:	48 8d 3d 0e 01 00 00 	lea    0x10e(%rip),%rdi        # b30 <_IO_stdin_used+0x60>
 a22:	b8 01 00 00 00       	mov    $0x1,%eax
 a27:	e8 c4 fc ff ff       	callq  6f0 <printf@plt>
 a2c:	b8 00 00 00 00       	mov    $0x0,%eax
 a31:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 a35:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 a3c:	00 00 
 a3e:	74 05                	je     a45 <main+0x70>
 a40:	e8 9b fc ff ff       	callq  6e0 <__stack_chk_fail@plt>
 a45:	c9                   	leaveq 
 a46:	c3                   	retq   
 a47:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 a4e:	00 00 

0000000000000a50 <__libc_csu_init>:
 a50:	41 57                	push   %r15
 a52:	41 56                	push   %r14
 a54:	49 89 d7             	mov    %rdx,%r15
 a57:	41 55                	push   %r13
 a59:	41 54                	push   %r12
 a5b:	4c 8d 25 1e 03 20 00 	lea    0x20031e(%rip),%r12        # 200d80 <__frame_dummy_init_array_entry>
 a62:	55                   	push   %rbp
 a63:	48 8d 2d 1e 03 20 00 	lea    0x20031e(%rip),%rbp        # 200d88 <__init_array_end>
 a6a:	53                   	push   %rbx
 a6b:	41 89 fd             	mov    %edi,%r13d
 a6e:	49 89 f6             	mov    %rsi,%r14
 a71:	4c 29 e5             	sub    %r12,%rbp
 a74:	48 83 ec 08          	sub    $0x8,%rsp
 a78:	48 c1 fd 03          	sar    $0x3,%rbp
 a7c:	e8 1f fc ff ff       	callq  6a0 <_init>
 a81:	48 85 ed             	test   %rbp,%rbp
 a84:	74 20                	je     aa6 <__libc_csu_init+0x56>
 a86:	31 db                	xor    %ebx,%ebx
 a88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 a8f:	00 
 a90:	4c 89 fa             	mov    %r15,%rdx
 a93:	4c 89 f6             	mov    %r14,%rsi
 a96:	44 89 ef             	mov    %r13d,%edi
 a99:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 a9d:	48 83 c3 01          	add    $0x1,%rbx
 aa1:	48 39 dd             	cmp    %rbx,%rbp
 aa4:	75 ea                	jne    a90 <__libc_csu_init+0x40>
 aa6:	48 83 c4 08          	add    $0x8,%rsp
 aaa:	5b                   	pop    %rbx
 aab:	5d                   	pop    %rbp
 aac:	41 5c                	pop    %r12
 aae:	41 5d                	pop    %r13
 ab0:	41 5e                	pop    %r14
 ab2:	41 5f                	pop    %r15
 ab4:	c3                   	retq   
 ab5:	90                   	nop
 ab6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 abd:	00 00 00 

0000000000000ac0 <__libc_csu_fini>:
 ac0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000000ac4 <_fini>:
 ac4:	48 83 ec 08          	sub    $0x8,%rsp
 ac8:	48 83 c4 08          	add    $0x8,%rsp
 acc:	c3                   	retq   
