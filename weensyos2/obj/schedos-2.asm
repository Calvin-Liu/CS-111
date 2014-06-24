
obj/schedos-2:     file format elf32-i386


Disassembly of section .text:

00300000 <start>:
		     : "cc", "memory");
}

static inline void sys_priority(int priority)
{
	asm volatile("int %0\n"
  300000:	b8 01 00 00 00       	mov    $0x1,%eax
  300005:	cd 33                	int    $0x33
  300007:	31 d2                	xor    %edx,%edx
    loop: goto loop; // Convince GCC that function truly does not return.
}

static inline void sys_user1(int character)
{
	asm volatile("int %0\n"
  300009:	66 b8 32 0a          	mov    $0xa32,%ax
  30000d:	cd 32                	int    $0x32
sys_yield(void)
{
	// We call a system call by causing an interrupt with the 'int'
	// instruction.  In weensyos, the type of system call is indicated
	// by the interrupt number -- here, INT_SYS_YIELD.
	asm volatile("int %0\n"
  30000f:	cd 30                	int    $0x30
void
start(void)
{
	int i;
	sys_priority(PRIORITY);
	for (i = 0; i < RUNCOUNT; i++) {
  300011:	42                   	inc    %edx
  300012:	81 fa 40 01 00 00    	cmp    $0x140,%edx
  300018:	75 f3                	jne    30000d <start+0xd>
	// the kernel can look up that register value to read the argument.
	// Here, the status is loaded into register %eax.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.
	asm volatile("int %0\n"
  30001a:	31 c0                	xor    %eax,%eax
  30001c:	cd 31                	int    $0x31
  30001e:	eb fe                	jmp    30001e <start+0x1e>
