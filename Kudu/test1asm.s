
test1:     file format elf64-x86-64


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
 74f:	4c 8d 05 5a 03 00 00 	lea    0x35a(%rip),%r8        # ab0 <__libc_csu_fini>
 756:	48 8d 0d e3 02 00 00 	lea    0x2e3(%rip),%rcx        # a40 <__libc_csu_init>
 75d:	48 8d 3d 30 01 00 00 	lea    0x130(%rip),%rdi        # 894 <main>
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

000000000000084a <getRand>:
 84a:	55                   	push   %rbp
 84b:	48 89 e5             	mov    %rsp,%rbp
 84e:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 852:	f2 0f 11 45 e0       	movsd  %xmm0,-0x20(%rbp)
 857:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
 85b:	f2 48 0f 2a 45 e8    	cvtsi2sdq -0x18(%rbp),%xmm0
 861:	f2 0f 5e 45 e0       	divsd  -0x20(%rbp),%xmm0
 866:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
 86b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 86f:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
 874:	f2 0f 11 00          	movsd  %xmm0,(%rax)
 878:	48 b8 bb aa ff ee dd 	movabs $0xaabbccddeeffaabb,%rax
 87f:	cc bb aa 
 882:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 886:	4c 8b 45 f0          	mov    -0x10(%rbp),%r8
 88a:	4c 89 45 f8          	mov    %r8,-0x8(%rbp)
 88e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
 892:	5d                   	pop    %rbp
 893:	c3                   	retq   

