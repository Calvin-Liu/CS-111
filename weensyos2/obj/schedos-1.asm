
obj/schedos-1:     file format elf32-i386


Disassembly of section .text:

00200000 <start>:
		     : "cc", "memory");
}

static inline void sys_priority(int priority)
{
	asm volatile("int %0\n"
  200000:	b8 04 00 00 00       	mov    $0x4,%eax
  200005:	cd 33                	int    $0x33
  200007:	31 d2                	xor    %edx,%edx
    loop: goto loop; // Convince GCC that function truly does not return.
}

static inline void sys_user1(int character)
{
	asm volatile("int %0\n"
  200009:	66 b8 31 0c          	mov    $0xc31,%ax
  20000d:	cd 32                	int    $0x32
sys_yield(void)
{
	// We call a system call by causing an interrupt with the 'int'
	// instruction.  In weensyos, the type of system call is indicated
	// by the interrupt number -- here, INT_SYS_YIELD.
	asm volatile("int %0\n"
  20000f:	cd 30                	int    $0x30
void
start(void)
{
	int i;
	sys_priority(PRIORITY);
	for (i = 0; i < RUNCOUNT; i++) {
  200011:	42                   	inc    %edx
  200012:	81 fa 40 01 00 00    	cmp    $0x140,%edx
  200018:	75 f3                	jne    20000d <start+0xd>
	// the kernel can look up that register value to read the argument.
	// Here, the status is loaded into register %eax.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.
	asm volatile("int %0\n"
  20001a:	31 c0                	xor    %eax,%eax
  20001c:	cd 31                	int    $0x31
  20001e:	eb fe                	jmp    20001e <start+0x1e>
