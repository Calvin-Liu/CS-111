
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
  100014:	e8 43 02 00 00       	call   10025c <start>
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
  10005e:	e8 69 00 00 00       	call   1000cc <interrupt>

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
  10008a:	00 90 8b 44 24 04    	add    %dl,0x424448b(%eax)

0010008c <switch_proc_state>:
 *   New system calls are implemented by code in this function.
 *
 *****************************************************************************/

void switch_proc_state(process_t* state)
{
  10008c:	8b 44 24 04          	mov    0x4(%esp),%eax
	if(state->waiting_proc == 0)
		state->waiting_proc = 1;
  100090:	31 d2                	xor    %edx,%edx
  100092:	83 78 50 00          	cmpl   $0x0,0x50(%eax)
  100096:	0f 94 c2             	sete   %dl
  100099:	89 50 50             	mov    %edx,0x50(%eax)
	else
		state->waiting_proc = 0;
}
  10009c:	c3                   	ret    

0010009d <schedule>:
 *
 *****************************************************************************/

void
schedule(void)
{
  10009d:	83 ec 0c             	sub    $0xc,%esp
	pid_t pid = current->p_pid;
  1000a0:	a1 88 9c 10 00       	mov    0x109c88,%eax
	while (1) {
		pid = (pid + 1) % NPROCS;
  1000a5:	b9 10 00 00 00       	mov    $0x10,%ecx
 *****************************************************************************/

void
schedule(void)
{
	pid_t pid = current->p_pid;
  1000aa:	8b 10                	mov    (%eax),%edx
	while (1) {
		pid = (pid + 1) % NPROCS;
  1000ac:	8d 42 01             	lea    0x1(%edx),%eax
  1000af:	99                   	cltd   
  1000b0:	f7 f9                	idiv   %ecx
		if (proc_array[pid].p_state == P_RUNNABLE)
  1000b2:	6b c2 54             	imul   $0x54,%edx,%eax
  1000b5:	83 b8 28 8f 10 00 01 	cmpl   $0x1,0x108f28(%eax)
  1000bc:	75 ee                	jne    1000ac <schedule+0xf>
			run(&proc_array[pid]);
  1000be:	83 ec 0c             	sub    $0xc,%esp
  1000c1:	05 e0 8e 10 00       	add    $0x108ee0,%eax
  1000c6:	50                   	push   %eax
  1000c7:	e8 b0 03 00 00       	call   10047c <run>

001000cc <interrupt>:

int j = 1;

void
interrupt(registers_t *reg)
{
  1000cc:	55                   	push   %ebp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000cd:	b9 11 00 00 00       	mov    $0x11,%ecx

int j = 1;

void
interrupt(registers_t *reg)
{
  1000d2:	57                   	push   %edi
  1000d3:	56                   	push   %esi
  1000d4:	53                   	push   %ebx
  1000d5:	83 ec 1c             	sub    $0x1c,%esp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000d8:	8b 1d 88 9c 10 00    	mov    0x109c88,%ebx

int j = 1;

void
interrupt(registers_t *reg)
{
  1000de:	8b 44 24 30          	mov    0x30(%esp),%eax
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000e2:	8d 7b 04             	lea    0x4(%ebx),%edi
  1000e5:	89 c6                	mov    %eax,%esi
  1000e7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000e9:	8b 40 28             	mov    0x28(%eax),%eax
  1000ec:	83 e8 30             	sub    $0x30,%eax
  1000ef:	83 f8 04             	cmp    $0x4,%eax
  1000f2:	0f 87 62 01 00 00    	ja     10025a <interrupt+0x18e>
  1000f8:	ff 24 85 34 0a 10 00 	jmp    *0x100a34(,%eax,4)
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000ff:	8b 03                	mov    (%ebx),%eax
		run(current);
  100101:	83 ec 0c             	sub    $0xc,%esp
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  100104:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  100107:	53                   	push   %ebx
  100108:	e9 8f 00 00 00       	jmp    10019c <interrupt+0xd0>
  10010d:	b8 7c 8f 10 00       	mov    $0x108f7c,%eax
  100112:	ba 01 00 00 00       	mov    $0x1,%edx
do_fork(process_t *parent)
{
	pid_t k;
	for(k = 1; k < 16; k++)
	{
		if(proc_array[k].p_state == P_EMPTY)
  100117:	83 38 00             	cmpl   $0x0,(%eax)
  10011a:	75 68                	jne    100184 <interrupt+0xb8>
		{
			proc_array[k].p_state = P_RUNNABLE;
  10011c:	6b ea 54             	imul   $0x54,%edx,%ebp
			proc_array[k].p_registers = parent->p_registers;
  10011f:	b9 11 00 00 00       	mov    $0x11,%ecx
  100124:	8d 73 04             	lea    0x4(%ebx),%esi
  100127:	8d 85 e0 8e 10 00    	lea    0x108ee0(%ebp),%eax
  10012d:	89 c7                	mov    %eax,%edi
  10012f:	83 c7 04             	add    $0x4,%edi
  100132:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
  100134:	8b b5 e0 8e 10 00    	mov    0x108ee0(%ebp),%esi
	for(k = 1; k < 16; k++)
	{
		if(proc_array[k].p_state == P_EMPTY)
		{
			proc_array[k].p_state = P_RUNNABLE;
			proc_array[k].p_registers = parent->p_registers;
  10013a:	89 44 24 0c          	mov    %eax,0xc(%esp)

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR+src->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);
  10013e:	8b 03                	mov    (%ebx),%eax
	pid_t k;
	for(k = 1; k < 16; k++)
	{
		if(proc_array[k].p_state == P_EMPTY)
		{
			proc_array[k].p_state = P_RUNNABLE;
  100140:	c7 85 28 8f 10 00 01 	movl   $0x1,0x108f28(%ebp)
  100147:	00 00 00 
	// and then how to actually copy the stack.  (Hint: use memcpy.)
	// We have done one for you.

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR+src->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */
	src_stack_bottom = src->p_registers.reg_esp;
  10014a:	8b 4b 40             	mov    0x40(%ebx),%ecx
	
	offset_difference = (src_stack_top - src_stack_bottom);

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
  10014d:	83 c6 0a             	add    $0xa,%esi

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR+src->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);
  100150:	83 c0 0a             	add    $0xa,%eax
  100153:	c1 e0 12             	shl    $0x12,%eax

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
  100156:	57                   	push   %edi

	// YOUR CODE HERE!
	src_stack_top = PROC1_STACK_ADDR+src->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);
  100157:	29 c8                	sub    %ecx,%eax

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
  100159:	50                   	push   %eax
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
  10015a:	c1 e6 12             	shl    $0x12,%esi
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
  10015d:	51                   	push   %ecx
	src_stack_bottom = src->p_registers.reg_esp;
	
	offset_difference = (src_stack_top - src_stack_bottom);

	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
  10015e:	29 c6                	sub    %eax,%esi
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
  100160:	56                   	push   %esi
  100161:	89 54 24 18          	mov    %edx,0x18(%esp)
  100165:	e8 ea 03 00 00       	call   100554 <memcpy>
	dest->p_registers.reg_esp = dest_stack_bottom; 
  10016a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
		if(proc_array[k].p_state == P_EMPTY)
		{
			proc_array[k].p_state = P_RUNNABLE;
			proc_array[k].p_registers = parent->p_registers;
			copy_stack(&proc_array[k],parent);
			proc_array[k].p_registers.reg_eax = 0;
  10016e:	83 c4 10             	add    $0x10,%esp
  100171:	c7 85 00 8f 10 00 00 	movl   $0x0,0x108f00(%ebp)
  100178:	00 00 00 
  10017b:	8b 54 24 08          	mov    0x8(%esp),%edx
	dest_stack_top = PROC1_STACK_ADDR+dest->p_pid*PROC_STACK_SIZE; /* YOUR CODE HERE */;
	dest_stack_bottom = (dest_stack_top - offset_difference); /* YOUR CODE HERE: calculate based on the
				 other variables */
	// YOUR CODE HERE: memcpy the stack and set dest->p_registers.reg_esp
	memcpy((void*)dest_stack_bottom, (void*)src_stack_bottom, offset_difference);
	dest->p_registers.reg_esp = dest_stack_bottom; 
  10017f:	89 70 40             	mov    %esi,0x40(%eax)
  100182:	eb 0c                	jmp    100190 <interrupt+0xc4>

static pid_t
do_fork(process_t *parent)
{
	pid_t k;
	for(k = 1; k < 16; k++)
  100184:	42                   	inc    %edx
  100185:	83 c0 54             	add    $0x54,%eax
  100188:	83 fa 10             	cmp    $0x10,%edx
  10018b:	75 8a                	jne    100117 <interrupt+0x4b>
  10018d:	83 ca ff             	or     $0xffffffff,%edx
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  100190:	89 53 20             	mov    %edx,0x20(%ebx)
		run(current);
  100193:	83 ec 0c             	sub    $0xc,%esp
  100196:	ff 35 88 9c 10 00    	pushl  0x109c88
  10019c:	e8 db 02 00 00       	call   10047c <run>
	case INT_SYS_YIELD:
		// The 'sys_yield' system call asks the kernel to schedule a
		// different process.  (MiniprocOS is cooperatively
		// scheduled, so we need a special system call to do this.)
		// The schedule() function picks another process and runs it.
		schedule();
  1001a1:	e8 f7 fe ff ff       	call   10009d <schedule>
  1001a6:	a1 ac 1a 10 00       	mov    0x101aac,%eax
  1001ab:	6b d0 54             	imul   $0x54,%eax,%edx
  1001ae:	81 c2 30 8f 10 00    	add    $0x108f30,%edx
  1001b4:	eb 2f                	jmp    1001e5 <interrupt+0x119>
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		while(j < 16)
		{
			if(proc_array[j].waiting_proc == 1)
  1001b6:	8b 1a                	mov    (%edx),%ebx
  1001b8:	40                   	inc    %eax
  1001b9:	83 c2 54             	add    $0x54,%edx
  1001bc:	4b                   	dec    %ebx
  1001bd:	75 26                	jne    1001e5 <interrupt+0x119>
			{
				proc_array[j].p_state = P_RUNNABLE;
  1001bf:	6b c1 54             	imul   $0x54,%ecx,%eax
 *****************************************************************************/

void switch_proc_state(process_t* state)
{
	if(state->waiting_proc == 0)
		state->waiting_proc = 1;
  1001c2:	31 d2                	xor    %edx,%edx
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		while(j < 16)
		{
			if(proc_array[j].waiting_proc == 1)
  1001c4:	89 0d ac 1a 10 00    	mov    %ecx,0x101aac
			{
				proc_array[j].p_state = P_RUNNABLE;
  1001ca:	c7 80 28 8f 10 00 01 	movl   $0x1,0x108f28(%eax)
  1001d1:	00 00 00 
				switch_proc_state(&proc_array[j]);
  1001d4:	05 e0 8e 10 00       	add    $0x108ee0,%eax
 *****************************************************************************/

void switch_proc_state(process_t* state)
{
	if(state->waiting_proc == 0)
		state->waiting_proc = 1;
  1001d9:	83 78 50 00          	cmpl   $0x0,0x50(%eax)
  1001dd:	0f 94 c2             	sete   %dl
  1001e0:	89 50 50             	mov    %edx,0x50(%eax)
  1001e3:	eb 0c                	jmp    1001f1 <interrupt+0x125>
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		while(j < 16)
  1001e5:	83 f8 0f             	cmp    $0xf,%eax
void switch_proc_state(process_t* state)
{
	if(state->waiting_proc == 0)
		state->waiting_proc = 1;
	else
		state->waiting_proc = 0;
  1001e8:	89 c1                	mov    %eax,%ecx
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		while(j < 16)
  1001ea:	7e ca                	jle    1001b6 <interrupt+0xea>
  1001ec:	a3 ac 1a 10 00       	mov    %eax,0x101aac
				switch_proc_state(&proc_array[j]);
				break;
			}
			j++;
		}
		current->p_state = P_EMPTY;
  1001f1:	a1 88 9c 10 00       	mov    0x109c88,%eax
		current->p_exit_status = current->p_registers.reg_eax;
  1001f6:	8b 50 20             	mov    0x20(%eax),%edx
				switch_proc_state(&proc_array[j]);
				break;
			}
			j++;
		}
		current->p_state = P_EMPTY;
  1001f9:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
		current->p_exit_status = current->p_registers.reg_eax;
  100200:	89 50 4c             	mov    %edx,0x4c(%eax)
		schedule();
  100203:	e8 95 fe ff ff       	call   10009d <schedule>
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
  100208:	a1 88 9c 10 00       	mov    0x109c88,%eax
  10020d:	8b 50 20             	mov    0x20(%eax),%edx
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  100210:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100213:	83 f9 0e             	cmp    $0xe,%ecx
  100216:	77 11                	ja     100229 <interrupt+0x15d>
  100218:	3b 10                	cmp    (%eax),%edx
  10021a:	74 0d                	je     100229 <interrupt+0x15d>
		    || proc_array[p].p_state == P_EMPTY)
  10021c:	6b d2 54             	imul   $0x54,%edx,%edx
  10021f:	8b 8a 28 8f 10 00    	mov    0x108f28(%edx),%ecx
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  100225:	85 c9                	test   %ecx,%ecx
  100227:	75 09                	jne    100232 <interrupt+0x166>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
  100229:	c7 40 20 ff ff ff ff 	movl   $0xffffffff,0x20(%eax)
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  100230:	eb 23                	jmp    100255 <interrupt+0x189>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE)
  100232:	83 f9 03             	cmp    $0x3,%ecx
  100235:	75 0b                	jne    100242 <interrupt+0x176>
			current->p_registers.reg_eax = proc_array[p].p_exit_status;
  100237:	8b 92 2c 8f 10 00    	mov    0x108f2c(%edx),%edx
  10023d:	89 50 20             	mov    %edx,0x20(%eax)
  100240:	eb 13                	jmp    100255 <interrupt+0x189>
 *****************************************************************************/

void switch_proc_state(process_t* state)
{
	if(state->waiting_proc == 0)
		state->waiting_proc = 1;
  100242:	31 d2                	xor    %edx,%edx
  100244:	83 78 50 00          	cmpl   $0x0,0x50(%eax)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE)
			current->p_registers.reg_eax = proc_array[p].p_exit_status;
		else
		{
			current->p_registers.reg_eax = P_BLOCKED;//WAIT_TRYAGAIN;
  100248:	c7 40 20 02 00 00 00 	movl   $0x2,0x20(%eax)
 *****************************************************************************/

void switch_proc_state(process_t* state)
{
	if(state->waiting_proc == 0)
		state->waiting_proc = 1;
  10024f:	0f 94 c2             	sete   %dl
  100252:	89 50 50             	mov    %edx,0x50(%eax)
		else
		{
			current->p_registers.reg_eax = P_BLOCKED;//WAIT_TRYAGAIN;
			switch_proc_state(current);			
		}
		schedule();
  100255:	e8 43 fe ff ff       	call   10009d <schedule>
  10025a:	eb fe                	jmp    10025a <interrupt+0x18e>

0010025c <start>:
 *
 *****************************************************************************/

void
start(void)
{
  10025c:	53                   	push   %ebx
  10025d:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  100260:	68 40 05 00 00       	push   $0x540
  100265:	6a 00                	push   $0x0
  100267:	68 e0 8e 10 00       	push   $0x108ee0
  10026c:	e8 47 03 00 00       	call   1005b8 <memset>
  100271:	b8 e0 8e 10 00       	mov    $0x108ee0,%eax
  100276:	31 d2                	xor    %edx,%edx
  100278:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  10027b:	89 10                	mov    %edx,(%eax)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  10027d:	42                   	inc    %edx
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  10027e:	c7 40 48 00 00 00 00 	movl   $0x0,0x48(%eax)
		proc_array[i].waiting_proc = 0;
  100285:	c7 40 50 00 00 00 00 	movl   $0x0,0x50(%eax)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  10028c:	83 c0 54             	add    $0x54,%eax
  10028f:	83 fa 10             	cmp    $0x10,%edx
  100292:	75 e7                	jne    10027b <start+0x1f>
		proc_array[i].p_state = P_EMPTY;
		proc_array[i].waiting_proc = 0;
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  100294:	c7 05 88 9c 10 00 34 	movl   $0x108f34,0x109c88
  10029b:	8f 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  10029e:	e8 71 00 00 00       	call   100314 <segments_init>
	special_registers_init(current);
  1002a3:	83 ec 0c             	sub    $0xc,%esp
  1002a6:	ff 35 88 9c 10 00    	pushl  0x109c88
  1002ac:	e8 e2 01 00 00       	call   100493 <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  1002b1:	e8 2d 01 00 00       	call   1003e3 <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  1002b6:	83 c4 0c             	add    $0xc,%esp
  1002b9:	68 48 0a 10 00       	push   $0x100a48
  1002be:	68 00 07 00 00       	push   $0x700
  1002c3:	ff 35 00 00 06 00    	pushl  0x60000
  1002c9:	e8 4c 07 00 00       	call   100a1a <console_printf>
  1002ce:	83 c4 10             	add    $0x10,%esp
  1002d1:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  1002d6:	e8 4b 01 00 00       	call   100426 <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  1002db:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1002de:	83 fb 01             	cmp    $0x1,%ebx
  1002e1:	77 f3                	ja     1002d6 <start+0x7a>
	console_clear();
  1002e3:	e8 fb 00 00 00       	call   1003e3 <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  1002e8:	50                   	push   %eax
  1002e9:	50                   	push   %eax
  1002ea:	a1 88 9c 10 00       	mov    0x109c88,%eax
  1002ef:	83 c0 34             	add    $0x34,%eax
  1002f2:	50                   	push   %eax
  1002f3:	53                   	push   %ebx
  1002f4:	e8 cf 01 00 00       	call   1004c8 <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  1002f9:	a1 88 9c 10 00       	mov    0x109c88,%eax
  1002fe:	c7 40 40 00 00 2c 00 	movl   $0x2c0000,0x40(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  100305:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)

	// Switch to the main process using run().
	run(current);
  10030c:	89 04 24             	mov    %eax,(%esp)
  10030f:	e8 68 01 00 00       	call   10047c <run>

00100314 <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100314:	b8 20 94 10 00       	mov    $0x109420,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100319:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  10031e:	89 c2                	mov    %eax,%edx
  100320:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  100323:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100324:	bb 56 00 10 00       	mov    $0x100056,%ebx
  100329:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  10032c:	66 a3 ea 1a 10 00    	mov    %ax,0x101aea
  100332:	c1 e8 18             	shr    $0x18,%eax
  100335:	88 15 ec 1a 10 00    	mov    %dl,0x101aec
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  10033b:	ba 88 94 10 00       	mov    $0x109488,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100340:	a2 ef 1a 10 00       	mov    %al,0x101aef
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100345:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100347:	66 c7 05 e8 1a 10 00 	movw   $0x68,0x101ae8
  10034e:	68 00 
  100350:	c6 05 ee 1a 10 00 40 	movb   $0x40,0x101aee
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  100357:	c6 05 ed 1a 10 00 89 	movb   $0x89,0x101aed

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  10035e:	c7 05 24 94 10 00 00 	movl   $0x80000,0x109424
  100365:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  100368:	66 c7 05 28 94 10 00 	movw   $0x10,0x109428
  10036f:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100371:	66 89 0c c5 88 94 10 	mov    %cx,0x109488(,%eax,8)
  100378:	00 
  100379:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  100380:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  100385:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  10038a:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  10038f:	40                   	inc    %eax
  100390:	3d 00 01 00 00       	cmp    $0x100,%eax
  100395:	75 da                	jne    100371 <segments_init+0x5d>
  100397:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  10039b:	ba 88 94 10 00       	mov    $0x109488,%edx
  1003a0:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  1003a7:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  1003ae:	66 89 0c c5 88 94 10 	mov    %cx,0x109488(,%eax,8)
  1003b5:	00 
  1003b6:	c1 e9 10             	shr    $0x10,%ecx
  1003b9:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  1003be:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  1003c3:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  1003c8:	40                   	inc    %eax
  1003c9:	83 f8 3a             	cmp    $0x3a,%eax
  1003cc:	75 d2                	jne    1003a0 <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  1003ce:	b0 28                	mov    $0x28,%al
  1003d0:	0f 01 15 b0 1a 10 00 	lgdtl  0x101ab0
  1003d7:	0f 00 d8             	ltr    %ax
  1003da:	0f 01 1d b8 1a 10 00 	lidtl  0x101ab8
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  1003e1:	5b                   	pop    %ebx
  1003e2:	c3                   	ret    

001003e3 <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  1003e3:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  1003e4:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  1003e6:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  1003e7:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  1003ee:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  1003f1:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  1003f8:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  1003fb:	40                   	inc    %eax
  1003fc:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  100401:	75 ee                	jne    1003f1 <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  100403:	be d4 03 00 00       	mov    $0x3d4,%esi
  100408:	b0 0e                	mov    $0xe,%al
  10040a:	89 f2                	mov    %esi,%edx
  10040c:	ee                   	out    %al,(%dx)
  10040d:	31 c9                	xor    %ecx,%ecx
  10040f:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  100414:	88 c8                	mov    %cl,%al
  100416:	89 da                	mov    %ebx,%edx
  100418:	ee                   	out    %al,(%dx)
  100419:	b0 0f                	mov    $0xf,%al
  10041b:	89 f2                	mov    %esi,%edx
  10041d:	ee                   	out    %al,(%dx)
  10041e:	88 c8                	mov    %cl,%al
  100420:	89 da                	mov    %ebx,%edx
  100422:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  100423:	5b                   	pop    %ebx
  100424:	5e                   	pop    %esi
  100425:	c3                   	ret    

00100426 <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  100426:	ba 64 00 00 00       	mov    $0x64,%edx
  10042b:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  10042c:	a8 01                	test   $0x1,%al
  10042e:	74 45                	je     100475 <console_read_digit+0x4f>
  100430:	b2 60                	mov    $0x60,%dl
  100432:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  100433:	8d 50 fe             	lea    -0x2(%eax),%edx
  100436:	80 fa 08             	cmp    $0x8,%dl
  100439:	77 05                	ja     100440 <console_read_digit+0x1a>
		return data - 0x02 + 1;
  10043b:	0f b6 c0             	movzbl %al,%eax
  10043e:	48                   	dec    %eax
  10043f:	c3                   	ret    
	else if (data == 0x0B)
  100440:	3c 0b                	cmp    $0xb,%al
  100442:	74 35                	je     100479 <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  100444:	8d 50 b9             	lea    -0x47(%eax),%edx
  100447:	80 fa 02             	cmp    $0x2,%dl
  10044a:	77 07                	ja     100453 <console_read_digit+0x2d>
		return data - 0x47 + 7;
  10044c:	0f b6 c0             	movzbl %al,%eax
  10044f:	83 e8 40             	sub    $0x40,%eax
  100452:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  100453:	8d 50 b5             	lea    -0x4b(%eax),%edx
  100456:	80 fa 02             	cmp    $0x2,%dl
  100459:	77 07                	ja     100462 <console_read_digit+0x3c>
		return data - 0x4B + 4;
  10045b:	0f b6 c0             	movzbl %al,%eax
  10045e:	83 e8 47             	sub    $0x47,%eax
  100461:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  100462:	8d 50 b1             	lea    -0x4f(%eax),%edx
  100465:	80 fa 02             	cmp    $0x2,%dl
  100468:	77 07                	ja     100471 <console_read_digit+0x4b>
		return data - 0x4F + 1;
  10046a:	0f b6 c0             	movzbl %al,%eax
  10046d:	83 e8 4e             	sub    $0x4e,%eax
  100470:	c3                   	ret    
	else if (data == 0x53)
  100471:	3c 53                	cmp    $0x53,%al
  100473:	74 04                	je     100479 <console_read_digit+0x53>
  100475:	83 c8 ff             	or     $0xffffffff,%eax
  100478:	c3                   	ret    
  100479:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  10047b:	c3                   	ret    

0010047c <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  10047c:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  100480:	a3 88 9c 10 00       	mov    %eax,0x109c88

	asm volatile("movl %0,%%esp\n\t"
  100485:	83 c0 04             	add    $0x4,%eax
  100488:	89 c4                	mov    %eax,%esp
  10048a:	61                   	popa   
  10048b:	07                   	pop    %es
  10048c:	1f                   	pop    %ds
  10048d:	83 c4 08             	add    $0x8,%esp
  100490:	cf                   	iret   
  100491:	eb fe                	jmp    100491 <run+0x15>

00100493 <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  100493:	53                   	push   %ebx
  100494:	83 ec 0c             	sub    $0xc,%esp
  100497:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  10049b:	6a 44                	push   $0x44
  10049d:	6a 00                	push   $0x0
  10049f:	8d 43 04             	lea    0x4(%ebx),%eax
  1004a2:	50                   	push   %eax
  1004a3:	e8 10 01 00 00       	call   1005b8 <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  1004a8:	66 c7 43 38 1b 00    	movw   $0x1b,0x38(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  1004ae:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  1004b4:	66 c7 43 24 23 00    	movw   $0x23,0x24(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  1004ba:	66 c7 43 44 23 00    	movw   $0x23,0x44(%ebx)
}
  1004c0:	83 c4 18             	add    $0x18,%esp
  1004c3:	5b                   	pop    %ebx
  1004c4:	c3                   	ret    
  1004c5:	90                   	nop
  1004c6:	90                   	nop
  1004c7:	90                   	nop

001004c8 <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  1004c8:	55                   	push   %ebp
  1004c9:	57                   	push   %edi
  1004ca:	56                   	push   %esi
  1004cb:	53                   	push   %ebx
  1004cc:	83 ec 1c             	sub    $0x1c,%esp
  1004cf:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  1004d3:	83 f8 01             	cmp    $0x1,%eax
  1004d6:	7f 04                	jg     1004dc <program_loader+0x14>
  1004d8:	85 c0                	test   %eax,%eax
  1004da:	79 02                	jns    1004de <program_loader+0x16>
  1004dc:	eb fe                	jmp    1004dc <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  1004de:	8b 34 c5 f0 1a 10 00 	mov    0x101af0(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  1004e5:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  1004eb:	74 02                	je     1004ef <program_loader+0x27>
  1004ed:	eb fe                	jmp    1004ed <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1004ef:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  1004f2:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  1004f6:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  1004f8:	c1 e5 05             	shl    $0x5,%ebp
  1004fb:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  1004fe:	eb 3f                	jmp    10053f <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  100500:	83 3b 01             	cmpl   $0x1,(%ebx)
  100503:	75 37                	jne    10053c <program_loader+0x74>
			copyseg((void *) ph->p_va,
  100505:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  100508:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  10050b:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  10050e:	01 c7                	add    %eax,%edi
	memsz += va;
  100510:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  100512:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  100517:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  10051b:	52                   	push   %edx
  10051c:	89 fa                	mov    %edi,%edx
  10051e:	29 c2                	sub    %eax,%edx
  100520:	52                   	push   %edx
  100521:	8b 53 04             	mov    0x4(%ebx),%edx
  100524:	01 f2                	add    %esi,%edx
  100526:	52                   	push   %edx
  100527:	50                   	push   %eax
  100528:	e8 27 00 00 00       	call   100554 <memcpy>
  10052d:	83 c4 10             	add    $0x10,%esp
  100530:	eb 04                	jmp    100536 <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  100532:	c6 07 00             	movb   $0x0,(%edi)
  100535:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  100536:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  10053a:	72 f6                	jb     100532 <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  10053c:	83 c3 20             	add    $0x20,%ebx
  10053f:	39 eb                	cmp    %ebp,%ebx
  100541:	72 bd                	jb     100500 <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  100543:	8b 56 18             	mov    0x18(%esi),%edx
  100546:	8b 44 24 34          	mov    0x34(%esp),%eax
  10054a:	89 10                	mov    %edx,(%eax)
}
  10054c:	83 c4 1c             	add    $0x1c,%esp
  10054f:	5b                   	pop    %ebx
  100550:	5e                   	pop    %esi
  100551:	5f                   	pop    %edi
  100552:	5d                   	pop    %ebp
  100553:	c3                   	ret    

00100554 <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  100554:	56                   	push   %esi
  100555:	31 d2                	xor    %edx,%edx
  100557:	53                   	push   %ebx
  100558:	8b 44 24 0c          	mov    0xc(%esp),%eax
  10055c:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  100560:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  100564:	eb 08                	jmp    10056e <memcpy+0x1a>
		*d++ = *s++;
  100566:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  100569:	4e                   	dec    %esi
  10056a:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  10056d:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  10056e:	85 f6                	test   %esi,%esi
  100570:	75 f4                	jne    100566 <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  100572:	5b                   	pop    %ebx
  100573:	5e                   	pop    %esi
  100574:	c3                   	ret    

00100575 <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  100575:	57                   	push   %edi
  100576:	56                   	push   %esi
  100577:	53                   	push   %ebx
  100578:	8b 44 24 10          	mov    0x10(%esp),%eax
  10057c:	8b 7c 24 14          	mov    0x14(%esp),%edi
  100580:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  100584:	39 c7                	cmp    %eax,%edi
  100586:	73 26                	jae    1005ae <memmove+0x39>
  100588:	8d 34 17             	lea    (%edi,%edx,1),%esi
  10058b:	39 c6                	cmp    %eax,%esi
  10058d:	76 1f                	jbe    1005ae <memmove+0x39>
		s += n, d += n;
  10058f:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  100592:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  100594:	eb 07                	jmp    10059d <memmove+0x28>
			*--d = *--s;
  100596:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  100599:	4a                   	dec    %edx
  10059a:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  10059d:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  10059e:	85 d2                	test   %edx,%edx
  1005a0:	75 f4                	jne    100596 <memmove+0x21>
  1005a2:	eb 10                	jmp    1005b4 <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  1005a4:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  1005a7:	4a                   	dec    %edx
  1005a8:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  1005ab:	41                   	inc    %ecx
  1005ac:	eb 02                	jmp    1005b0 <memmove+0x3b>
  1005ae:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  1005b0:	85 d2                	test   %edx,%edx
  1005b2:	75 f0                	jne    1005a4 <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  1005b4:	5b                   	pop    %ebx
  1005b5:	5e                   	pop    %esi
  1005b6:	5f                   	pop    %edi
  1005b7:	c3                   	ret    

001005b8 <memset>:

void *
memset(void *v, int c, size_t n)
{
  1005b8:	53                   	push   %ebx
  1005b9:	8b 44 24 08          	mov    0x8(%esp),%eax
  1005bd:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  1005c1:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  1005c5:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  1005c7:	eb 04                	jmp    1005cd <memset+0x15>
		*p++ = c;
  1005c9:	88 1a                	mov    %bl,(%edx)
  1005cb:	49                   	dec    %ecx
  1005cc:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  1005cd:	85 c9                	test   %ecx,%ecx
  1005cf:	75 f8                	jne    1005c9 <memset+0x11>
		*p++ = c;
	return v;
}
  1005d1:	5b                   	pop    %ebx
  1005d2:	c3                   	ret    

001005d3 <strlen>:

size_t
strlen(const char *s)
{
  1005d3:	8b 54 24 04          	mov    0x4(%esp),%edx
  1005d7:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  1005d9:	eb 01                	jmp    1005dc <strlen+0x9>
		++n;
  1005db:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  1005dc:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  1005e0:	75 f9                	jne    1005db <strlen+0x8>
		++n;
	return n;
}
  1005e2:	c3                   	ret    

001005e3 <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  1005e3:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1005e7:	31 c0                	xor    %eax,%eax
  1005e9:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1005ed:	eb 01                	jmp    1005f0 <strnlen+0xd>
		++n;
  1005ef:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1005f0:	39 d0                	cmp    %edx,%eax
  1005f2:	74 06                	je     1005fa <strnlen+0x17>
  1005f4:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  1005f8:	75 f5                	jne    1005ef <strnlen+0xc>
		++n;
	return n;
}
  1005fa:	c3                   	ret    

001005fb <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  1005fb:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  1005fc:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  100601:	53                   	push   %ebx
  100602:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  100604:	76 05                	jbe    10060b <console_putc+0x10>
  100606:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  10060b:	80 fa 0a             	cmp    $0xa,%dl
  10060e:	75 2c                	jne    10063c <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  100610:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  100616:	be 50 00 00 00       	mov    $0x50,%esi
  10061b:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  10061d:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  100620:	99                   	cltd   
  100621:	f7 fe                	idiv   %esi
  100623:	89 de                	mov    %ebx,%esi
  100625:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  100627:	eb 07                	jmp    100630 <console_putc+0x35>
			*cursor++ = ' ' | color;
  100629:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  10062c:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  10062d:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  100630:	83 f8 50             	cmp    $0x50,%eax
  100633:	75 f4                	jne    100629 <console_putc+0x2e>
  100635:	29 d0                	sub    %edx,%eax
  100637:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  10063a:	eb 0b                	jmp    100647 <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  10063c:	0f b6 d2             	movzbl %dl,%edx
  10063f:	09 ca                	or     %ecx,%edx
  100641:	66 89 13             	mov    %dx,(%ebx)
  100644:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  100647:	5b                   	pop    %ebx
  100648:	5e                   	pop    %esi
  100649:	c3                   	ret    

0010064a <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  10064a:	56                   	push   %esi
  10064b:	53                   	push   %ebx
  10064c:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  100650:	8d 58 ff             	lea    -0x1(%eax),%ebx
  100653:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  100657:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  10065c:	75 04                	jne    100662 <fill_numbuf+0x18>
  10065e:	85 d2                	test   %edx,%edx
  100660:	74 10                	je     100672 <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  100662:	89 d0                	mov    %edx,%eax
  100664:	31 d2                	xor    %edx,%edx
  100666:	f7 f1                	div    %ecx
  100668:	4b                   	dec    %ebx
  100669:	8a 14 16             	mov    (%esi,%edx,1),%dl
  10066c:	88 13                	mov    %dl,(%ebx)
			val /= base;
  10066e:	89 c2                	mov    %eax,%edx
  100670:	eb ec                	jmp    10065e <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  100672:	89 d8                	mov    %ebx,%eax
  100674:	5b                   	pop    %ebx
  100675:	5e                   	pop    %esi
  100676:	c3                   	ret    

00100677 <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  100677:	55                   	push   %ebp
  100678:	57                   	push   %edi
  100679:	56                   	push   %esi
  10067a:	53                   	push   %ebx
  10067b:	83 ec 38             	sub    $0x38,%esp
  10067e:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  100682:	8b 7c 24 54          	mov    0x54(%esp),%edi
  100686:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  10068a:	e9 60 03 00 00       	jmp    1009ef <console_vprintf+0x378>
		if (*format != '%') {
  10068f:	80 fa 25             	cmp    $0x25,%dl
  100692:	74 13                	je     1006a7 <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  100694:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100698:	0f b6 d2             	movzbl %dl,%edx
  10069b:	89 f0                	mov    %esi,%eax
  10069d:	e8 59 ff ff ff       	call   1005fb <console_putc>
  1006a2:	e9 45 03 00 00       	jmp    1009ec <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  1006a7:	47                   	inc    %edi
  1006a8:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  1006af:	00 
  1006b0:	eb 12                	jmp    1006c4 <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  1006b2:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  1006b3:	8a 11                	mov    (%ecx),%dl
  1006b5:	84 d2                	test   %dl,%dl
  1006b7:	74 1a                	je     1006d3 <console_vprintf+0x5c>
  1006b9:	89 e8                	mov    %ebp,%eax
  1006bb:	38 c2                	cmp    %al,%dl
  1006bd:	75 f3                	jne    1006b2 <console_vprintf+0x3b>
  1006bf:	e9 3f 03 00 00       	jmp    100a03 <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  1006c4:	8a 17                	mov    (%edi),%dl
  1006c6:	84 d2                	test   %dl,%dl
  1006c8:	74 0b                	je     1006d5 <console_vprintf+0x5e>
  1006ca:	b9 7c 0a 10 00       	mov    $0x100a7c,%ecx
  1006cf:	89 d5                	mov    %edx,%ebp
  1006d1:	eb e0                	jmp    1006b3 <console_vprintf+0x3c>
  1006d3:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  1006d5:	8d 42 cf             	lea    -0x31(%edx),%eax
  1006d8:	3c 08                	cmp    $0x8,%al
  1006da:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1006e1:	00 
  1006e2:	76 13                	jbe    1006f7 <console_vprintf+0x80>
  1006e4:	eb 1d                	jmp    100703 <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  1006e6:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  1006eb:	0f be c0             	movsbl %al,%eax
  1006ee:	47                   	inc    %edi
  1006ef:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  1006f3:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  1006f7:	8a 07                	mov    (%edi),%al
  1006f9:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006fc:	80 fa 09             	cmp    $0x9,%dl
  1006ff:	76 e5                	jbe    1006e6 <console_vprintf+0x6f>
  100701:	eb 18                	jmp    10071b <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  100703:	80 fa 2a             	cmp    $0x2a,%dl
  100706:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  10070d:	ff 
  10070e:	75 0b                	jne    10071b <console_vprintf+0xa4>
			width = va_arg(val, int);
  100710:	83 c3 04             	add    $0x4,%ebx
			++format;
  100713:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  100714:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100717:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  10071b:	83 cd ff             	or     $0xffffffff,%ebp
  10071e:	80 3f 2e             	cmpb   $0x2e,(%edi)
  100721:	75 37                	jne    10075a <console_vprintf+0xe3>
			++format;
  100723:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  100724:	31 ed                	xor    %ebp,%ebp
  100726:	8a 07                	mov    (%edi),%al
  100728:	8d 50 d0             	lea    -0x30(%eax),%edx
  10072b:	80 fa 09             	cmp    $0x9,%dl
  10072e:	76 0d                	jbe    10073d <console_vprintf+0xc6>
  100730:	eb 17                	jmp    100749 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  100732:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  100735:	0f be c0             	movsbl %al,%eax
  100738:	47                   	inc    %edi
  100739:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  10073d:	8a 07                	mov    (%edi),%al
  10073f:	8d 50 d0             	lea    -0x30(%eax),%edx
  100742:	80 fa 09             	cmp    $0x9,%dl
  100745:	76 eb                	jbe    100732 <console_vprintf+0xbb>
  100747:	eb 11                	jmp    10075a <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  100749:	3c 2a                	cmp    $0x2a,%al
  10074b:	75 0b                	jne    100758 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  10074d:	83 c3 04             	add    $0x4,%ebx
				++format;
  100750:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  100751:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  100754:	85 ed                	test   %ebp,%ebp
  100756:	79 02                	jns    10075a <console_vprintf+0xe3>
  100758:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  10075a:	8a 07                	mov    (%edi),%al
  10075c:	3c 64                	cmp    $0x64,%al
  10075e:	74 34                	je     100794 <console_vprintf+0x11d>
  100760:	7f 1d                	jg     10077f <console_vprintf+0x108>
  100762:	3c 58                	cmp    $0x58,%al
  100764:	0f 84 a2 00 00 00    	je     10080c <console_vprintf+0x195>
  10076a:	3c 63                	cmp    $0x63,%al
  10076c:	0f 84 bf 00 00 00    	je     100831 <console_vprintf+0x1ba>
  100772:	3c 43                	cmp    $0x43,%al
  100774:	0f 85 d0 00 00 00    	jne    10084a <console_vprintf+0x1d3>
  10077a:	e9 a3 00 00 00       	jmp    100822 <console_vprintf+0x1ab>
  10077f:	3c 75                	cmp    $0x75,%al
  100781:	74 4d                	je     1007d0 <console_vprintf+0x159>
  100783:	3c 78                	cmp    $0x78,%al
  100785:	74 5c                	je     1007e3 <console_vprintf+0x16c>
  100787:	3c 73                	cmp    $0x73,%al
  100789:	0f 85 bb 00 00 00    	jne    10084a <console_vprintf+0x1d3>
  10078f:	e9 86 00 00 00       	jmp    10081a <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  100794:	83 c3 04             	add    $0x4,%ebx
  100797:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  10079a:	89 d1                	mov    %edx,%ecx
  10079c:	c1 f9 1f             	sar    $0x1f,%ecx
  10079f:	89 0c 24             	mov    %ecx,(%esp)
  1007a2:	31 ca                	xor    %ecx,%edx
  1007a4:	55                   	push   %ebp
  1007a5:	29 ca                	sub    %ecx,%edx
  1007a7:	68 84 0a 10 00       	push   $0x100a84
  1007ac:	b9 0a 00 00 00       	mov    $0xa,%ecx
  1007b1:	8d 44 24 40          	lea    0x40(%esp),%eax
  1007b5:	e8 90 fe ff ff       	call   10064a <fill_numbuf>
  1007ba:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  1007be:	58                   	pop    %eax
  1007bf:	5a                   	pop    %edx
  1007c0:	ba 01 00 00 00       	mov    $0x1,%edx
  1007c5:	8b 04 24             	mov    (%esp),%eax
  1007c8:	83 e0 01             	and    $0x1,%eax
  1007cb:	e9 a5 00 00 00       	jmp    100875 <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  1007d0:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  1007d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
  1007d8:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007db:	55                   	push   %ebp
  1007dc:	68 84 0a 10 00       	push   $0x100a84
  1007e1:	eb 11                	jmp    1007f4 <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  1007e3:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  1007e6:	8b 53 fc             	mov    -0x4(%ebx),%edx
  1007e9:	55                   	push   %ebp
  1007ea:	68 98 0a 10 00       	push   $0x100a98
  1007ef:	b9 10 00 00 00       	mov    $0x10,%ecx
  1007f4:	8d 44 24 40          	lea    0x40(%esp),%eax
  1007f8:	e8 4d fe ff ff       	call   10064a <fill_numbuf>
  1007fd:	ba 01 00 00 00       	mov    $0x1,%edx
  100802:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100806:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  100808:	59                   	pop    %ecx
  100809:	59                   	pop    %ecx
  10080a:	eb 69                	jmp    100875 <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  10080c:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  10080f:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100812:	55                   	push   %ebp
  100813:	68 84 0a 10 00       	push   $0x100a84
  100818:	eb d5                	jmp    1007ef <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  10081a:	83 c3 04             	add    $0x4,%ebx
  10081d:	8b 43 fc             	mov    -0x4(%ebx),%eax
  100820:	eb 40                	jmp    100862 <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  100822:	83 c3 04             	add    $0x4,%ebx
  100825:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100828:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  10082c:	e9 bd 01 00 00       	jmp    1009ee <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  100831:	83 c3 04             	add    $0x4,%ebx
  100834:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  100837:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  10083b:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  100840:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  100844:	88 44 24 24          	mov    %al,0x24(%esp)
  100848:	eb 27                	jmp    100871 <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  10084a:	84 c0                	test   %al,%al
  10084c:	75 02                	jne    100850 <console_vprintf+0x1d9>
  10084e:	b0 25                	mov    $0x25,%al
  100850:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  100854:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  100859:	80 3f 00             	cmpb   $0x0,(%edi)
  10085c:	74 0a                	je     100868 <console_vprintf+0x1f1>
  10085e:	8d 44 24 24          	lea    0x24(%esp),%eax
  100862:	89 44 24 04          	mov    %eax,0x4(%esp)
  100866:	eb 09                	jmp    100871 <console_vprintf+0x1fa>
				format--;
  100868:	8d 54 24 24          	lea    0x24(%esp),%edx
  10086c:	4f                   	dec    %edi
  10086d:	89 54 24 04          	mov    %edx,0x4(%esp)
  100871:	31 d2                	xor    %edx,%edx
  100873:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100875:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  100877:	83 fd ff             	cmp    $0xffffffff,%ebp
  10087a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100881:	74 1f                	je     1008a2 <console_vprintf+0x22b>
  100883:	89 04 24             	mov    %eax,(%esp)
  100886:	eb 01                	jmp    100889 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  100888:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100889:	39 e9                	cmp    %ebp,%ecx
  10088b:	74 0a                	je     100897 <console_vprintf+0x220>
  10088d:	8b 44 24 04          	mov    0x4(%esp),%eax
  100891:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  100895:	75 f1                	jne    100888 <console_vprintf+0x211>
  100897:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  10089a:	89 0c 24             	mov    %ecx,(%esp)
  10089d:	eb 1f                	jmp    1008be <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  10089f:	42                   	inc    %edx
  1008a0:	eb 09                	jmp    1008ab <console_vprintf+0x234>
  1008a2:	89 d1                	mov    %edx,%ecx
  1008a4:	8b 14 24             	mov    (%esp),%edx
  1008a7:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  1008ab:	8b 44 24 04          	mov    0x4(%esp),%eax
  1008af:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  1008b3:	75 ea                	jne    10089f <console_vprintf+0x228>
  1008b5:	8b 44 24 08          	mov    0x8(%esp),%eax
  1008b9:	89 14 24             	mov    %edx,(%esp)
  1008bc:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  1008be:	85 c0                	test   %eax,%eax
  1008c0:	74 0c                	je     1008ce <console_vprintf+0x257>
  1008c2:	84 d2                	test   %dl,%dl
  1008c4:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  1008cb:	00 
  1008cc:	75 24                	jne    1008f2 <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  1008ce:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  1008d3:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  1008da:	00 
  1008db:	75 15                	jne    1008f2 <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  1008dd:	8b 44 24 14          	mov    0x14(%esp),%eax
  1008e1:	83 e0 08             	and    $0x8,%eax
  1008e4:	83 f8 01             	cmp    $0x1,%eax
  1008e7:	19 c9                	sbb    %ecx,%ecx
  1008e9:	f7 d1                	not    %ecx
  1008eb:	83 e1 20             	and    $0x20,%ecx
  1008ee:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  1008f2:	3b 2c 24             	cmp    (%esp),%ebp
  1008f5:	7e 0d                	jle    100904 <console_vprintf+0x28d>
  1008f7:	84 d2                	test   %dl,%dl
  1008f9:	74 40                	je     10093b <console_vprintf+0x2c4>
			zeros = precision - len;
  1008fb:	2b 2c 24             	sub    (%esp),%ebp
  1008fe:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  100902:	eb 3f                	jmp    100943 <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100904:	84 d2                	test   %dl,%dl
  100906:	74 33                	je     10093b <console_vprintf+0x2c4>
  100908:	8b 44 24 14          	mov    0x14(%esp),%eax
  10090c:	83 e0 06             	and    $0x6,%eax
  10090f:	83 f8 02             	cmp    $0x2,%eax
  100912:	75 27                	jne    10093b <console_vprintf+0x2c4>
  100914:	45                   	inc    %ebp
  100915:	75 24                	jne    10093b <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  100917:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100919:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  10091c:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100921:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100924:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  100927:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  10092b:	7d 0e                	jge    10093b <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  10092d:	8b 54 24 0c          	mov    0xc(%esp),%edx
  100931:	29 ca                	sub    %ecx,%edx
  100933:	29 c2                	sub    %eax,%edx
  100935:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100939:	eb 08                	jmp    100943 <console_vprintf+0x2cc>
  10093b:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  100942:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  100943:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  100947:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100949:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  10094d:	2b 2c 24             	sub    (%esp),%ebp
  100950:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100955:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100958:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  10095b:	29 c5                	sub    %eax,%ebp
  10095d:	89 f0                	mov    %esi,%eax
  10095f:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100963:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100967:	eb 0f                	jmp    100978 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  100969:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10096d:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100972:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  100973:	e8 83 fc ff ff       	call   1005fb <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  100978:	85 ed                	test   %ebp,%ebp
  10097a:	7e 07                	jle    100983 <console_vprintf+0x30c>
  10097c:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  100981:	74 e6                	je     100969 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  100983:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  100988:	89 c6                	mov    %eax,%esi
  10098a:	74 23                	je     1009af <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  10098c:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  100991:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100995:	e8 61 fc ff ff       	call   1005fb <console_putc>
  10099a:	89 c6                	mov    %eax,%esi
  10099c:	eb 11                	jmp    1009af <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  10099e:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009a2:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  1009a7:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  1009a8:	e8 4e fc ff ff       	call   1005fb <console_putc>
  1009ad:	eb 06                	jmp    1009b5 <console_vprintf+0x33e>
  1009af:	89 f0                	mov    %esi,%eax
  1009b1:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  1009b5:	85 f6                	test   %esi,%esi
  1009b7:	7f e5                	jg     10099e <console_vprintf+0x327>
  1009b9:	8b 34 24             	mov    (%esp),%esi
  1009bc:	eb 15                	jmp    1009d3 <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  1009be:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  1009c2:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  1009c3:	0f b6 11             	movzbl (%ecx),%edx
  1009c6:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009ca:	e8 2c fc ff ff       	call   1005fb <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  1009cf:	ff 44 24 04          	incl   0x4(%esp)
  1009d3:	85 f6                	test   %esi,%esi
  1009d5:	7f e7                	jg     1009be <console_vprintf+0x347>
  1009d7:	eb 0f                	jmp    1009e8 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  1009d9:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1009dd:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  1009e2:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  1009e3:	e8 13 fc ff ff       	call   1005fb <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  1009e8:	85 ed                	test   %ebp,%ebp
  1009ea:	7f ed                	jg     1009d9 <console_vprintf+0x362>
  1009ec:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  1009ee:	47                   	inc    %edi
  1009ef:	8a 17                	mov    (%edi),%dl
  1009f1:	84 d2                	test   %dl,%dl
  1009f3:	0f 85 96 fc ff ff    	jne    10068f <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  1009f9:	83 c4 38             	add    $0x38,%esp
  1009fc:	89 f0                	mov    %esi,%eax
  1009fe:	5b                   	pop    %ebx
  1009ff:	5e                   	pop    %esi
  100a00:	5f                   	pop    %edi
  100a01:	5d                   	pop    %ebp
  100a02:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100a03:	81 e9 7c 0a 10 00    	sub    $0x100a7c,%ecx
  100a09:	b8 01 00 00 00       	mov    $0x1,%eax
  100a0e:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100a10:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  100a11:	09 44 24 14          	or     %eax,0x14(%esp)
  100a15:	e9 aa fc ff ff       	jmp    1006c4 <console_vprintf+0x4d>

00100a1a <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  100a1a:	8d 44 24 10          	lea    0x10(%esp),%eax
  100a1e:	50                   	push   %eax
  100a1f:	ff 74 24 10          	pushl  0x10(%esp)
  100a23:	ff 74 24 10          	pushl  0x10(%esp)
  100a27:	ff 74 24 10          	pushl  0x10(%esp)
  100a2b:	e8 47 fc ff ff       	call   100677 <console_vprintf>
  100a30:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  100a33:	c3                   	ret    
