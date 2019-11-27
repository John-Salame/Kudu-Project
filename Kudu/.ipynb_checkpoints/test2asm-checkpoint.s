
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
 74f:	4c 8d 05 4a 03 00 00 	lea    0x34a(%rip),%r8        # aa0 <__libc_csu_fini>
 756:	48 8d 0d d3 02 00 00 	lea    0x2d3(%rip),%rcx        # a30 <__libc_csu_init>
 75d:	48 8d 3d 51 02 00 00 	lea    0x251(%rip),%rdi        # 9b5 <main>
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
 84e:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
 852:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
 856:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 85d:	00 00 
 85f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 863:	31 c0                	xor    %eax,%eax
 865:	f2 0f 10 05 db 02 00 	movsd  0x2db(%rip),%xmm0        # b48 <_IO_stdin_used+0x98>
 86c:	00 
 86d:	f2 0f 11 45 a8       	movsd  %xmm0,-0x58(%rbp)
 872:	48 b8 bb aa ff ee dd 	movabs $0xaabbccddeeffaabb,%rax
 879:	cc bb aa 
 87c:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
 880:	48 8d 3d 31 02 00 00 	lea    0x231(%rip),%rdi        # ab8 <_IO_stdin_used+0x8>
 887:	e8 44 fe ff ff       	callq  6d0 <puts@plt>
 88c:	48 8b 15 7d 07 20 00 	mov    0x20077d(%rip),%rdx        # 201010 <stdin@@GLIBC_2.2.5>
 893:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 897:	be 32 00 00 00       	mov    $0x32,%esi
 89c:	48 89 c7             	mov    %rax,%rdi
 89f:	e8 6c fe ff ff       	callq  710 <fgets@plt>
 8a4:	f3 0f 10 05 a4 02 00 	movss  0x2a4(%rip),%xmm0        # b50 <_IO_stdin_used+0xa0>
 8ab:	00 
 8ac:	f3 0f 11 45 90       	movss  %xmm0,-0x70(%rbp)
 8b1:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 8b5:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
 8b9:	eb 21                	jmp    8dc <getRand+0x92>
 8bb:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 8bf:	0f b6 00             	movzbl (%rax),%eax
 8c2:	0f be c0             	movsbl %al,%eax
 8c5:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
 8c9:	f3 0f 10 4d 90       	movss  -0x70(%rbp),%xmm1
 8ce:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
 8d2:	f3 0f 11 45 90       	movss  %xmm0,-0x70(%rbp)
 8d7:	48 83 45 a0 01       	addq   $0x1,-0x60(%rbp)
 8dc:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 8e0:	0f b6 00             	movzbl (%rax),%eax
 8e3:	84 c0                	test   %al,%al
 8e5:	74 0b                	je     8f2 <getRand+0xa8>
 8e7:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 8eb:	0f b6 00             	movzbl (%rax),%eax
 8ee:	3c 0a                	cmp    $0xa,%al
 8f0:	75 c9                	jne    8bb <getRand+0x71>
 8f2:	f3 0f 5a 45 90       	cvtss2sd -0x70(%rbp),%xmm0
 8f7:	48 8d 3d cb 01 00 00 	lea    0x1cb(%rip),%rdi        # ac9 <_IO_stdin_used+0x19>
 8fe:	b8 01 00 00 00       	mov    $0x1,%eax
 903:	e8 e8 fd ff ff       	callq  6f0 <printf@plt>
 908:	8b 45 90             	mov    -0x70(%rbp),%eax
 90b:	89 45 84             	mov    %eax,-0x7c(%rbp)
 90e:	f3 0f 10 45 84       	movss  -0x7c(%rbp),%xmm0
 913:	e8 e8 fd ff ff       	callq  700 <logf@plt>
 918:	0f 28 c8             	movaps %xmm0,%xmm1
 91b:	f3 0f 10 05 31 02 00 	movss  0x231(%rip),%xmm0        # b54 <_IO_stdin_used+0xa4>
 922:	00 
 923:	f3 0f 5e c8          	divss  %xmm0,%xmm1
 927:	0f 28 c1             	movaps %xmm1,%xmm0
 92a:	f3 0f 11 45 94       	movss  %xmm0,-0x6c(%rbp)
 92f:	f3 0f 5a 45 94       	cvtss2sd -0x6c(%rbp),%xmm0
 934:	48 8d 3d ab 01 00 00 	lea    0x1ab(%rip),%rdi        # ae6 <_IO_stdin_used+0x36>
 93b:	b8 01 00 00 00       	mov    $0x1,%eax
 940:	e8 ab fd ff ff       	callq  6f0 <printf@plt>
 945:	48 8d 45 98          	lea    -0x68(%rbp),%rax
 949:	48 89 c7             	mov    %rax,%rdi
 94c:	e8 cf fd ff ff       	callq  720 <time@plt>
 951:	48 8b 45 98          	mov    -0x68(%rbp),%rax
 955:	48 89 c6             	mov    %rax,%rsi
 958:	48 8d 3d 98 01 00 00 	lea    0x198(%rip),%rdi        # af7 <_IO_stdin_used+0x47>
 95f:	b8 00 00 00 00       	mov    $0x0,%eax
 964:	e8 87 fd ff ff       	callq  6f0 <printf@plt>
 969:	f3 0f 5a 45 90       	cvtss2sd -0x70(%rbp),%xmm0
 96e:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
 973:	48 8b 45 98          	mov    -0x68(%rbp),%rax
 977:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
 97c:	f2 0f 5e 45 b8       	divsd  -0x48(%rbp),%xmm0
 981:	f2 0f 11 45 a8       	movsd  %xmm0,-0x58(%rbp)
 986:	48 8b 45 88          	mov    -0x78(%rbp),%rax
 98a:	f2 0f 10 45 a8       	movsd  -0x58(%rbp),%xmm0
 98f:	f2 0f 11 00          	movsd  %xmm0,(%rax)
 993:	4c 8b 45 f0          	mov    -0x10(%rbp),%r8
 997:	4c 89 45 f8          	mov    %r8,-0x8(%rbp)
 99b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
 99f:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 9a3:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 9aa:	00 00 
 9ac:	74 05                	je     9b3 <getRand+0x169>
 9ae:	e8 2d fd ff ff       	callq  6e0 <__stack_chk_fail@plt>
 9b3:	c9                   	leaveq 
 9b4:	c3                   	retq   