0000000000000894 <main>:
 894:	55                   	push   %rbp
 895:	48 89 e5             	mov    %rsp,%rbp
 898:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
 89f:	89 7d 8c             	mov    %edi,-0x74(%rbp)
 8a2:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
 8a6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 8ad:	00 00 
 8af:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 8b3:	31 c0                	xor    %eax,%eax
 8b5:	48 8d 3d 0c 02 00 00 	lea    0x20c(%rip),%rdi        # ac8 <_IO_stdin_used+0x8>
 8bc:	e8 0f fe ff ff       	callq  6d0 <puts@plt>
 8c1:	48 8b 15 48 07 20 00 	mov    0x200748(%rip),%rdx        # 201010 <stdin@@GLIBC_2.2.5>
 8c8:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 8cc:	be 32 00 00 00       	mov    $0x32,%esi
 8d1:	48 89 c7             	mov    %rax,%rdi
 8d4:	e8 37 fe ff ff       	callq  710 <fgets@plt>
 8d9:	f3 0f 10 05 7b 02 00 	movss  0x27b(%rip),%xmm0        # b5c <_IO_stdin_used+0x9c>
 8e0:	00 
 8e1:	f3 0f 11 45 94       	movss  %xmm0,-0x6c(%rbp)
 8e6:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 8ea:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 8ee:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
 8f5:	eb 21                	jmp    918 <main+0x84>
 8f7:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 8fb:	0f b6 00             	movzbl (%rax),%eax
 8fe:	0f be c0             	movsbl %al,%eax
 901:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
 905:	f3 0f 10 4d 94       	movss  -0x6c(%rbp),%xmm1
 90a:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
 90e:	f3 0f 11 45 94       	movss  %xmm0,-0x6c(%rbp)
 913:	48 83 45 b0 01       	addq   $0x1,-0x50(%rbp)
 918:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 91c:	0f b6 00             	movzbl (%rax),%eax
 91f:	84 c0                	test   %al,%al
 921:	74 0b                	je     92e <main+0x9a>
 923:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 927:	0f b6 00             	movzbl (%rax),%eax
 92a:	3c 0a                	cmp    $0xa,%al
 92c:	75 c9                	jne    8f7 <main+0x63>
 92e:	f3 0f 5a 45 94       	cvtss2sd -0x6c(%rbp),%xmm0
 933:	48 8d 3d 9f 01 00 00 	lea    0x19f(%rip),%rdi        # ad9 <_IO_stdin_used+0x19>
 93a:	b8 01 00 00 00       	mov    $0x1,%eax
 93f:	e8 ac fd ff ff       	callq  6f0 <printf@plt>
 944:	8b 45 94             	mov    -0x6c(%rbp),%eax
 947:	89 85 78 ff ff ff    	mov    %eax,-0x88(%rbp)
 94d:	f3 0f 10 85 78 ff ff 	movss  -0x88(%rbp),%xmm0
 954:	ff 
 955:	e8 a6 fd ff ff       	callq  700 <logf@plt>
 95a:	0f 28 c8             	movaps %xmm0,%xmm1
 95d:	f3 0f 10 05 fb 01 00 	movss  0x1fb(%rip),%xmm0        # b60 <_IO_stdin_used+0xa0>
 964:	00 
 965:	f3 0f 5e c8          	divss  %xmm0,%xmm1
 969:	0f 28 c1             	movaps %xmm1,%xmm0
 96c:	f3 0f 11 45 9c       	movss  %xmm0,-0x64(%rbp)
 971:	f3 0f 5a 45 9c       	cvtss2sd -0x64(%rbp),%xmm0
 976:	48 8d 3d 79 01 00 00 	lea    0x179(%rip),%rdi        # af6 <_IO_stdin_used+0x36>
 97d:	b8 01 00 00 00       	mov    $0x1,%eax
 982:	e8 69 fd ff ff       	callq  6f0 <printf@plt>
 987:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
 98b:	48 89 c7             	mov    %rax,%rdi
 98e:	e8 8d fd ff ff       	callq  720 <time@plt>
 993:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 997:	48 89 c6             	mov    %rax,%rsi
 99a:	48 8d 3d 66 01 00 00 	lea    0x166(%rip),%rdi        # b07 <_IO_stdin_used+0x47>
 9a1:	b8 00 00 00 00       	mov    $0x0,%eax
 9a6:	e8 45 fd ff ff       	callq  6f0 <printf@plt>
 9ab:	f3 0f 5a 45 94       	cvtss2sd -0x6c(%rbp),%xmm0
 9b0:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
 9b5:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 9b9:	48 8d 4d a8          	lea    -0x58(%rbp),%rcx
 9bd:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
 9c1:	48 89 ce             	mov    %rcx,%rsi
 9c4:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 9cb:	f2 0f 10 85 78 ff ff 	movsd  -0x88(%rbp),%xmm0
 9d2:	ff 
 9d3:	48 89 c7             	mov    %rax,%rdi
 9d6:	e8 6f fe ff ff       	callq  84a <getRand>
 9db:	48 89 05 3e 06 20 00 	mov    %rax,0x20063e(%rip)        # 201020 <bits>
 9e2:	48 8b 15 37 06 20 00 	mov    0x200637(%rip),%rdx        # 201020 <bits>
 9e9:	48 8b 0d 30 06 20 00 	mov    0x200630(%rip),%rcx        # 201020 <bits>
 9f0:	f2 0f 10 45 a8       	movsd  -0x58(%rbp),%xmm0
 9f5:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
 9f9:	48 89 ce             	mov    %rcx,%rsi
 9fc:	66 0f 28 c8          	movapd %xmm0,%xmm1
 a00:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
 a07:	f2 0f 10 85 78 ff ff 	movsd  -0x88(%rbp),%xmm0
 a0e:	ff 
 a0f:	48 8d 3d 0a 01 00 00 	lea    0x10a(%rip),%rdi        # b20 <_IO_stdin_used+0x60>
 a16:	b8 02 00 00 00       	mov    $0x2,%eax
 a1b:	e8 d0 fc ff ff       	callq  6f0 <printf@plt>
 a20:	b8 00 00 00 00       	mov    $0x0,%eax
 a25:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 a29:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 a30:	00 00 
 a32:	74 05                	je     a39 <main+0x1a5>
 a34:	e8 a7 fc ff ff       	callq  6e0 <__stack_chk_fail@plt>
 a39:	c9                   	leaveq 
 a3a:	c3                   	retq   
 a3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000a40 <__libc_csu_init>:
 a40:	41 57                	push   %r15
 a42:	41 56                	push   %r14
 a44:	49 89 d7             	mov    %rdx,%r15
 a47:	41 55                	push   %r13
 a49:	41 54                	push   %r12
 a4b:	4c 8d 25 2e 03 20 00 	lea    0x20032e(%rip),%r12        # 200d80 <__frame_dummy_init_array_entry>
 a52:	55                   	push   %rbp
 a53:	48 8d 2d 2e 03 20 00 	lea    0x20032e(%rip),%rbp        # 200d88 <__init_array_end>
 a5a:	53                   	push   %rbx
 a5b:	41 89 fd             	mov    %edi,%r13d
 a5e:	49 89 f6             	mov    %rsi,%r14
 a61:	4c 29 e5             	sub    %r12,%rbp
 a64:	48 83 ec 08          	sub    $0x8,%rsp
 a68:	48 c1 fd 03          	sar    $0x3,%rbp
 a6c:	e8 2f fc ff ff       	callq  6a0 <_init>
 a71:	48 85 ed             	test   %rbp,%rbp
 a74:	74 20                	je     a96 <__libc_csu_init+0x56>
 a76:	31 db                	xor    %ebx,%ebx
 a78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 a7f:	00 
 a80:	4c 89 fa             	mov    %r15,%rdx
 a83:	4c 89 f6             	mov    %r14,%rsi
 a86:	44 89 ef             	mov    %r13d,%edi
 a89:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 a8d:	48 83 c3 01          	add    $0x1,%rbx
 a91:	48 39 dd             	cmp    %rbx,%rbp
 a94:	75 ea                	jne    a80 <__libc_csu_init+0x40>
 a96:	48 83 c4 08          	add    $0x8,%rsp
 a9a:	5b                   	pop    %rbx
 a9b:	5d                   	pop    %rbp
 a9c:	41 5c                	pop    %r12
 a9e:	41 5d                	pop    %r13
 aa0:	41 5e                	pop    %r14
 aa2:	41 5f                	pop    %r15
 aa4:	c3                   	retq   
 aa5:	90                   	nop
 aa6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 aad:	00 00 00 

0000000000000ab0 <__libc_csu_fini>:
 ab0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000000ab4 <_fini>:
 ab4:	48 83 ec 08          	sub    $0x8,%rsp
 ab8:	48 83 c4 08          	add    $0x8,%rsp
 abc:	c3                   	retq   
