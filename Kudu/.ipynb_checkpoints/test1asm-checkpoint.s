
test1:     file format elf64-x86-64


Disassembly of section .init:

0000000000000668 <_init>:
 668:	48 83 ec 08          	sub    $0x8,%rsp
 66c:	48 8b 05 75 09 20 00 	mov    0x200975(%rip),%rax        # 200fe8 <__gmon_start__>
 673:	48 85 c0             	test   %rax,%rax
 676:	74 02                	je     67a <_init+0x12>
 678:	ff d0                	callq  *%rax
 67a:	48 83 c4 08          	add    $0x8,%rsp
 67e:	c3                   	retq   

Disassembly of section .plt:

0000000000000680 <.plt>:
 680:	ff 35 1a 09 20 00    	pushq  0x20091a(%rip)        # 200fa0 <_GLOBAL_OFFSET_TABLE_+0x8>
 686:	ff 25 1c 09 20 00    	jmpq   *0x20091c(%rip)        # 200fa8 <_GLOBAL_OFFSET_TABLE_+0x10>
 68c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000690 <__stack_chk_fail@plt>:
 690:	ff 25 1a 09 20 00    	jmpq   *0x20091a(%rip)        # 200fb0 <__stack_chk_fail@GLIBC_2.4>
 696:	68 00 00 00 00       	pushq  $0x0
 69b:	e9 e0 ff ff ff       	jmpq   680 <.plt>

00000000000006a0 <printf@plt>:
 6a0:	ff 25 12 09 20 00    	jmpq   *0x200912(%rip)        # 200fb8 <printf@GLIBC_2.2.5>
 6a6:	68 01 00 00 00       	pushq  $0x1
 6ab:	e9 d0 ff ff ff       	jmpq   680 <.plt>

00000000000006b0 <logf@plt>:
 6b0:	ff 25 0a 09 20 00    	jmpq   *0x20090a(%rip)        # 200fc0 <logf@GLIBC_2.27>
 6b6:	68 02 00 00 00       	pushq  $0x2
 6bb:	e9 c0 ff ff ff       	jmpq   680 <.plt>

00000000000006c0 <fgets@plt>:
 6c0:	ff 25 02 09 20 00    	jmpq   *0x200902(%rip)        # 200fc8 <fgets@GLIBC_2.2.5>
 6c6:	68 03 00 00 00       	pushq  $0x3
 6cb:	e9 b0 ff ff ff       	jmpq   680 <.plt>

00000000000006d0 <time@plt>:
 6d0:	ff 25 fa 08 20 00    	jmpq   *0x2008fa(%rip)        # 200fd0 <time@GLIBC_2.2.5>
 6d6:	68 04 00 00 00       	pushq  $0x4
 6db:	e9 a0 ff ff ff       	jmpq   680 <.plt>

Disassembly of section .plt.got:

