
obj/mpos-app:     file format elf32-i386


Disassembly of section .text:

00200000 <app_printf>:

static void app_printf(const char *format, ...) __attribute__((noinline));

static void
app_printf(const char *format, ...)
{
  200000:	83 ec 0c             	sub    $0xc,%esp
	// That means that after the "asm" instruction (which causes the
	// interrupt), the system call's return value is in the 'pid'
	// variable, and we can just return that value!

	pid_t pid;
	asm volatile("int %1\n"
  200003:	cd 30                	int    $0x30
static void
app_printf(const char *format, ...)
{
	// set default color based on currently running process
	int color = sys_getpid();
	if (color < 0)
  200005:	85 c0                	test   %eax,%eax
  200007:	ba 00 07 00 00       	mov    $0x700,%edx
  20000c:	78 13                	js     200021 <app_printf+0x21>
		color = 0x0700;
	else {
		static const uint8_t col[] = { 0x0E, 0x0F, 0x0C, 0x0A, 0x09 };
		color = col[color % sizeof(col)] << 8;
  20000e:	b9 05 00 00 00       	mov    $0x5,%ecx
  200013:	31 d2                	xor    %edx,%edx
  200015:	f7 f1                	div    %ecx
  200017:	0f b6 92 94 05 20 00 	movzbl 0x200594(%edx),%edx
  20001e:	c1 e2 08             	shl    $0x8,%edx
	}

	va_list val;
	va_start(val, format);
	cursorpos = console_vprintf(cursorpos, color, format, val);
  200021:	8d 44 24 14          	lea    0x14(%esp),%eax
  200025:	50                   	push   %eax
  200026:	ff 74 24 14          	pushl  0x14(%esp)
  20002a:	52                   	push   %edx
  20002b:	ff 35 00 00 06 00    	pushl  0x60000
  200031:	e8 89 01 00 00       	call   2001bf <console_vprintf>
  200036:	a3 00 00 06 00       	mov    %eax,0x60000
	va_end(val);
}
  20003b:	83 c4 1c             	add    $0x1c,%esp
  20003e:	c3                   	ret    

0020003f <run_child>:
	sys_exit(0);	
}

void
run_child(void)
{
  20003f:	83 ec 24             	sub    $0x24,%esp
	int i;
	volatile int checker = 1; /* This variable checks that you correctly
  200042:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%esp)
  200049:	00 
	// That means that after the "asm" instruction (which causes the
	// interrupt), the system call's return value is in the 'pid'
	// variable, and we can just return that value!

	pid_t pid;
	asm volatile("int %1\n"
  20004a:	cd 30                	int    $0x30
				     gave this process a new stack.
				     If the parent's 'checker' changed value
				     after the child ran, there's a problem! */

	app_printf("Child process %d!\n", sys_getpid());
  20004c:	50                   	push   %eax
  20004d:	68 7c 05 20 00       	push   $0x20057c
  200052:	e8 a9 ff ff ff       	call   200000 <app_printf>
  200057:	31 c0                	xor    %eax,%eax
  200059:	83 c4 10             	add    $0x10,%esp

static inline void
sys_yield(void)
{
	// This system call has no return values, so there's no '=a' clause.
	asm volatile("int %0\n"
  20005c:	cd 32                	int    $0x32

	// Yield a couple times to help people test Exercise 3
	for (i = 0; i < 20; i++)
  20005e:	40                   	inc    %eax
  20005f:	83 f8 14             	cmp    $0x14,%eax
  200062:	75 f8                	jne    20005c <run_child+0x1d>
	// the 'int' instruction.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.

	asm volatile("int %0\n"
  200064:	66 b8 e8 03          	mov    $0x3e8,%ax
  200068:	cd 33                	int    $0x33
  20006a:	eb fe                	jmp    20006a <run_child+0x2b>

0020006c <start>:

void run_child(void);

void
start(void)
{
  20006c:	83 ec 0c             	sub    $0xc,%esp
sys_fork(void)
{
	// This system call follows the same pattern as sys_getpid().

	pid_t result;
	asm volatile("int %1\n"
  20006f:	cd 31                	int    $0x31
	int x = 0;
	
	pid_t p = sys_fork();
	if (p == 0)
  200071:	83 f8 00             	cmp    $0x0,%eax
  200074:	ba 01 00 00 00       	mov    $0x1,%edx
  200079:	74 0a                	je     200085 <start+0x19>
		x++;	
	else if (p > 0)
  20007b:	7f 04                	jg     200081 <start+0x15>
  20007d:	30 d2                	xor    %dl,%dl
  20007f:	eb 04                	jmp    200085 <start+0x19>

static inline int
sys_wait(pid_t pid)
{
	int retval;
	asm volatile("int %1\n"
  200081:	cd 34                	int    $0x34
  200083:	31 d2                	xor    %edx,%edx
		sys_wait(p);
	app_printf("%d",x);
  200085:	50                   	push   %eax
  200086:	50                   	push   %eax
  200087:	52                   	push   %edx
  200088:	68 8f 05 20 00       	push   $0x20058f
  20008d:	e8 6e ff ff ff       	call   200000 <app_printf>
	// the 'int' instruction.
	// You can load other registers with similar syntax; specifically:
	//	"a" = %eax, "b" = %ebx, "c" = %ecx, "d" = %edx,
	//	"S" = %esi, "D" = %edi.

	asm volatile("int %0\n"
  200092:	31 c0                	xor    %eax,%eax
  200094:	cd 33                	int    $0x33
  200096:	83 c4 10             	add    $0x10,%esp
  200099:	eb fe                	jmp    200099 <start+0x2d>
  20009b:	90                   	nop

0020009c <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  20009c:	56                   	push   %esi
  20009d:	31 d2                	xor    %edx,%edx
  20009f:	53                   	push   %ebx
  2000a0:	8b 44 24 0c          	mov    0xc(%esp),%eax
  2000a4:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  2000a8:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  2000ac:	eb 08                	jmp    2000b6 <memcpy+0x1a>
		*d++ = *s++;
  2000ae:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  2000b1:	4e                   	dec    %esi
  2000b2:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  2000b5:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  2000b6:	85 f6                	test   %esi,%esi
  2000b8:	75 f4                	jne    2000ae <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  2000ba:	5b                   	pop    %ebx
  2000bb:	5e                   	pop    %esi
  2000bc:	c3                   	ret    

002000bd <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  2000bd:	57                   	push   %edi
  2000be:	56                   	push   %esi
  2000bf:	53                   	push   %ebx
  2000c0:	8b 44 24 10          	mov    0x10(%esp),%eax
  2000c4:	8b 7c 24 14          	mov    0x14(%esp),%edi
  2000c8:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  2000cc:	39 c7                	cmp    %eax,%edi
  2000ce:	73 26                	jae    2000f6 <memmove+0x39>
  2000d0:	8d 34 17             	lea    (%edi,%edx,1),%esi
  2000d3:	39 c6                	cmp    %eax,%esi
  2000d5:	76 1f                	jbe    2000f6 <memmove+0x39>
		s += n, d += n;
  2000d7:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  2000da:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  2000dc:	eb 07                	jmp    2000e5 <memmove+0x28>
			*--d = *--s;
  2000de:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  2000e1:	4a                   	dec    %edx
  2000e2:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  2000e5:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  2000e6:	85 d2                	test   %edx,%edx
  2000e8:	75 f4                	jne    2000de <memmove+0x21>
  2000ea:	eb 10                	jmp    2000fc <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  2000ec:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  2000ef:	4a                   	dec    %edx
  2000f0:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  2000f3:	41                   	inc    %ecx
  2000f4:	eb 02                	jmp    2000f8 <memmove+0x3b>
  2000f6:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  2000f8:	85 d2                	test   %edx,%edx
  2000fa:	75 f0                	jne    2000ec <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  2000fc:	5b                   	pop    %ebx
  2000fd:	5e                   	pop    %esi
  2000fe:	5f                   	pop    %edi
  2000ff:	c3                   	ret    

00200100 <memset>:

void *
memset(void *v, int c, size_t n)
{
  200100:	53                   	push   %ebx
  200101:	8b 44 24 08          	mov    0x8(%esp),%eax
  200105:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  200109:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  20010d:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  20010f:	eb 04                	jmp    200115 <memset+0x15>
		*p++ = c;
  200111:	88 1a                	mov    %bl,(%edx)
  200113:	49                   	dec    %ecx
  200114:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  200115:	85 c9                	test   %ecx,%ecx
  200117:	75 f8                	jne    200111 <memset+0x11>
		*p++ = c;
	return v;
}
  200119:	5b                   	pop    %ebx
  20011a:	c3                   	ret    

0020011b <strlen>:

size_t
strlen(const char *s)
{
  20011b:	8b 54 24 04          	mov    0x4(%esp),%edx
  20011f:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  200121:	eb 01                	jmp    200124 <strlen+0x9>
		++n;
  200123:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  200124:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  200128:	75 f9                	jne    200123 <strlen+0x8>
		++n;
	return n;
}
  20012a:	c3                   	ret    

0020012b <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  20012b:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  20012f:	31 c0                	xor    %eax,%eax
  200131:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  200135:	eb 01                	jmp    200138 <strnlen+0xd>
		++n;
  200137:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  200138:	39 d0                	cmp    %edx,%eax
  20013a:	74 06                	je     200142 <strnlen+0x17>
  20013c:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  200140:	75 f5                	jne    200137 <strnlen+0xc>
		++n;
	return n;
}
  200142:	c3                   	ret    

00200143 <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  200143:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  200144:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  200149:	53                   	push   %ebx
  20014a:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  20014c:	76 05                	jbe    200153 <console_putc+0x10>
  20014e:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  200153:	80 fa 0a             	cmp    $0xa,%dl
  200156:	75 2c                	jne    200184 <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  200158:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  20015e:	be 50 00 00 00       	mov    $0x50,%esi
  200163:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  200165:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  200168:	99                   	cltd   
  200169:	f7 fe                	idiv   %esi
  20016b:	89 de                	mov    %ebx,%esi
  20016d:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  20016f:	eb 07                	jmp    200178 <console_putc+0x35>
			*cursor++ = ' ' | color;
  200171:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  200174:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  200175:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  200178:	83 f8 50             	cmp    $0x50,%eax
  20017b:	75 f4                	jne    200171 <console_putc+0x2e>
  20017d:	29 d0                	sub    %edx,%eax
  20017f:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  200182:	eb 0b                	jmp    20018f <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  200184:	0f b6 d2             	movzbl %dl,%edx
  200187:	09 ca                	or     %ecx,%edx
  200189:	66 89 13             	mov    %dx,(%ebx)
  20018c:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  20018f:	5b                   	pop    %ebx
  200190:	5e                   	pop    %esi
  200191:	c3                   	ret    

00200192 <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  200192:	56                   	push   %esi
  200193:	53                   	push   %ebx
  200194:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  200198:	8d 58 ff             	lea    -0x1(%eax),%ebx
  20019b:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  20019f:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  2001a4:	75 04                	jne    2001aa <fill_numbuf+0x18>
  2001a6:	85 d2                	test   %edx,%edx
  2001a8:	74 10                	je     2001ba <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  2001aa:	89 d0                	mov    %edx,%eax
  2001ac:	31 d2                	xor    %edx,%edx
  2001ae:	f7 f1                	div    %ecx
  2001b0:	4b                   	dec    %ebx
  2001b1:	8a 14 16             	mov    (%esi,%edx,1),%dl
  2001b4:	88 13                	mov    %dl,(%ebx)
			val /= base;
  2001b6:	89 c2                	mov    %eax,%edx
  2001b8:	eb ec                	jmp    2001a6 <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  2001ba:	89 d8                	mov    %ebx,%eax
  2001bc:	5b                   	pop    %ebx
  2001bd:	5e                   	pop    %esi
  2001be:	c3                   	ret    

002001bf <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  2001bf:	55                   	push   %ebp
  2001c0:	57                   	push   %edi
  2001c1:	56                   	push   %esi
  2001c2:	53                   	push   %ebx
  2001c3:	83 ec 38             	sub    $0x38,%esp
  2001c6:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  2001ca:	8b 7c 24 54          	mov    0x54(%esp),%edi
  2001ce:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  2001d2:	e9 60 03 00 00       	jmp    200537 <console_vprintf+0x378>
		if (*format != '%') {
  2001d7:	80 fa 25             	cmp    $0x25,%dl
  2001da:	74 13                	je     2001ef <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  2001dc:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  2001e0:	0f b6 d2             	movzbl %dl,%edx
  2001e3:	89 f0                	mov    %esi,%eax
  2001e5:	e8 59 ff ff ff       	call   200143 <console_putc>
  2001ea:	e9 45 03 00 00       	jmp    200534 <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  2001ef:	47                   	inc    %edi
  2001f0:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  2001f7:	00 
  2001f8:	eb 12                	jmp    20020c <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  2001fa:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  2001fb:	8a 11                	mov    (%ecx),%dl
  2001fd:	84 d2                	test   %dl,%dl
  2001ff:	74 1a                	je     20021b <console_vprintf+0x5c>
  200201:	89 e8                	mov    %ebp,%eax
  200203:	38 c2                	cmp    %al,%dl
  200205:	75 f3                	jne    2001fa <console_vprintf+0x3b>
  200207:	e9 3f 03 00 00       	jmp    20054b <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  20020c:	8a 17                	mov    (%edi),%dl
  20020e:	84 d2                	test   %dl,%dl
  200210:	74 0b                	je     20021d <console_vprintf+0x5e>
  200212:	b9 9c 05 20 00       	mov    $0x20059c,%ecx
  200217:	89 d5                	mov    %edx,%ebp
  200219:	eb e0                	jmp    2001fb <console_vprintf+0x3c>
  20021b:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  20021d:	8d 42 cf             	lea    -0x31(%edx),%eax
  200220:	3c 08                	cmp    $0x8,%al
  200222:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  200229:	00 
  20022a:	76 13                	jbe    20023f <console_vprintf+0x80>
  20022c:	eb 1d                	jmp    20024b <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  20022e:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  200233:	0f be c0             	movsbl %al,%eax
  200236:	47                   	inc    %edi
  200237:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  20023b:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  20023f:	8a 07                	mov    (%edi),%al
  200241:	8d 50 d0             	lea    -0x30(%eax),%edx
  200244:	80 fa 09             	cmp    $0x9,%dl
  200247:	76 e5                	jbe    20022e <console_vprintf+0x6f>
  200249:	eb 18                	jmp    200263 <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  20024b:	80 fa 2a             	cmp    $0x2a,%dl
  20024e:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  200255:	ff 
  200256:	75 0b                	jne    200263 <console_vprintf+0xa4>
			width = va_arg(val, int);
  200258:	83 c3 04             	add    $0x4,%ebx
			++format;
  20025b:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  20025c:	8b 53 fc             	mov    -0x4(%ebx),%edx
  20025f:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  200263:	83 cd ff             	or     $0xffffffff,%ebp
  200266:	80 3f 2e             	cmpb   $0x2e,(%edi)
  200269:	75 37                	jne    2002a2 <console_vprintf+0xe3>
			++format;
  20026b:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  20026c:	31 ed                	xor    %ebp,%ebp
  20026e:	8a 07                	mov    (%edi),%al
  200270:	8d 50 d0             	lea    -0x30(%eax),%edx
  200273:	80 fa 09             	cmp    $0x9,%dl
  200276:	76 0d                	jbe    200285 <console_vprintf+0xc6>
  200278:	eb 17                	jmp    200291 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  20027a:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  20027d:	0f be c0             	movsbl %al,%eax
  200280:	47                   	inc    %edi
  200281:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  200285:	8a 07                	mov    (%edi),%al
  200287:	8d 50 d0             	lea    -0x30(%eax),%edx
  20028a:	80 fa 09             	cmp    $0x9,%dl
  20028d:	76 eb                	jbe    20027a <console_vprintf+0xbb>
  20028f:	eb 11                	jmp    2002a2 <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  200291:	3c 2a                	cmp    $0x2a,%al
  200293:	75 0b                	jne    2002a0 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  200295:	83 c3 04             	add    $0x4,%ebx
				++format;
  200298:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  200299:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  20029c:	85 ed                	test   %ebp,%ebp
  20029e:	79 02                	jns    2002a2 <console_vprintf+0xe3>
  2002a0:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  2002a2:	8a 07                	mov    (%edi),%al
  2002a4:	3c 64                	cmp    $0x64,%al
  2002a6:	74 34                	je     2002dc <console_vprintf+0x11d>
  2002a8:	7f 1d                	jg     2002c7 <console_vprintf+0x108>
  2002aa:	3c 58                	cmp    $0x58,%al
  2002ac:	0f 84 a2 00 00 00    	je     200354 <console_vprintf+0x195>
  2002b2:	3c 63                	cmp    $0x63,%al
  2002b4:	0f 84 bf 00 00 00    	je     200379 <console_vprintf+0x1ba>
  2002ba:	3c 43                	cmp    $0x43,%al
  2002bc:	0f 85 d0 00 00 00    	jne    200392 <console_vprintf+0x1d3>
  2002c2:	e9 a3 00 00 00       	jmp    20036a <console_vprintf+0x1ab>
  2002c7:	3c 75                	cmp    $0x75,%al
  2002c9:	74 4d                	je     200318 <console_vprintf+0x159>
  2002cb:	3c 78                	cmp    $0x78,%al
  2002cd:	74 5c                	je     20032b <console_vprintf+0x16c>
  2002cf:	3c 73                	cmp    $0x73,%al
  2002d1:	0f 85 bb 00 00 00    	jne    200392 <console_vprintf+0x1d3>
  2002d7:	e9 86 00 00 00       	jmp    200362 <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  2002dc:	83 c3 04             	add    $0x4,%ebx
  2002df:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  2002e2:	89 d1                	mov    %edx,%ecx
  2002e4:	c1 f9 1f             	sar    $0x1f,%ecx
  2002e7:	89 0c 24             	mov    %ecx,(%esp)
  2002ea:	31 ca                	xor    %ecx,%edx
  2002ec:	55                   	push   %ebp
  2002ed:	29 ca                	sub    %ecx,%edx
  2002ef:	68 a4 05 20 00       	push   $0x2005a4
  2002f4:	b9 0a 00 00 00       	mov    $0xa,%ecx
  2002f9:	8d 44 24 40          	lea    0x40(%esp),%eax
  2002fd:	e8 90 fe ff ff       	call   200192 <fill_numbuf>
  200302:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  200306:	58                   	pop    %eax
  200307:	5a                   	pop    %edx
  200308:	ba 01 00 00 00       	mov    $0x1,%edx
  20030d:	8b 04 24             	mov    (%esp),%eax
  200310:	83 e0 01             	and    $0x1,%eax
  200313:	e9 a5 00 00 00       	jmp    2003bd <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  200318:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  20031b:	b9 0a 00 00 00       	mov    $0xa,%ecx
  200320:	8b 53 fc             	mov    -0x4(%ebx),%edx
  200323:	55                   	push   %ebp
  200324:	68 a4 05 20 00       	push   $0x2005a4
  200329:	eb 11                	jmp    20033c <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  20032b:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  20032e:	8b 53 fc             	mov    -0x4(%ebx),%edx
  200331:	55                   	push   %ebp
  200332:	68 b8 05 20 00       	push   $0x2005b8
  200337:	b9 10 00 00 00       	mov    $0x10,%ecx
  20033c:	8d 44 24 40          	lea    0x40(%esp),%eax
  200340:	e8 4d fe ff ff       	call   200192 <fill_numbuf>
  200345:	ba 01 00 00 00       	mov    $0x1,%edx
  20034a:	89 44 24 0c          	mov    %eax,0xc(%esp)
  20034e:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  200350:	59                   	pop    %ecx
  200351:	59                   	pop    %ecx
  200352:	eb 69                	jmp    2003bd <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  200354:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  200357:	8b 53 fc             	mov    -0x4(%ebx),%edx
  20035a:	55                   	push   %ebp
  20035b:	68 a4 05 20 00       	push   $0x2005a4
  200360:	eb d5                	jmp    200337 <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  200362:	83 c3 04             	add    $0x4,%ebx
  200365:	8b 43 fc             	mov    -0x4(%ebx),%eax
  200368:	eb 40                	jmp    2003aa <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  20036a:	83 c3 04             	add    $0x4,%ebx
  20036d:	8b 53 fc             	mov    -0x4(%ebx),%edx
  200370:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  200374:	e9 bd 01 00 00       	jmp    200536 <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  200379:	83 c3 04             	add    $0x4,%ebx
  20037c:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  20037f:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  200383:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  200388:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  20038c:	88 44 24 24          	mov    %al,0x24(%esp)
  200390:	eb 27                	jmp    2003b9 <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  200392:	84 c0                	test   %al,%al
  200394:	75 02                	jne    200398 <console_vprintf+0x1d9>
  200396:	b0 25                	mov    $0x25,%al
  200398:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  20039c:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  2003a1:	80 3f 00             	cmpb   $0x0,(%edi)
  2003a4:	74 0a                	je     2003b0 <console_vprintf+0x1f1>
  2003a6:	8d 44 24 24          	lea    0x24(%esp),%eax
  2003aa:	89 44 24 04          	mov    %eax,0x4(%esp)
  2003ae:	eb 09                	jmp    2003b9 <console_vprintf+0x1fa>
				format--;
  2003b0:	8d 54 24 24          	lea    0x24(%esp),%edx
  2003b4:	4f                   	dec    %edi
  2003b5:	89 54 24 04          	mov    %edx,0x4(%esp)
  2003b9:	31 d2                	xor    %edx,%edx
  2003bb:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  2003bd:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  2003bf:	83 fd ff             	cmp    $0xffffffff,%ebp
  2003c2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  2003c9:	74 1f                	je     2003ea <console_vprintf+0x22b>
  2003cb:	89 04 24             	mov    %eax,(%esp)
  2003ce:	eb 01                	jmp    2003d1 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  2003d0:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  2003d1:	39 e9                	cmp    %ebp,%ecx
  2003d3:	74 0a                	je     2003df <console_vprintf+0x220>
  2003d5:	8b 44 24 04          	mov    0x4(%esp),%eax
  2003d9:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  2003dd:	75 f1                	jne    2003d0 <console_vprintf+0x211>
  2003df:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  2003e2:	89 0c 24             	mov    %ecx,(%esp)
  2003e5:	eb 1f                	jmp    200406 <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  2003e7:	42                   	inc    %edx
  2003e8:	eb 09                	jmp    2003f3 <console_vprintf+0x234>
  2003ea:	89 d1                	mov    %edx,%ecx
  2003ec:	8b 14 24             	mov    (%esp),%edx
  2003ef:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  2003f3:	8b 44 24 04          	mov    0x4(%esp),%eax
  2003f7:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  2003fb:	75 ea                	jne    2003e7 <console_vprintf+0x228>
  2003fd:	8b 44 24 08          	mov    0x8(%esp),%eax
  200401:	89 14 24             	mov    %edx,(%esp)
  200404:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  200406:	85 c0                	test   %eax,%eax
  200408:	74 0c                	je     200416 <console_vprintf+0x257>
  20040a:	84 d2                	test   %dl,%dl
  20040c:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  200413:	00 
  200414:	75 24                	jne    20043a <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  200416:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  20041b:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  200422:	00 
  200423:	75 15                	jne    20043a <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  200425:	8b 44 24 14          	mov    0x14(%esp),%eax
  200429:	83 e0 08             	and    $0x8,%eax
  20042c:	83 f8 01             	cmp    $0x1,%eax
  20042f:	19 c9                	sbb    %ecx,%ecx
  200431:	f7 d1                	not    %ecx
  200433:	83 e1 20             	and    $0x20,%ecx
  200436:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  20043a:	3b 2c 24             	cmp    (%esp),%ebp
  20043d:	7e 0d                	jle    20044c <console_vprintf+0x28d>
  20043f:	84 d2                	test   %dl,%dl
  200441:	74 40                	je     200483 <console_vprintf+0x2c4>
			zeros = precision - len;
  200443:	2b 2c 24             	sub    (%esp),%ebp
  200446:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  20044a:	eb 3f                	jmp    20048b <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  20044c:	84 d2                	test   %dl,%dl
  20044e:	74 33                	je     200483 <console_vprintf+0x2c4>
  200450:	8b 44 24 14          	mov    0x14(%esp),%eax
  200454:	83 e0 06             	and    $0x6,%eax
  200457:	83 f8 02             	cmp    $0x2,%eax
  20045a:	75 27                	jne    200483 <console_vprintf+0x2c4>
  20045c:	45                   	inc    %ebp
  20045d:	75 24                	jne    200483 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  20045f:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  200461:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  200464:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  200469:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  20046c:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  20046f:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  200473:	7d 0e                	jge    200483 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  200475:	8b 54 24 0c          	mov    0xc(%esp),%edx
  200479:	29 ca                	sub    %ecx,%edx
  20047b:	29 c2                	sub    %eax,%edx
  20047d:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  200481:	eb 08                	jmp    20048b <console_vprintf+0x2cc>
  200483:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  20048a:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  20048b:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  20048f:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  200491:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  200495:	2b 2c 24             	sub    (%esp),%ebp
  200498:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  20049d:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  2004a0:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  2004a3:	29 c5                	sub    %eax,%ebp
  2004a5:	89 f0                	mov    %esi,%eax
  2004a7:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  2004ab:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  2004af:	eb 0f                	jmp    2004c0 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  2004b1:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  2004b5:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  2004ba:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  2004bb:	e8 83 fc ff ff       	call   200143 <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  2004c0:	85 ed                	test   %ebp,%ebp
  2004c2:	7e 07                	jle    2004cb <console_vprintf+0x30c>
  2004c4:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  2004c9:	74 e6                	je     2004b1 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  2004cb:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  2004d0:	89 c6                	mov    %eax,%esi
  2004d2:	74 23                	je     2004f7 <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  2004d4:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  2004d9:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  2004dd:	e8 61 fc ff ff       	call   200143 <console_putc>
  2004e2:	89 c6                	mov    %eax,%esi
  2004e4:	eb 11                	jmp    2004f7 <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  2004e6:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  2004ea:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  2004ef:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  2004f0:	e8 4e fc ff ff       	call   200143 <console_putc>
  2004f5:	eb 06                	jmp    2004fd <console_vprintf+0x33e>
  2004f7:	89 f0                	mov    %esi,%eax
  2004f9:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  2004fd:	85 f6                	test   %esi,%esi
  2004ff:	7f e5                	jg     2004e6 <console_vprintf+0x327>
  200501:	8b 34 24             	mov    (%esp),%esi
  200504:	eb 15                	jmp    20051b <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  200506:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  20050a:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  20050b:	0f b6 11             	movzbl (%ecx),%edx
  20050e:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  200512:	e8 2c fc ff ff       	call   200143 <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  200517:	ff 44 24 04          	incl   0x4(%esp)
  20051b:	85 f6                	test   %esi,%esi
  20051d:	7f e7                	jg     200506 <console_vprintf+0x347>
  20051f:	eb 0f                	jmp    200530 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  200521:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  200525:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  20052a:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  20052b:	e8 13 fc ff ff       	call   200143 <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  200530:	85 ed                	test   %ebp,%ebp
  200532:	7f ed                	jg     200521 <console_vprintf+0x362>
  200534:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  200536:	47                   	inc    %edi
  200537:	8a 17                	mov    (%edi),%dl
  200539:	84 d2                	test   %dl,%dl
  20053b:	0f 85 96 fc ff ff    	jne    2001d7 <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  200541:	83 c4 38             	add    $0x38,%esp
  200544:	89 f0                	mov    %esi,%eax
  200546:	5b                   	pop    %ebx
  200547:	5e                   	pop    %esi
  200548:	5f                   	pop    %edi
  200549:	5d                   	pop    %ebp
  20054a:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  20054b:	81 e9 9c 05 20 00    	sub    $0x20059c,%ecx
  200551:	b8 01 00 00 00       	mov    $0x1,%eax
  200556:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  200558:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  200559:	09 44 24 14          	or     %eax,0x14(%esp)
  20055d:	e9 aa fc ff ff       	jmp    20020c <console_vprintf+0x4d>

00200562 <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  200562:	8d 44 24 10          	lea    0x10(%esp),%eax
  200566:	50                   	push   %eax
  200567:	ff 74 24 10          	pushl  0x10(%esp)
  20056b:	ff 74 24 10          	pushl  0x10(%esp)
  20056f:	ff 74 24 10          	pushl  0x10(%esp)
  200573:	e8 47 fc ff ff       	call   2001bf <console_vprintf>
  200578:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  20057b:	c3                   	ret    