00000000000009b5 <main>:
 9b5:	55                   	push   %rbp
 9b6:	48 89 e5             	mov    %rsp,%rbp
 9b9:	48 83 ec 30          	sub    $0x30,%rsp
 9bd:	89 7d ec             	mov    %edi,-0x14(%rbp)
 9c0:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
 9c4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 9cb:	00 00 
 9cd:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 9d1:	31 c0                	xor    %eax,%eax
 9d3:	48 8d 45 f0          	lea    -0x10(%rbp),%rax
 9d7:	48 89 c7             	mov    %rax,%rdi
 9da:	e8 6b fe ff ff       	callq  84a <getRand>
 9df:	48 89 05 3a 06 20 00 	mov    %rax,0x20063a(%rip)        # 201020 <bits>
 9e6:	48 8b 15 33 06 20 00 	mov    0x200633(%rip),%rdx        # 201020 <bits>
 9ed:	48 8b 0d 2c 06 20 00 	mov    0x20062c(%rip),%rcx        # 201020 <bits>
 9f4:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
 9f8:	48 89 ce             	mov    %rcx,%rsi
 9fb:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
 9ff:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
 a04:	48 8d 3d 05 01 00 00 	lea    0x105(%rip),%rdi        # b10 <_IO_stdin_used+0x60>
 a0b:	b8 01 00 00 00       	mov    $0x1,%eax
 a10:	e8 db fc ff ff       	callq  6f0 <printf@plt>
 a15:	b8 00 00 00 00       	mov    $0x0,%eax
 a1a:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 a1e:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 a25:	00 00 
 a27:	74 05                	je     a2e <main+0x79>
 a29:	e8 b2 fc ff ff       	callq  6e0 <__stack_chk_fail@plt>
 a2e:	c9                   	leaveq 
 a2f:	c3                   	retq   

0000000000000a30 <__libc_csu_init>:
 a30:	41 57                	push   %r15
 a32:	41 56                	push   %r14
 a34:	49 89 d7             	mov    %rdx,%r15
 a37:	41 55                	push   %r13
 a39:	41 54                	push   %r12
 a3b:	4c 8d 25 3e 03 20 00 	lea    0x20033e(%rip),%r12        # 200d80 <__frame_dummy_init_array_entry>
 a42:	55                   	push   %rbp
 a43:	48 8d 2d 3e 03 20 00 	lea    0x20033e(%rip),%rbp        # 200d88 <__init_array_end>
 a4a:	53                   	push   %rbx
 a4b:	41 89 fd             	mov    %edi,%r13d
 a4e:	49 89 f6             	mov    %rsi,%r14
 a51:	4c 29 e5             	sub    %r12,%rbp
 a54:	48 83 ec 08          	sub    $0x8,%rsp
 a58:	48 c1 fd 03          	sar    $0x3,%rbp
 a5c:	e8 3f fc ff ff       	callq  6a0 <_init>
 a61:	48 85 ed             	test   %rbp,%rbp
 a64:	74 20                	je     a86 <__libc_csu_init+0x56>
 a66:	31 db                	xor    %ebx,%ebx
 a68:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 a6f:	00 
 a70:	4c 89 fa             	mov    %r15,%rdx
 a73:	4c 89 f6             	mov    %r14,%rsi
 a76:	44 89 ef             	mov    %r13d,%edi
 a79:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 a7d:	48 83 c3 01          	add    $0x1,%rbx
 a81:	48 39 dd             	cmp    %rbx,%rbp
 a84:	75 ea                	jne    a70 <__libc_csu_init+0x40>
 a86:	48 83 c4 08          	add    $0x8,%rsp
 a8a:	5b                   	pop    %rbx
 a8b:	5d                   	pop    %rbp
 a8c:	41 5c                	pop    %r12
 a8e:	41 5d                	pop    %r13
 a90:	41 5e                	pop    %r14
 a92:	41 5f                	pop    %r15
 a94:	c3                   	retq   
 a95:	90                   	nop
 a96:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 a9d:	00 00 00 

0000000000000aa0 <__libc_csu_fini>:
 aa0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000000aa4 <_fini>:
 aa4:	48 83 ec 08          	sub    $0x8,%rsp
 aa8:	48 83 c4 08          	add    $0x8,%rsp
 aac:	c3                   	retq   