00000000000006e0 <__cxa_finalize@plt>:
 6e0:	ff 25 12 09 20 00    	jmpq   *0x200912(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 6e6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000006f0 <_start>:
 6f0:	31 ed                	xor    %ebp,%ebp
 6f2:	49 89 d1             	mov    %rdx,%r9
 6f5:	5e                   	pop    %rsi
 6f6:	48 89 e2             	mov    %rsp,%rdx
 6f9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 6fd:	50                   	push   %rax
 6fe:	54                   	push   %rsp
 6ff:	4c 8d 05 ba 03 00 00 	lea    0x3ba(%rip),%r8        # ac0 <__libc_csu_fini>
 706:	48 8d 0d 43 03 00 00 	lea    0x343(%rip),%rcx        # a50 <__libc_csu_init>
 70d:	48 8d 3d 4f 01 00 00 	lea    0x14f(%rip),%rdi        # 863 <main>
 714:	ff 15 c6 08 20 00    	callq  *0x2008c6(%rip)        # 200fe0 <__libc_start_main@GLIBC_2.2.5>
 71a:	f4                   	hlt    
 71b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000720 <deregister_tm_clones>:
 720:	48 8d 3d e9 08 20 00 	lea    0x2008e9(%rip),%rdi        # 201010 <stdin@@GLIBC_2.2.5>
 727:	55                   	push   %rbp
 728:	48 8d 05 e1 08 20 00 	lea    0x2008e1(%rip),%rax        # 201010 <stdin@@GLIBC_2.2.5>
 72f:	48 39 f8             	cmp    %rdi,%rax
 732:	48 89 e5             	mov    %rsp,%rbp
 735:	74 19                	je     750 <deregister_tm_clones+0x30>
 737:	48 8b 05 9a 08 20 00 	mov    0x20089a(%rip),%rax        # 200fd8 <_ITM_deregisterTMCloneTable>
 73e:	48 85 c0             	test   %rax,%rax
 741:	74 0d                	je     750 <deregister_tm_clones+0x30>
 743:	5d                   	pop    %rbp
 744:	ff e0                	jmpq   *%rax
 746:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 74d:	00 00 00 
 750:	5d                   	pop    %rbp
 751:	c3                   	retq   
 752:	0f 1f 40 00          	nopl   0x0(%rax)
 756:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 75d:	00 00 00 

0000000000000760 <register_tm_clones>:
 760:	48 8d 3d a9 08 20 00 	lea    0x2008a9(%rip),%rdi        # 201010 <stdin@@GLIBC_2.2.5>
 767:	48 8d 35 a2 08 20 00 	lea    0x2008a2(%rip),%rsi        # 201010 <stdin@@GLIBC_2.2.5>
 76e:	55                   	push   %rbp
 76f:	48 29 fe             	sub    %rdi,%rsi
 772:	48 89 e5             	mov    %rsp,%rbp
 775:	48 c1 fe 03          	sar    $0x3,%rsi
 779:	48 89 f0             	mov    %rsi,%rax
 77c:	48 c1 e8 3f          	shr    $0x3f,%rax
 780:	48 01 c6             	add    %rax,%rsi
 783:	48 d1 fe             	sar    %rsi
 786:	74 18                	je     7a0 <register_tm_clones+0x40>
 788:	48 8b 05 61 08 20 00 	mov    0x200861(%rip),%rax        # 200ff0 <_ITM_registerTMCloneTable>
 78f:	48 85 c0             	test   %rax,%rax
 792:	74 0c                	je     7a0 <register_tm_clones+0x40>
 794:	5d                   	pop    %rbp
 795:	ff e0                	jmpq   *%rax
 797:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 79e:	00 00 
 7a0:	5d                   	pop    %rbp
 7a1:	c3                   	retq   
 7a2:	0f 1f 40 00          	nopl   0x0(%rax)
 7a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 7ad:	00 00 00 

00000000000007b0 <__do_global_dtors_aux>:
 7b0:	80 3d 61 08 20 00 00 	cmpb   $0x0,0x200861(%rip)        # 201018 <completed.7696>
 7b7:	75 2f                	jne    7e8 <__do_global_dtors_aux+0x38>
 7b9:	48 83 3d 37 08 20 00 	cmpq   $0x0,0x200837(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 7c0:	00 
 7c1:	55                   	push   %rbp
 7c2:	48 89 e5             	mov    %rsp,%rbp
 7c5:	74 0c                	je     7d3 <__do_global_dtors_aux+0x23>
 7c7:	48 8b 3d 3a 08 20 00 	mov    0x20083a(%rip),%rdi        # 201008 <__dso_handle>
 7ce:	e8 0d ff ff ff       	callq  6e0 <__cxa_finalize@plt>
 7d3:	e8 48 ff ff ff       	callq  720 <deregister_tm_clones>
 7d8:	c6 05 39 08 20 00 01 	movb   $0x1,0x200839(%rip)        # 201018 <completed.7696>
 7df:	5d                   	pop    %rbp
 7e0:	c3                   	retq   
 7e1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 7e8:	f3 c3                	repz retq 
 7ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000007f0 <frame_dummy>:
 7f0:	55                   	push   %rbp
 7f1:	48 89 e5             	mov    %rsp,%rbp
 7f4:	5d                   	pop    %rbp
 7f5:	e9 66 ff ff ff       	jmpq   760 <register_tm_clones>

00000000000007fa <getRand>:
 7fa:	55                   	push   %rbp
 7fb:	48 89 e5             	mov    %rsp,%rbp
 7fe:	48 83 ec 20          	sub    $0x20,%rsp
 802:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 806:	f2 0f 11 45 e0       	movsd  %xmm0,-0x20(%rbp)
 80b:	f2 48 0f 2a 45 e8    	cvtsi2sdq -0x18(%rbp),%xmm0
 811:	f2 0f 5e 45 e0       	divsd  -0x20(%rbp),%xmm0
 816:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
 81b:	48 b8 bb aa ff ee dd 	movabs $0xaabbccddeeffaabb,%rax
 822:	cc bb aa 
 825:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 829:	89 d1                	mov    %edx,%ecx
 82b:	be 08 00 00 00       	mov    $0x8,%esi
 830:	48 8d 3d a1 02 00 00 	lea    0x2a1(%rip),%rdi        # ad8 <_IO_stdin_used+0x8>
 837:	b8 00 00 00 00       	mov    $0x0,%eax
 83c:	e8 5f fe ff ff       	callq  6a0 <printf@plt>
 841:	be 08 00 00 00       	mov    $0x8,%esi
 846:	48 8d 3d 96 02 00 00 	lea    0x296(%rip),%rdi        # ae3 <_IO_stdin_used+0x13>
 84d:	b8 00 00 00 00       	mov    $0x0,%eax
 852:	e8 49 fe ff ff       	callq  6a0 <printf@plt>
 857:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
 85c:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
 861:	c9                   	leaveq 
 862:	c3                   	retq   

0000000000000863 <main>:
 863:	55                   	push   %rbp
 864:	48 89 e5             	mov    %rsp,%rbp
 867:	48 81 ec 90 00 00 00 	sub    $0x90,%rsp
 86e:	89 7d 8c             	mov    %edi,-0x74(%rbp)
 871:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
 875:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 87c:	00 00 
 87e:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 882:	31 c0                	xor    %eax,%eax
 884:	48 8b 15 85 07 20 00 	mov    0x200785(%rip),%rdx        # 201010 <stdin@@GLIBC_2.2.5>
 88b:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 88f:	be 32 00 00 00       	mov    $0x32,%esi
 894:	48 89 c7             	mov    %rax,%rdi
 897:	e8 24 fe ff ff       	callq  6c0 <fgets@plt>
 89c:	f3 0f 10 05 e0 02 00 	movss  0x2e0(%rip),%xmm0        # b84 <_IO_stdin_used+0xb4>
 8a3:	00 
 8a4:	f3 0f 11 45 94       	movss  %xmm0,-0x6c(%rbp)
 8a9:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 8ad:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
 8b1:	c7 45 98 00 00 00 00 	movl   $0x0,-0x68(%rbp)
 8b8:	eb 67                	jmp    921 <main+0xbe>
 8ba:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 8be:	0f b6 00             	movzbl (%rax),%eax
 8c1:	0f be c0             	movsbl %al,%eax
 8c4:	f3 0f 2a c0          	cvtsi2ss %eax,%xmm0
 8c8:	f3 0f 10 4d 94       	movss  -0x6c(%rbp),%xmm1
 8cd:	f3 0f 59 c1          	mulss  %xmm1,%xmm0
 8d1:	f3 0f 11 45 94       	movss  %xmm0,-0x6c(%rbp)
 8d6:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 8da:	0f b6 00             	movzbl (%rax),%eax
 8dd:	0f be c8             	movsbl %al,%ecx
 8e0:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 8e4:	0f b6 00             	movzbl (%rax),%eax
 8e7:	0f be d0             	movsbl %al,%edx
 8ea:	8b 45 98             	mov    -0x68(%rbp),%eax
 8ed:	8d 70 01             	lea    0x1(%rax),%esi
 8f0:	89 75 98             	mov    %esi,-0x68(%rbp)
 8f3:	89 c6                	mov    %eax,%esi
 8f5:	48 8d 3d f4 01 00 00 	lea    0x1f4(%rip),%rdi        # af0 <_IO_stdin_used+0x20>
 8fc:	b8 00 00 00 00       	mov    $0x0,%eax
 901:	e8 9a fd ff ff       	callq  6a0 <printf@plt>
 906:	f3 0f 5a 45 94       	cvtss2sd -0x6c(%rbp),%xmm0
 90b:	48 8d 3d ef 01 00 00 	lea    0x1ef(%rip),%rdi        # b01 <_IO_stdin_used+0x31>
 912:	b8 01 00 00 00       	mov    $0x1,%eax
 917:	e8 84 fd ff ff       	callq  6a0 <printf@plt>
 91c:	48 83 45 a8 01       	addq   $0x1,-0x58(%rbp)
 921:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 925:	0f b6 00             	movzbl (%rax),%eax
 928:	84 c0                	test   %al,%al
 92a:	74 0b                	je     937 <main+0xd4>
 92c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
 930:	0f b6 00             	movzbl (%rax),%eax
 933:	3c 0a                	cmp    $0xa,%al
 935:	75 83                	jne    8ba <main+0x57>
 937:	f3 0f 5a 45 94       	cvtss2sd -0x6c(%rbp),%xmm0
 93c:	48 8d 3d d3 01 00 00 	lea    0x1d3(%rip),%rdi        # b16 <_IO_stdin_used+0x46>
 943:	b8 01 00 00 00       	mov    $0x1,%eax
 948:	e8 53 fd ff ff       	callq  6a0 <printf@plt>
 94d:	8b 45 94             	mov    -0x6c(%rbp),%eax
 950:	89 85 78 ff ff ff    	mov    %eax,-0x88(%rbp)
 956:	f3 0f 10 85 78 ff ff 	movss  -0x88(%rbp),%xmm0
 95d:	ff 
 95e:	e8 4d fd ff ff       	callq  6b0 <logf@plt>
 963:	0f 28 c8             	movaps %xmm0,%xmm1
 966:	f3 0f 10 05 1a 02 00 	movss  0x21a(%rip),%xmm0        # b88 <_IO_stdin_used+0xb8>
 96d:	00 
 96e:	f3 0f 5e c8          	divss  %xmm0,%xmm1
 972:	0f 28 c1             	movaps %xmm1,%xmm0
 975:	f3 0f 11 45 9c       	movss  %xmm0,-0x64(%rbp)
 97a:	f3 0f 5a 45 9c       	cvtss2sd -0x64(%rbp),%xmm0
 97f:	48 8d 3d ad 01 00 00 	lea    0x1ad(%rip),%rdi        # b33 <_IO_stdin_used+0x63>
 986:	b8 01 00 00 00       	mov    $0x1,%eax
 98b:	e8 10 fd ff ff       	callq  6a0 <printf@plt>
 990:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
 994:	48 89 c7             	mov    %rax,%rdi
 997:	e8 34 fd ff ff       	callq  6d0 <time@plt>
 99c:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 9a0:	48 89 c6             	mov    %rax,%rsi
 9a3:	48 8d 3d 9a 01 00 00 	lea    0x19a(%rip),%rdi        # b44 <_IO_stdin_used+0x74>
 9aa:	b8 00 00 00 00       	mov    $0x0,%eax
 9af:	e8 ec fc ff ff       	callq  6a0 <printf@plt>
 9b4:	f3 0f 5a 45 94       	cvtss2sd -0x6c(%rbp),%xmm0
 9b9:	f2 0f 11 45 b0       	movsd  %xmm0,-0x50(%rbp)
 9be:	66 0f ef c0          	pxor   %xmm0,%xmm0
 9c2:	f2 0f 11 45 b8       	movsd  %xmm0,-0x48(%rbp)
 9c7:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 9cb:	f2 48 0f 2a c0       	cvtsi2sd %rax,%xmm0
 9d0:	f2 0f 5e 45 b0       	divsd  -0x50(%rbp),%xmm0
 9d5:	f2 0f 11 05 4b 06 20 	movsd  %xmm0,0x20064b(%rip)        # 201028 <timeDiv>
 9dc:	00 
 9dd:	48 8b 45 a0          	mov    -0x60(%rbp),%rax
 9e1:	48 8b 55 b0          	mov    -0x50(%rbp),%rdx
 9e5:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
 9ec:	f2 0f 10 85 78 ff ff 	movsd  -0x88(%rbp),%xmm0
 9f3:	ff 
 9f4:	48 89 c7             	mov    %rax,%rdi
 9f7:	e8 fe fd ff ff       	callq  7fa <getRand>
 9fc:	48 89 05 1d 06 20 00 	mov    %rax,0x20061d(%rip)        # 201020 <bits>
 a03:	48 8b 15 16 06 20 00 	mov    0x200616(%rip),%rdx        # 201020 <bits>
 a0a:	48 8b 05 17 06 20 00 	mov    0x200617(%rip),%rax        # 201028 <timeDiv>
 a11:	48 89 d6             	mov    %rdx,%rsi
 a14:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
 a1b:	f2 0f 10 85 78 ff ff 	movsd  -0x88(%rbp),%xmm0
 a22:	ff 
 a23:	48 8d 3d 2e 01 00 00 	lea    0x12e(%rip),%rdi        # b58 <_IO_stdin_used+0x88>
 a2a:	b8 01 00 00 00       	mov    $0x1,%eax
 a2f:	e8 6c fc ff ff       	callq  6a0 <printf@plt>
 a34:	b8 00 00 00 00       	mov    $0x0,%eax
 a39:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 a3d:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 a44:	00 00 
 a46:	74 05                	je     a4d <main+0x1ea>
 a48:	e8 43 fc ff ff       	callq  690 <__stack_chk_fail@plt>
 a4d:	c9                   	leaveq 
 a4e:	c3                   	retq   
 a4f:	90                   	nop

0000000000000a50 <__libc_csu_init>:
 a50:	41 57                	push   %r15
 a52:	41 56                	push   %r14
 a54:	49 89 d7             	mov    %rdx,%r15
 a57:	41 55                	push   %r13
 a59:	41 54                	push   %r12
 a5b:	4c 8d 25 26 03 20 00 	lea    0x200326(%rip),%r12        # 200d88 <__frame_dummy_init_array_entry>
 a62:	55                   	push   %rbp
 a63:	48 8d 2d 26 03 20 00 	lea    0x200326(%rip),%rbp        # 200d90 <__init_array_end>
 a6a:	53                   	push   %rbx
 a6b:	41 89 fd             	mov    %edi,%r13d
 a6e:	49 89 f6             	mov    %rsi,%r14
 a71:	4c 29 e5             	sub    %r12,%rbp
 a74:	48 83 ec 08          	sub    $0x8,%rsp
 a78:	48 c1 fd 03          	sar    $0x3,%rbp
 a7c:	e8 e7 fb ff ff       	callq  668 <_init>
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
