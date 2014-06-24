
obj/mpos-kern:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4 bc                	in     $0xbc,%al

0010000c <multiboot_start>:
# The multiboot_start routine sets the stack pointer to the top of the
# MiniprocOS's kernel stack, then jumps to the 'start' routine in mpos-kern.c.

.globl multiboot_start
multiboot_start:
	movl $0x200000, %esp
  10000c:	bc 00 00 20 00       	mov    $0x200000,%esp
	pushl $0
  100011:	6a 00                	push   $0x0
	popfl
  100013:	9d                   	popf   
	call start
  100014:	e8 ec 01 00 00       	call   100205 <start>
  100019:	90                   	nop

0010001a <sys_int48_handler>:

# Interrupt handlers
.align 2

sys_int48_handler:
	pushl $0
  10001a:	6a 00                	push   $0x0
	pushl $48
  10001c:	6a 30                	push   $0x30
	jmp _generic_int_handler
  10001e:	eb 3a                	jmp    10005a <_generic_int_handler>

00100020 <sys_int49_handler>:

sys_int49_handler:
	pushl $0
  100020:	6a 00                	push   $0x0
	pushl $49
  100022:	6a 31                	push   $0x31
	jmp _generic_int_handler
  100024:	eb 34                	jmp    10005a <_generic_int_handler>

00100026 <sys_int50_handler>:

sys_int50_handler:
	pushl $0
  100026:	6a 00                	push   $0x0
	pushl $50
  100028:	6a 32                	push   $0x32
	jmp _generic_int_handler
  10002a:	eb 2e                	jmp    10005a <_generic_int_handler>

0010002c <sys_int51_handler>:

sys_int51_handler:
	pushl $0
  10002c:	6a 00                	push   $0x0
	pushl $51
  10002e:	6a 33                	push   $0x33
	jmp _generic_int_handler
  100030:	eb 28                	jmp    10005a <_generic_int_handler>

00100032 <sys_int52_handler>:

sys_int52_handler:
	pushl $0
  100032:	6a 00                	push   $0x0
	pushl $52
  100034:	6a 34                	push   $0x34
	jmp _generic_int_handler
  100036:	eb 22                	jmp    10005a <_generic_int_handler>

00100038 <sys_int53_handler>:

sys_int53_handler:
	pushl $0
  100038:	6a 00                	push   $0x0
	pushl $53
  10003a:	6a 35                	push   $0x35
	jmp _generic_int_handler
  10003c:	eb 1c                	jmp    10005a <_generic_int_handler>

0010003e <sys_int54_handler>:

sys_int54_handler:
	pushl $0
  10003e:	6a 00                	push   $0x0
	pushl $54
  100040:	6a 36                	push   $0x36
	jmp _generic_int_handler
  100042:	eb 16                	jmp    10005a <_generic_int_handler>

00100044 <sys_int55_handler>:

sys_int55_handler:
	pushl $0
  100044:	6a 00                	push   $0x0
	pushl $55
  100046:	6a 37                	push   $0x37
	jmp _generic_int_handler
  100048:	eb 10                	jmp    10005a <_generic_int_handler>

0010004a <sys_int56_handler>:

sys_int56_handler:
	pushl $0
  10004a:	6a 00                	push   $0x0
	pushl $56
  10004c:	6a 38                	push   $0x38
	jmp _generic_int_handler
  10004e:	eb 0a                	jmp    10005a <_generic_int_handler>

00100050 <sys_int57_handler>:

sys_int57_handler:
	pushl $0
  100050:	6a 00                	push   $0x0
	pushl $57
  100052:	6a 39                	push   $0x39
	jmp _generic_int_handler
  100054:	eb 04                	jmp    10005a <_generic_int_handler>

00100056 <default_int_handler>:

	.globl default_int_handler
default_int_handler:
	pushl $0
  100056:	6a 00                	push   $0x0
	jmp _generic_int_handler
  100058:	eb 00                	jmp    10005a <_generic_int_handler>

0010005a <_generic_int_handler>:
	# When we get here, the processor's interrupt mechanism has
	# pushed the old task status and stack registers onto the kernel stack.
	# Then one of the specific handlers pushed the interrupt number.
	# Now, we complete the 'registers_t' structure by pushing the extra
	# segment definitions and the general CPU registers.
	pushl %ds
  10005a:	1e                   	push   %ds
	pushl %es
  10005b:	06                   	push   %es
	pushal
  10005c:	60                   	pusha  

	# Call the kernel's 'interrupt' function.
	pushl %esp
  10005d:	54                   	push   %esp
	call interrupt
  10005e:	e8 58 00 00 00       	call   1000bb <interrupt>

00100063 <sys_int_handlers>:
  100063:	1a 00                	sbb    (%eax),%al
  100065:	10 00                	adc    %al,(%eax)
  100067:	20 00                	and    %al,(%eax)
  100069:	10 00                	adc    %al,(%eax)
  10006b:	26 00 10             	add    %dl,%es:(%eax)
  10006e:	00 2c 00             	add    %ch,(%eax,%eax,1)
  100071:	10 00                	adc    %al,(%eax)
  100073:	32 00                	xor    (%eax),%al
  100075:	10 00                	adc    %al,(%eax)
  100077:	38 00                	cmp    %al,(%eax)
  100079:	10 00                	adc    %al,(%eax)
  10007b:	3e 00 10             	add    %dl,%ds:(%eax)
  10007e:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
  100082:	00 4a 00             	add    %cl,0x0(%edx)
  100085:	10 00                	adc    %al,(%eax)
  100087:	50                   	push   %eax
  100088:	00 10                	add    %dl,(%eax)
  10008a:	00 90 83 ec 0c a1    	add    %dl,-0x5ef3137d(%eax)

0010008c <schedule>:
 *
 *****************************************************************************/

