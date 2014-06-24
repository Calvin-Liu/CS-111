
obj/schedos-4:     file format elf32-i386


Disassembly of section .text:

00500000 <start>:
		     : "cc", "memory");
}

static inline void sys_priority(int priority)
{
	asm volatile("int %0\n"
  500000:	b8 03 00 00 00       	mov    $0x3,%eax
  500005:	cd 33                	int    $0x33
  500007:	31 d2                	xor    %edx,%edx
    loop: goto loop; // Convince GCC that function truly does not return.
}

static inline void sys_user1(int character)
{
	asm volatile("int %0\n"
  500009:	66 b8 34 0e          	mov    $0xe34,%ax
  50000d:	cd 32                	int    $0x32
sys_yield(void)
{
	// We call a system call by causing an interrupt with the 'int'
	// instruction.  In weensyos, the type of system call is indicated
	// by the interrupt number -- here, INT_SYS_YIELD.
	asm volatile("int %0\n"
  50000f:	cd 30                	int    $0x30
void
start(void)
{
	int i;
	sys_priority(PRIORITY);
	for (i = 0; i < RUNCOUNT; i++) {
  500011:	42                   	inc    %edx
  500012:	81 fa 40 01 00 00    	cmp    $0x140,%edx
  500018:	75 f3                	jne    50000d <start+0xd>
	// the kernel can look up that register value to read the argument.
	// Here, the status is loaded into register %eax.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.
	asm volatile("int %0\n"
  50001a:	31 c0                	xor    %eax,%eax
  50001c:	cd 31                	int    $0x31
  50001e:	eb fe                	jmp    50001e <start+0x1e>