void
schedule(void)
{
  10008c:	83 ec 0c             	sub    $0xc,%esp
	pid_t pid = current->p_pid;
  10008f:	a1 08 9f 10 00       	mov    0x109f08,%eax
	while (1) {
		pid = (pid + 1) % NPROCS;
  100094:	b9 10 00 00 00       	mov    $0x10,%ecx
 *****************************************************************************/

void
schedule(void)
{
	pid_t pid = current->p_pid;
  100099:	8b 10                	mov    (%eax),%edx
	while (1) {
		pid = (pid + 1) % NPROCS;
  10009b:	8d 42 01             	lea    0x1(%edx),%eax
  10009e:	99                   	cltd   
  10009f:	f7 f9                	idiv   %ecx
		if (proc_array[pid].p_state == P_RUNNABLE)
  1000a1:	6b c2 54             	imul   $0x54,%edx,%eax
  1000a4:	83 b8 a8 91 10 00 01 	cmpl   $0x1,0x1091a8(%eax)
  1000ab:	75 ee                	jne    10009b <schedule+0xf>
			run(&proc_array[pid]);
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	05 60 91 10 00       	add    $0x109160,%eax
  1000b5:	50                   	push   %eax
  1000b6:	e8 6d 03 00 00       	call   100428 <run>

001000bb <interrupt>:

int j = 1;

void
interrupt(registers_t *reg)
{
  1000bb:	55                   	push   %ebp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000bc:	b9 11 00 00 00       	mov    $0x11,%ecx

int j = 1;

void
interrupt(registers_t *reg)
{
  1000c1:	57                   	push   %edi
  1000c2:	56                   	push   %esi
  1000c3:	53                   	push   %ebx
  1000c4:	83 ec 1c             	sub    $0x1c,%esp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000c7:	8b 1d 08 9f 10 00    	mov    0x109f08,%ebx

int j = 1;

void
interrupt(registers_t *reg)
{
  1000cd:	8b 44 24 30          	mov    0x30(%esp),%eax
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000d1:	8d 7b 04             	lea    0x4(%ebx),%edi
  1000d4:	89 c6                	mov    %eax,%esi
  1000d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000d8:	8b 40 28             	mov    0x28(%eax),%eax
  1000db:	83 e8 30             	sub    $0x30,%eax
  1000de:	83 f8 04             	cmp    $0x4,%eax
  1000e1:	0f 87 1c 01 00 00    	ja     100203 <interrupt+0x148>
  1000e7:	ff 24 85 e0 09 10 00 	jmp    *0x1009e0(,%eax,4)
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000ee:	8b 03                	mov    (%ebx),%eax
		run(current);
  1000f0:	83 ec 0c             	sub    $0xc,%esp
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000f3:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  1000f6:	53                   	push   %ebx
  1000f7:	e9 8f 00 00 00       	jmp    10018b <interrupt+0xd0>
  1000fc:	b8 fc 91 10 00       	mov    $0x1091fc,%eax
  100101:	ba 01 00 00 00       	mov    $0x1,%edx
do_fork(process_t *parent)
{
	pid_t k;
	for(k = 1; k < 16; k++)
	{
		if(proc_array[k].p_state == P_EMPTY)
  100106:	83 38 00             	cmpl   $0x0,(%eax)
  100109:	75 68                	jne    100173 <interrupt+0xb8>
		{
			proc_array[k].p_state = P_RUNNABLE;
  10010b:	6b ea 54             	imul   $0x54,%edx,%ebp
			proc_array[k].p_registers = parent->p_registers;
  10010e:	b9 11 00 00 00       	mov    $0x11,%ecx
  100113:	8d 73 04             	lea    0x4(%ebx),%esi
  100116:	8d 85 60 91 10 00    	lea    0x109160(%ebp),%eax
  10011c:	89 c7                	mov    %eax,%edi
  10011e:	83 c7 04             	add    $0x4,%edi
  100121:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
  100123:	8b b5 60 91 10 00    	mov    0x109160(%ebp),%esi
	for(k = 1; k < 16; k++)
	{
		if(proc_array[k].p_state == P_EMPTY)
		{
			proc_array[k].p_state = P_RUNNABLE;
			proc_array[k].p_registers = parent->p_registers;
  100129:	89 44 24 0c          	mov    %eax,0xc(%esp)

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR+src->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);
  10012d:	8b 03                	mov    (%ebx),%eax
	pid_t k;
	for(k = 1; k < 16; k++)
	{
		if(proc_array[k].p_state == P_EMPTY)
		{
			proc_array[k].p_state = P_RUNNABLE;
  10012f:	c7 85 a8 91 10 00 01 	movl   $0x1,0x1091a8(%ebp)
  100136:	00 00 00 
	// and then how to actually copy the stack.  (Hint: use memcpy.)
	// We have done one for you.

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR+src->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */
	src_stack_bottom = src->p_registers.reg_esp;
  100139:	8b 4b 40             	mov    0x40(%ebx),%ecx
	
	offset_difference = (src_stack_top - src_stack_bottom);

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
  10013c:	83 c6 0a             	add    $0xa,%esi

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR+src->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);
  10013f:	83 c0 0a             	add    $0xa,%eax
  100142:	c1 e0 12             	shl    $0x12,%eax

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
  100145:	57                   	push   %edi

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR+src->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);
  100146:	29 c8                	sub    %ecx,%eax

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
  100148:	50                   	push   %eax
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
  100149:	c1 e6 12             	shl    $0x12,%esi
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
  10014c:	51                   	push   %ecx
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
  10014d:	29 c6                	sub    %eax,%esi
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
  10014f:	56                   	push   %esi
  100150:	89 54 24 18          	mov    %edx,0x18(%esp)
  100154:	e8 a7 03 00 00       	call   100500 <memcpy>
	dest->p_registers.reg_esp = dest_stack_bottom; 
  100159:	8b 44 24 1c          	mov    0x1c(%esp),%eax
		if(proc_array[k].p_state == P_EMPTY)
		{
			proc_array[k].p_state = P_RUNNABLE;
			proc_array[k].p_registers = parent->p_registers;
			copy_stack(&proc_array[k],parent);
			proc_array[k].p_registers.reg_eax = 0;
  10015d:	83 c4 10             	add    $0x10,%esp
  100160:	c7 85 80 91 10 00 00 	movl   $0x0,0x109180(%ebp)
  100167:	00 00 00 
  10016a:	8b 54 24 08          	mov    0x8(%esp),%edx
	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
	dest->p_registers.reg_esp = dest_stack_bottom; 
  10016e:	89 70 40             	mov    %esi,0x40(%eax)
  100171:	eb 0c                	jmp    10017f <interrupt+0xc4>

static pid_t
do_fork(process_t *parent)
{
	pid_t k;
	for(k = 1; k < 16; k++)
  100173:	42                   	inc    %edx
  100174:	83 c0 54             	add    $0x54,%eax
  100177:	83 fa 10             	cmp    $0x10,%edx
  10017a:	75 8a                	jne    100106 <interrupt+0x4b>
  10017c:	83 ca ff             	or     $0xffffffff,%edx
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  10017f:	89 53 20             	mov    %edx,0x20(%ebx)
		run(current);
  100182:	83 ec 0c             	sub    $0xc,%esp
  100185:	ff 35 08 9f 10 00    	pushl  0x109f08
  10018b:	e8 98 02 00 00       	call   100428 <run>
	case INT_SYS_YIELD:
		// The 'sys_yield' system call asks the kernel to schedule a
		// different process.  (MiniprocOS is cooperatively
		// scheduled, so we need a special system call to do this.)
		// The schedule() function picks another process and runs it.
		schedule();
  100190:	e8 f7 fe ff ff       	call   10008c <schedule>
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.

		current->p_state = P_EMPTY;
  100195:	a1 08 9f 10 00       	mov    0x109f08,%eax
		current->p_exit_status = current->p_registers.reg_eax;
  10019a:	8b 50 20             	mov    0x20(%eax),%edx
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.

		current->p_state = P_EMPTY;
  10019d:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
		current->p_exit_status = current->p_registers.reg_eax;
  1001a4:	89 50 4c             	mov    %edx,0x4c(%eax)
		if(current->waiting_proc > 0)
  1001a7:	8b 40 50             	mov    0x50(%eax),%eax
  1001aa:	85 c0                	test   %eax,%eax
  1001ac:	7e 13                	jle    1001c1 <interrupt+0x106>
		{
			proc_array[current->waiting_proc].p_state = P_RUNNABLE;
  1001ae:	6b c0 54             	imul   $0x54,%eax,%eax
  1001b1:	c7 80 a8 91 10 00 01 	movl   $0x1,0x1091a8(%eax)
  1001b8:	00 00 00 
			proc_array[current->waiting_proc].p_registers.reg_eax = current->p_exit_status;
  1001bb:	89 90 80 91 10 00    	mov    %edx,0x109180(%eax)
		}
		schedule();
  1001c1:	e8 c6 fe ff ff       	call   10008c <schedule>
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
  1001c6:	a1 08 9f 10 00       	mov    0x109f08,%eax
  1001cb:	8b 50 20             	mov    0x20(%eax),%edx
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001ce:	8d 4a ff             	lea    -0x1(%edx),%ecx
  1001d1:	83 f9 0e             	cmp    $0xe,%ecx
  1001d4:	77 10                	ja     1001e6 <interrupt+0x12b>
  1001d6:	3b 10                	cmp    (%eax),%edx
  1001d8:	74 0c                	je     1001e6 <interrupt+0x12b>
  1001da:	6b d2 54             	imul   $0x54,%edx,%edx
  1001dd:	83 ba a8 91 10 00 00 	cmpl   $0x0,0x1091a8(%edx)
  1001e4:	75 09                	jne    1001ef <interrupt+0x134>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
  1001e6:	c7 40 20 ff ff ff ff 	movl   $0xffffffff,0x20(%eax)
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001ed:	eb 0f                	jmp    1001fe <interrupt+0x143>
			current->p_registers.reg_eax = -1;
//		else if (proc_array[p].p_state == P_ZOMBIE)
//			current->p_registers.reg_eax = proc_array[p].p_exit_status;
		else
		{
			current->p_state = P_BLOCKED;
  1001ef:	c7 40 48 02 00 00 00 	movl   $0x2,0x48(%eax)
			proc_array[p].waiting_proc = current->p_pid;			
  1001f6:	8b 00                	mov    (%eax),%eax
  1001f8:	89 82 b0 91 10 00    	mov    %eax,0x1091b0(%edx)
		}
		schedule();
  1001fe:	e8 89 fe ff ff       	call   10008c <schedule>
  100203:	eb fe                	jmp    100203 <interrupt+0x148>

00100205 <start>:
 *
 *****************************************************************************/

void
start(void)
{
  100205:	53                   	push   %ebx
  100206:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  100209:	68 40 05 00 00       	push   $0x540
  10020e:	6a 00                	push   $0x0
  100210:	68 60 91 10 00       	push   $0x109160
  100215:	e8 4a 03 00 00       	call   100564 <memset>
  10021a:	b8 60 91 10 00       	mov    $0x109160,%eax
  10021f:	31 d2                	xor    %edx,%edx
  100221:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  100224:	89 10                	mov    %edx,(%eax)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100226:	42                   	inc    %edx
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  100227:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
		proc_array[i].waiting_proc = 0;
  10022e:	c7 40 50 00 00 00 00 	movl   $0x0,0x50(%eax)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  100235:	83 c0 54             	add    $0x54,%eax
  100238:	83 fa 10             	cmp    $0x10,%edx
  10023b:	75 e7                	jne    100224 <start+0x1f>
		proc_array[i].p_state = P_EMPTY;
		proc_array[i].waiting_proc = 0;
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  10023d:	c7 05 08 9f 10 00 b4 	movl   $0x1091b4,0x109f08
  100244:	91 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  100247:	e8 74 00 00 00       	call   1002c0 <segments_init>
	special_registers_init(current);
  10024c:	83 ec 0c             	sub    $0xc,%esp
  10024f:	ff 35 08 9f 10 00    	pushl  0x109f08
  100255:	e8 e5 01 00 00       	call   10043f <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  10025a:	e8 30 01 00 00       	call   10038f <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  10025f:	83 c4 0c             	add    $0xc,%esp
  100262:	68 f4 09 10 00       	push   $0x1009f4
  100267:	68 00 07 00 00       	push   $0x700
  10026c:	ff 35 00 00 06 00    	pushl  0x60000
  100272:	e8 4f 07 00 00       	call   1009c6 <console_printf>
  100277:	83 c4 10             	add    $0x10,%esp
  10027a:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  10027f:	e8 4e 01 00 00       	call   1003d2 <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  100284:	8d 58 ff             	lea    -0x1(%eax),%ebx
  100287:	83 fb 01             	cmp    $0x1,%ebx
  10028a:	77 f3                	ja     10027f <start+0x7a>
	console_clear();
  10028c:	e8 fe 00 00 00       	call   10038f <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  100291:	50                   	push   %eax
  100292:	50                   	push   %eax
  100293:	a1 08 9f 10 00       	mov    0x109f08,%eax
  100298:	83 c0 34             	add    $0x34,%eax
  10029b:	50                   	push   %eax
  10029c:	53                   	push   %ebx
  10029d:	e8 d2 01 00 00       	call   100474 <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  1002a2:	a1 08 9f 10 00       	mov    0x109f08,%eax
  1002a7:	c7 40 40 00 00 2c 00 	movl   $0x2c0000,0x40(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  1002ae:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)

	// Switch to the main process using run().
	run(current);
  1002b5:	89 04 24             	mov    %eax,(%esp)
  1002b8:	e8 6b 01 00 00       	call   100428 <run>
  1002bd:	90                   	nop
  1002be:	90                   	nop
  1002bf:	90                   	nop

001002c0 <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002c0:	b8 a0 96 10 00       	mov    $0x1096a0,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002c5:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002ca:	89 c2                	mov    %eax,%edx
  1002cc:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  1002cf:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002d0:	bb 56 00 10 00       	mov    $0x100056,%ebx
  1002d5:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002d8:	66 a3 96 1a 10 00    	mov    %ax,0x101a96
  1002de:	c1 e8 18             	shr    $0x18,%eax
  1002e1:	88 15 98 1a 10 00    	mov    %dl,0x101a98
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002e7:	ba 08 97 10 00       	mov    $0x109708,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002ec:	a2 9b 1a 10 00       	mov    %al,0x101a9b
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002f1:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002f3:	66 c7 05 94 1a 10 00 	movw   $0x68,0x101a94
  1002fa:	68 00 
  1002fc:	c6 05 9a 1a 10 00 40 	movb   $0x40,0x101a9a
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  100303:	c6 05 99 1a 10 00 89 	movb   $0x89,0x101a99

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  10030a:	c7 05 a4 96 10 00 00 	movl   $0x80000,0x1096a4
  100311:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  100314:	66 c7 05 a8 96 10 00 	movw   $0x10,0x1096a8
  10031b:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  10031d:	66 89 0c c5 08 97 10 	mov    %cx,0x109708(,%eax,8)
  100324:	00 
  100325:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  10032c:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  100331:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  100336:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  10033b:	40                   	inc    %eax
  10033c:	3d 00 01 00 00       	cmp    $0x100,%eax
  100341:	75 da                	jne    10031d <segments_init+0x5d>
  100343:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  100347:	ba 08 97 10 00       	mov    $0x109708,%edx
  10034c:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  100353:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  10035a:	66 89 0c c5 08 97 10 	mov    %cx,0x109708(,%eax,8)
  100361:	00 
  100362:	c1 e9 10             	shr    $0x10,%ecx
  100365:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  10036a:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  10036f:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  100374:	40                   	inc    %eax
  100375:	83 f8 3a             	cmp    $0x3a,%eax
  100378:	75 d2                	jne    10034c <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  10037a:	b0 28                	mov    $0x28,%al
  10037c:	0f 01 15 5c 1a 10 00 	lgdtl  0x101a5c
  100383:	0f 00 d8             	ltr    %ax
  100386:	0f 01 1d 64 1a 10 00 	lidtl  0x101a64
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  10038d:	5b                   	pop    %ebx
  10038e:	c3                   	ret    

0010038f <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  10038f:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  100390:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  100392:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  100393:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  10039a:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  10039d:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  1003a4:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  1003a7:	40                   	inc    %eax
  1003a8:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  1003ad:	75 ee                	jne    10039d <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  1003af:	be d4 03 00 00       	mov    $0x3d4,%esi
  1003b4:	b0 0e                	mov    $0xe,%al
  1003b6:	89 f2                	mov    %esi,%edx
  1003b8:	ee                   	out    %al,(%dx)
  1003b9:	31 c9                	xor    %ecx,%ecx
  1003bb:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  1003c0:	88 c8                	mov    %cl,%al
  1003c2:	89 da                	mov    %ebx,%edx
  1003c4:	ee                   	out    %al,(%dx)
  1003c5:	b0 0f                	mov    $0xf,%al
  1003c7:	89 f2                	mov    %esi,%edx
  1003c9:	ee                   	out    %al,(%dx)
  1003ca:	88 c8                	mov    %cl,%al
  1003cc:	89 da                	mov    %ebx,%edx
  1003ce:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  1003cf:	5b                   	pop    %ebx
  1003d0:	5e                   	pop    %esi
  1003d1:	c3                   	ret    

001003d2 <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1003d2:	ba 64 00 00 00       	mov    $0x64,%edx
  1003d7:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  1003d8:	a8 01                	test   $0x1,%al
  1003da:	74 45                	je     100421 <console_read_digit+0x4f>
  1003dc:	b2 60                	mov    $0x60,%dl
  1003de:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  1003df:	8d 50 fe             	lea    -0x2(%eax),%edx
  1003e2:	80 fa 08             	cmp    $0x8,%dl
  1003e5:	77 05                	ja     1003ec <console_read_digit+0x1a>
		return data - 0x02 + 1;
  1003e7:	0f b6 c0             	movzbl %al,%eax
  1003ea:	48                   	dec    %eax
  1003eb:	c3                   	ret    
	else if (data == 0x0B)
  1003ec:	3c 0b                	cmp    $0xb,%al
  1003ee:	74 35                	je     100425 <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  1003f0:	8d 50 b9             	lea    -0x47(%eax),%edx
  1003f3:	80 fa 02             	cmp    $0x2,%dl
  1003f6:	77 07                	ja     1003ff <console_read_digit+0x2d>
		return data - 0x47 + 7;
  1003f8:	0f b6 c0             	movzbl %al,%eax
  1003fb:	83 e8 40             	sub    $0x40,%eax
  1003fe:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  1003ff:	8d 50 b5             	lea    -0x4b(%eax),%edx
  100402:	80 fa 02             	cmp    $0x2,%dl
  100405:	77 07                	ja     10040e <console_read_digit+0x3c>
		return data - 0x4B + 4;
  100407:	0f b6 c0             	movzbl %al,%eax
  10040a:	83 e8 47             	sub    $0x47,%eax
  10040d:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  10040e:	8d 50 b1             	lea    -0x4f(%eax),%edx
  100411:	80 fa 02             	cmp    $0x2,%dl
  100414:	77 07                	ja     10041d <console_read_digit+0x4b>
		return data - 0x4F + 1;
  100416:	0f b6 c0             	movzbl %al,%eax
  100419:	83 e8 4e             	sub    $0x4e,%eax
  10041c:	c3                   	ret    
	else if (data == 0x53)
  10041d:	3c 53                	cmp    $0x53,%al
  10041f:	74 04                	je     100425 <console_read_digit+0x53>
  100421:	83 c8 ff             	or     $0xffffffff,%eax
  100424:	c3                   	ret    
  100425:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  100427:	c3                   	ret    

00100428 <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  100428:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  10042c:	a3 08 9f 10 00       	mov    %eax,0x109f08

	asm volatile("movl %0,%%esp\n\t"
  100431:	83 c0 04             	add    $0x4,%eax
  100434:	89 c4                	mov    %eax,%esp
  100436:	61                   	popa   
  100437:	07                   	pop    %es
  100438:	1f                   	pop    %ds
  100439:	83 c4 08             	add    $0x8,%esp
  10043c:	cf                   	iret   
  10043d:	eb fe                	jmp    10043d <run+0x15>

0010043f <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  10043f:	53                   	push   %ebx
  100440:	83 ec 0c             	sub    $0xc,%esp
  100443:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  100447:	6a 44                	push   $0x44
  100449:	6a 00                	push   $0x0
  10044b:	8d 43 04             	lea    0x4(%ebx),%eax
  10044e:	50                   	push   %eax
  10044f:	e8 10 01 00 00       	call   100564 <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  100454:	66 c7 43 38 1b 00    	movw   $0x1b,0x38(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  10045a:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  100460:	66 c7 43 24 23 00    	movw   $0x23,0x24(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  100466:	66 c7 43 44 23 00    	movw   $0x23,0x44(%ebx)
}
  10046c:	83 c4 18             	add    $0x18,%esp
  10046f:	5b                   	pop    %ebx
  100470:	c3                   	ret    
  100471:	90                   	nop
  100472:	90                   	nop
  100473:	90                   	nop

00100474 <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  100474:	55                   	push   %ebp
  100475:	57                   	push   %edi
  100476:	56                   	push   %esi
  100477:	53                   	push   %ebx
  100478:	83 ec 1c             	sub    $0x1c,%esp
  10047b:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  10047f:	83 f8 01             	cmp    $0x1,%eax
  100482:	7f 04                	jg     100488 <program_loader+0x14>
  100484:	85 c0                	test   %eax,%eax
  100486:	79 02                	jns    10048a <program_loader+0x16>
  100488:	eb fe                	jmp    100488 <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  10048a:	8b 34 c5 9c 1a 10 00 	mov    0x101a9c(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  100491:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  100497:	74 02                	je     10049b <program_loader+0x27>
  100499:	eb fe                	jmp    100499 <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  10049b:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  10049e:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1004a2:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  1004a4:	c1 e5 05             	shl    $0x5,%ebp
  1004a7:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  1004aa:	eb 3f                	jmp    1004eb <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  1004ac:	83 3b 01             	cmpl   $0x1,(%ebx)
  1004af:	75 37                	jne    1004e8 <program_loader+0x74>
			copyseg((void *) ph->p_va,
  1004b1:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  1004b4:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  1004b7:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  1004ba:	01 c7                	add    %eax,%edi
	memsz += va;
  1004bc:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  1004be:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  1004c3:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  1004c7:	52                   	push   %edx
  1004c8:	89 fa                	mov    %edi,%edx
  1004ca:	29 c2                	sub    %eax,%edx
  1004cc:	52                   	push   %edx
  1004cd:	8b 53 04             	mov    0x4(%ebx),%edx
  1004d0:	01 f2                	add    %esi,%edx
  1004d2:	52                   	push   %edx
  1004d3:	50                   	push   %eax
  1004d4:	e8 27 00 00 00       	call   100500 <memcpy>
  1004d9:	83 c4 10             	add    $0x10,%esp
  1004dc:	eb 04                	jmp    1004e2 <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  1004de:	c6 07 00             	movb   $0x0,(%edi)
  1004e1:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  1004e2:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  1004e6:	72 f6                	jb     1004de <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  1004e8:	83 c3 20             	add    $0x20,%ebx
  1004eb:	39 eb                	cmp    %ebp,%ebx
  1004ed:	72 bd                	jb     1004ac <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  1004ef:	8b 56 18             	mov    0x18(%esi),%edx
  1004f2:	8b 44 24 34          	mov    0x34(%esp),%eax
  1004f6:	89 10                	mov    %edx,(%eax)
}
  1004f8:	83 c4 1c             	add    $0x1c,%esp
  1004fb:	5b                   	pop    %ebx
  1004fc:	5e                   	pop    %esi
  1004fd:	5f                   	pop    %edi
  1004fe:	5d                   	pop    %ebp
  1004ff:	c3                   	ret    

00100500 <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  100500:	56                   	push   %esi
  100501:	31 d2                	xor    %edx,%edx
  100503:	53                   	push   %ebx
  100504:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100508:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  10050c:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  100510:	eb 08                	jmp    10051a <memcpy+0x1a>
		*d++ = *s++;
  100512:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  100515:	4e                   	dec    %esi
  100516:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  100519:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  10051a:	85 f6                	test   %esi,%esi
  10051c:	75 f4                	jne    100512 <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  10051e:	5b                   	pop    %ebx
  10051f:	5e                   	pop    %esi
  100520:	c3                   	ret    

00100521 <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  100521:	57                   	push   %edi
  100522:	56                   	push   %esi
  100523:	53                   	push   %ebx
  100524:	8b 44 24 10          	mov    0x10(%esp),%eax
  100528:	8b 7c 24 14          	mov    0x14(%esp),%edi
  10052c:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  100530:	39 c7                	cmp    %eax,%edi
  100532:	73 26                	jae    10055a <memmove+0x39>
  100534:	8d 34 17             	lea    (%edi,%edx,1),%esi
  100537:	39 c6                	cmp    %eax,%esi
  100539:	76 1f                	jbe    10055a <memmove+0x39>
		s += n, d += n;
  10053b:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  10053e:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  100540:	eb 07                	jmp    100549 <memmove+0x28>
			*--d = *--s;
  100542:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  100545:	4a                   	dec    %edx
  100546:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  100549:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  10054a:	85 d2                	test   %edx,%edx
  10054c:	75 f4                	jne    100542 <memmove+0x21>
  10054e:	eb 10                	jmp    100560 <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  100550:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  100553:	4a                   	dec    %edx
  100554:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  100557:	41                   	inc    %ecx
  100558:	eb 02                	jmp    10055c <memmove+0x3b>
  10055a:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  10055c:	85 d2                	test   %edx,%edx
  10055e:	75 f0                	jne    100550 <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  100560:	5b                   	pop    %ebx
  100561:	5e                   	pop    %esi
  100562:	5f                   	pop    %edi
  100563:	c3                   	ret    

00100564 <memset>:

void *
memset(void *v, int c, size_t n)
{
  100564:	53                   	push   %ebx
  100565:	8b 44 24 08          	mov    0x8(%esp),%eax
  100569:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  10056d:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  100571:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  100573:	eb 04                	jmp    100579 <memset+0x15>
		*p++ = c;
  100575:	88 1a                	mov    %bl,(%edx)
  100577:	49                   	dec    %ecx
  100578:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  100579:	85 c9                	test   %ecx,%ecx
  10057b:	75 f8                	jne    100575 <memset+0x11>
		*p++ = c;
	return v;
}
  10057d:	5b                   	pop    %ebx
  10057e:	c3                   	ret    

0010057f <strlen>:

size_t
strlen(const char *s)
{
  10057f:	8b 54 24 04          	mov    0x4(%esp),%edx
  100583:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100585:	eb 01                	jmp    100588 <strlen+0x9>
		++n;
  100587:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100588:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  10058c:	75 f9                	jne    100587 <strlen+0x8>
		++n;
	return n;
}
  10058e:	c3                   	ret    

0010058f <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  10058f:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  100593:	31 c0                	xor    %eax,%eax
  100595:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100599:	eb 01                	jmp    10059c <strnlen+0xd>
		++n;
  10059b:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  10059c:	39 d0                	cmp    %edx,%eax
  10059e:	74 06                	je     1005a6 <strnlen+0x17>
  1005a0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  1005a4:	75 f5                	jne    10059b <strnlen+0xc>
		++n;
	return n;
}
  1005a6:	c3                   	ret    

001005a7 <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1005a7:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  1005a8:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1005ad:	53                   	push   %ebx
  1005ae:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  1005b0:	76 05                	jbe    1005b7 <console_putc+0x10>
  1005b2:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  1005b7:	80 fa 0a             	cmp    $0xa,%dl
  1005ba:	75 2c                	jne    1005e8 <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1005bc:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  1005c2:	be 50 00 00 00       	mov    $0x50,%esi
  1005c7:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  1005c9:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  1005cc:	99                   	cltd   
  1005cd:	f7 fe                	idiv   %esi
  1005cf:	89 de                	mov    %ebx,%esi
  1005d1:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  1005d3:	eb 07                	jmp    1005dc <console_putc+0x35>
			*cursor++ = ' ' | color;
  1005d5:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1005d8:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  1005d9:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  1005dc:	83 f8 50             	cmp    $0x50,%eax
  1005df:	75 f4                	jne    1005d5 <console_putc+0x2e>
  1005e1:	29 d0                	sub    %edx,%eax
  1005e3:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  1005e6:	eb 0b                	jmp    1005f3 <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  1005e8:	0f b6 d2             	movzbl %dl,%edx
  1005eb:	09 ca                	or     %ecx,%edx
  1005ed:	66 89 13             	mov    %dx,(%ebx)
  1005f0:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  1005f3:	5b                   	pop    %ebx
  1005f4:	5e                   	pop    %esi
  1005f5:	c3                   	ret    

001005f6 <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  1005f6:	56                   	push   %esi
  1005f7:	53                   	push   %ebx
  1005f8:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  1005fc:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1005ff:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  100603:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  100608:	75 04                	jne    10060e <fill_numbuf+0x18>
  10060a:	85 d2                	test   %edx,%edx
  10060c:	74 10                	je     10061e <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  10060e:	89 d0                	mov    %edx,%eax
  100610:	31 d2                	xor    %edx,%edx
  100612:	f7 f1                	div    %ecx
  100614:	4b                   	dec    %ebx
  100615:	8a 14 16             	mov    (%esi,%edx,1),%dl
  100618:	88 13                	mov    %dl,(%ebx)
			val /= base;
  10061a:	89 c2                	mov    %eax,%edx
  10061c:	eb ec                	jmp    10060a <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  10061e:	89 d8                	mov    %ebx,%eax
  100620:	5b                   	pop    %ebx
  100621:	5e                   	pop    %esi
  100622:	c3                   	ret    

00100623 <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  100623:	55                   	push   %ebp
  100624:	57                   	push   %edi
  100625:	56                   	push   %esi
  100626:	53                   	push   %ebx
  100627:	83 ec 38             	sub    $0x38,%esp
  10062a:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  10062e:	8b 7c 24 54          	mov    0x54(%esp),%edi
  100632:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  100636:	e9 60 03 00 00       	jmp    10099b <console_vprintf+0x378>
		if (*format != '%') {
  10063b:	80 fa 25             	cmp    $0x25,%dl
  10063e:	74 13                	je     100653 <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  100640:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100644:	0f b6 d2             	movzbl %dl,%edx
  100647:	89 f0                	mov    %esi,%eax
  100649:	e8 59 ff ff ff       	call   1005a7 <console_putc>
  10064e:	e9 45 03 00 00       	jmp    100998 <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100653:	47                   	inc    %edi
  100654:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  10065b:	00 
  10065c:	eb 12                	jmp    100670 <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  10065e:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  10065f:	8a 11                	mov    (%ecx),%dl
  100661:	84 d2                	test   %dl,%dl
  100663:	74 1a                	je     10067f <console_vprintf+0x5c>
  100665:	89 e8                	mov    %ebp,%eax
  100667:	38 c2                	cmp    %al,%dl
  100669:	75 f3                	jne    10065e <console_vprintf+0x3b>
  10066b:	e9 3f 03 00 00       	jmp    1009af <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100670:	8a 17                	mov    (%edi),%dl
  100672:	84 d2                	test   %dl,%dl
  100674:	74 0b                	je     100681 <console_vprintf+0x5e>
  100676:	b9 28 0a 10 00       	mov    $0x100a28,%ecx
  10067b:	89 d5                	mov    %edx,%ebp
  10067d:	eb e0                	jmp    10065f <console_vprintf+0x3c>
  10067f:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  100681:	8d 42 cf             	lea    -0x31(%edx),%eax
  100684:	3c 08                	cmp    $0x8,%al
  100686:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  10068d:	00 
  10068e:	76 13                	jbe    1006a3 <console_vprintf+0x80>
  100690:	eb 1d                	jmp    1006af <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  100692:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  100697:	0f be c0             	movsbl %al,%eax
  10069a:	47                   	inc    %edi
  10069b:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  10069f:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  1006a3:	8a 07                	mov    (%edi),%al
  1006a5:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006a8:	80 fa 09             	cmp    $0x9,%dl
  1006ab:	76 e5                	jbe    100692 <console_vprintf+0x6f>
  1006ad:	eb 18                	jmp    1006c7 <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  1006af:	80 fa 2a             	cmp    $0x2a,%dl
  1006b2:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  1006b9:	ff 
  1006ba:	75 0b                	jne    1006c7 <console_vprintf+0xa4>
			width = va_arg(val, int);
  1006bc:	83 c3 04             	add    $0x4,%ebx
			++format;
  1006bf:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  1006c0:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1006c3:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  1006c7:	83 cd ff             	or     $0xffffffff,%ebp
  1006ca:	80 3f 2e             	cmpb   $0x2e,(%edi)
  1006cd:	75 37                	jne    100706 <console_vprintf+0xe3>
			++format;
  1006cf:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  1006d0:	31 ed                	xor    %ebp,%ebp
  1006d2:	8a 07                	mov    (%edi),%al
  1006d4:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006d7:	80 fa 09             	cmp    $0x9,%dl
  1006da:	76 0d                	jbe    1006e9 <console_vprintf+0xc6>
  1006dc:	eb 17                	jmp    1006f5 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  1006de:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  1006e1:	0f be c0             	movsbl %al,%eax
  1006e4:	47                   	inc    %edi
  1006e5:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  1006e9:	8a 07                	mov    (%edi),%al
  1006eb:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006ee:	80 fa 09             	cmp    $0x9,%dl
  1006f1:	76 eb                	jbe    1006de <console_vprintf+0xbb>
  1006f3:	eb 11                	jmp    100706 <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  1006f5:	3c 2a                	cmp    $0x2a,%al
  1006f7:	75 0b                	jne    100704 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  1006f9:	83 c3 04             	add    $0x4,%ebx
				++format;
  1006fc:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  1006fd:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  100700:	85 ed                	test   %ebp,%ebp
  100702:	79 02                	jns    100706 <console_vprintf+0xe3>
  100704:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  100706:	8a 07                	mov    (%edi),%al
  100708:	3c 64                	cmp    $0x64,%al
  10070a:	74 34                	je     100740 <console_vprintf+0x11d>
  10070c:	7f 1d                	jg     10072b <console_vprintf+0x108>
  10070e:	3c 58                	cmp    $0x58,%al
  100710:	0f 84 a2 00 00 00    	je     1007b8 <console_vprintf+0x195>
  100716:	3c 63                	cmp    $0x63,%al
  100718:	0f 84 bf 00 00 00    	je     1007dd <console_vprintf+0x1ba>
  10071e:	3c 43                	cmp    $0x43,%al
  100720:	0f 85 d0 00 00 00    	jne    1007f6 <console_vprintf+0x1d3>
  100726:	e9 a3 00 00 00       	jmp    1007ce <console_vprintf+0x1ab>
  10072b:	3c 75                	cmp    $0x75,%al
  10072d:	74 4d                	je     10077c <console_vprintf+0x159>
  10072f:	3c 78                	cmp    $0x78,%al
  100731:	74 5c                	je     10078f <console_vprintf+0x16c>
  100733:	3c 73                	cmp    $0x73,%al
  100735:	0f 85 bb 00 00 00    	jne    1007f6 <console_vprintf+0x1d3>
  10073b:	e9 86 00 00 00       	jmp    1007c6 <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  100740:	83 c3 04             	add    $0x4,%ebx
  100743:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  100746:	89 d1                	mov    %edx,%ecx
  100748:	c1 f9 1f             	sar    $0x1f,%ecx
  10074b:	89 0c 24             	mov    %ecx,(%esp)
  10074e:	31 ca                	xor    %ecx,%edx
  100750:	55                   	push   %ebp
  100751:	29 ca                	sub    %ecx,%edx
  100753:	68 30 0a 10 00       	push   $0x100a30
  100758:	b9 0a 00 00 00       	mov    $0xa,%ecx
  10075d:	8d 44 24 40          	lea    0x40(%esp),%eax
  100761:	e8 90 fe ff ff       	call   1005f6 <fill_numbuf>
  100766:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  10076a:	58                   	pop    %eax
  10076b:	5a                   	pop    %edx
  10076c:	ba 01 00 00 00       	mov    $0x1,%edx
  100771:	8b 04 24             	mov    (%esp),%eax
  100774:	83 e0 01             	and    $0x1,%eax
  100777:	e9 a5 00 00 00       	jmp    100821 <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  10077c:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  10077f:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100784:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100787:	55                   	push   %ebp
  100788:	68 30 0a 10 00       	push   $0x100a30
  10078d:	eb 11                	jmp    1007a0 <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  10078f:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  100792:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100795:	55                   	push   %ebp
  100796:	68 44 0a 10 00       	push   $0x100a44
  10079b:	b9 10 00 00 00       	mov    $0x10,%ecx
  1007a0:	8d 44 24 40          	lea    0x40(%esp),%eax
  1007a4:	e8 4d fe ff ff       	call   1005f6 <fill_numbuf>
  1007a9:	ba 01 00 00 00       	mov    $0x1,%edx
  1007ae:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1007b2:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  1007b4:	59                   	pop    %ecx
  1007b5:	59                   	pop    %ecx
  1007b6:	eb 69                	jmp    100821 <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  1007b8:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  1007bb:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007be:	55                   	push   %ebp
  1007bf:	68 30 0a 10 00       	push   $0x100a30
  1007c4:	eb d5                	jmp    10079b <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  1007c6:	83 c3 04             	add    $0x4,%ebx
  1007c9:	8b 43 fc             	mov    -0x4(%ebx),%eax
  1007cc:	eb 40                	jmp    10080e <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  1007ce:	83 c3 04             	add    $0x4,%ebx
  1007d1:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007d4:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  1007d8:	e9 bd 01 00 00       	jmp    10099a <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1007dd:	83 c3 04             	add    $0x4,%ebx
  1007e0:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  1007e3:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  1007e7:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  1007ec:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1007f0:	88 44 24 24          	mov    %al,0x24(%esp)
  1007f4:	eb 27                	jmp    10081d <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  1007f6:	84 c0                	test   %al,%al
  1007f8:	75 02                	jne    1007fc <console_vprintf+0x1d9>
  1007fa:	b0 25                	mov    $0x25,%al
  1007fc:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  100800:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  100805:	80 3f 00             	cmpb   $0x0,(%edi)
  100808:	74 0a                	je     100814 <console_vprintf+0x1f1>
  10080a:	8d 44 24 24          	lea    0x24(%esp),%eax
  10080e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100812:	eb 09                	jmp    10081d <console_vprintf+0x1fa>
				format--;
  100814:	8d 54 24 24          	lea    0x24(%esp),%edx
  100818:	4f                   	dec    %edi
  100819:	89 54 24 04          	mov    %edx,0x4(%esp)
  10081d:	31 d2                	xor    %edx,%edx
  10081f:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100821:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  100823:	83 fd ff             	cmp    $0xffffffff,%ebp
  100826:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10082d:	74 1f                	je     10084e <console_vprintf+0x22b>
  10082f:	89 04 24             	mov    %eax,(%esp)
  100832:	eb 01                	jmp    100835 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  100834:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100835:	39 e9                	cmp    %ebp,%ecx
  100837:	74 0a                	je     100843 <console_vprintf+0x220>
  100839:	8b 44 24 04          	mov    0x4(%esp),%eax
  10083d:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  100841:	75 f1                	jne    100834 <console_vprintf+0x211>
  100843:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100846:	89 0c 24             	mov    %ecx,(%esp)
  100849:	eb 1f                	jmp    10086a <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  10084b:	42                   	inc    %edx
  10084c:	eb 09                	jmp    100857 <console_vprintf+0x234>
  10084e:	89 d1                	mov    %edx,%ecx
  100850:	8b 14 24             	mov    (%esp),%edx
  100853:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100857:	8b 44 24 04          	mov    0x4(%esp),%eax
  10085b:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  10085f:	75 ea                	jne    10084b <console_vprintf+0x228>
  100861:	8b 44 24 08          	mov    0x8(%esp),%eax
  100865:	89 14 24             	mov    %edx,(%esp)
  100868:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  10086a:	85 c0                	test   %eax,%eax
  10086c:	74 0c                	je     10087a <console_vprintf+0x257>
  10086e:	84 d2                	test   %dl,%dl
  100870:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  100877:	00 
  100878:	75 24                	jne    10089e <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  10087a:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  10087f:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  100886:	00 
  100887:	75 15                	jne    10089e <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  100889:	8b 44 24 14          	mov    0x14(%esp),%eax
  10088d:	83 e0 08             	and    $0x8,%eax
  100890:	83 f8 01             	cmp    $0x1,%eax
  100893:	19 c9                	sbb    %ecx,%ecx
  100895:	f7 d1                	not    %ecx
  100897:	83 e1 20             	and    $0x20,%ecx
  10089a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  10089e:	3b 2c 24             	cmp    (%esp),%ebp
  1008a1:	7e 0d                	jle    1008b0 <console_vprintf+0x28d>
  1008a3:	84 d2                	test   %dl,%dl
  1008a5:	74 40                	je     1008e7 <console_vprintf+0x2c4>
			zeros = precision - len;
  1008a7:	2b 2c 24             	sub    (%esp),%ebp
  1008aa:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  1008ae:	eb 3f                	jmp    1008ef <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008b0:	84 d2                	test   %dl,%dl
  1008b2:	74 33                	je     1008e7 <console_vprintf+0x2c4>
  1008b4:	8b 44 24 14          	mov    0x14(%esp),%eax
  1008b8:	83 e0 06             	and    $0x6,%eax
  1008bb:	83 f8 02             	cmp    $0x2,%eax
  1008be:	75 27                	jne    1008e7 <console_vprintf+0x2c4>
  1008c0:	45                   	inc    %ebp
  1008c1:	75 24                	jne    1008e7 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  1008c3:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008c5:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  1008c8:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1008cd:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008d0:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  1008d3:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  1008d7:	7d 0e                	jge    1008e7 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  1008d9:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1008dd:	29 ca                	sub    %ecx,%edx
  1008df:	29 c2                	sub    %eax,%edx
  1008e1:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008e5:	eb 08                	jmp    1008ef <console_vprintf+0x2cc>
  1008e7:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  1008ee:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008ef:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  1008f3:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008f5:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008f9:	2b 2c 24             	sub    (%esp),%ebp
  1008fc:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100901:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100904:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  100907:	29 c5                	sub    %eax,%ebp
  100909:	89 f0                	mov    %esi,%eax
  10090b:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  10090f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100913:	eb 0f                	jmp    100924 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  100915:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100919:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  10091e:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  10091f:	e8 83 fc ff ff       	call   1005a7 <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100924:	85 ed                	test   %ebp,%ebp
  100926:	7e 07                	jle    10092f <console_vprintf+0x30c>
  100928:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  10092d:	74 e6                	je     100915 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  10092f:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100934:	89 c6                	mov    %eax,%esi
  100936:	74 23                	je     10095b <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  100938:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  10093d:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100941:	e8 61 fc ff ff       	call   1005a7 <console_putc>
  100946:	89 c6                	mov    %eax,%esi
  100948:	eb 11                	jmp    10095b <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  10094a:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10094e:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100953:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  100954:	e8 4e fc ff ff       	call   1005a7 <console_putc>
  100959:	eb 06                	jmp    100961 <console_vprintf+0x33e>
  10095b:	89 f0                	mov    %esi,%eax
  10095d:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100961:	85 f6                	test   %esi,%esi
  100963:	7f e5                	jg     10094a <console_vprintf+0x327>
  100965:	8b 34 24             	mov    (%esp),%esi
  100968:	eb 15                	jmp    10097f <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  10096a:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  10096e:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  10096f:	0f b6 11             	movzbl (%ecx),%edx
  100972:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100976:	e8 2c fc ff ff       	call   1005a7 <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  10097b:	ff 44 24 04          	incl   0x4(%esp)
  10097f:	85 f6                	test   %esi,%esi
  100981:	7f e7                	jg     10096a <console_vprintf+0x347>
  100983:	eb 0f                	jmp    100994 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  100985:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100989:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  10098e:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  10098f:	e8 13 fc ff ff       	call   1005a7 <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100994:	85 ed                	test   %ebp,%ebp
  100996:	7f ed                	jg     100985 <console_vprintf+0x362>
  100998:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  10099a:	47                   	inc    %edi
  10099b:	8a 17                	mov    (%edi),%dl
  10099d:	84 d2                	test   %dl,%dl
  10099f:	0f 85 96 fc ff ff    	jne    10063b <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  1009a5:	83 c4 38             	add    $0x38,%esp
  1009a8:	89 f0                	mov    %esi,%eax
  1009aa:	5b                   	pop    %ebx
  1009ab:	5e                   	pop    %esi
  1009ac:	5f                   	pop    %edi
  1009ad:	5d                   	pop    %ebp
  1009ae:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  1009af:	81 e9 28 0a 10 00    	sub    $0x100a28,%ecx
  1009b5:	b8 01 00 00 00       	mov    $0x1,%eax
  1009ba:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  1009bc:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  1009bd:	09 44 24 14          	or     %eax,0x14(%esp)
  1009c1:	e9 aa fc ff ff       	jmp    100670 <console_vprintf+0x4d>

001009c6 <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  1009c6:	8d 44 24 10          	lea    0x10(%esp),%eax
  1009ca:	50                   	push   %eax
  1009cb:	ff 74 24 10          	pushl  0x10(%esp)
  1009cf:	ff 74 24 10          	pushl  0x10(%esp)
  1009d3:	ff 74 24 10          	pushl  0x10(%esp)
  1009d7:	e8 47 fc ff ff       	call   100623 <console_vprintf>
  1009dc:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  1009df:	c3                   	ret    
