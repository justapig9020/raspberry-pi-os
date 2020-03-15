
kernel8.elf:     file format elf64-littleaarch64


Disassembly of section .text.boot:

0000000000000000 <_start>:
   0:	d53800a0 	mrs	x0, mpidr_el1
   4:	92401c00 	and	x0, x0, #0xff
   8:	b4000060 	cbz	x0, 14 <master>
   c:	14000008 	b	2c <set_stk>
  10:	14000010 	b	50 <proc_hang>

0000000000000014 <master>:
  14:	10006720 	adr	x0, cf8 <bss_begin>
  18:	50006701 	adr	x1, cfa <bss_end>
  1c:	cb000021 	sub	x1, x1, x0
  20:	940002f4 	bl	bf0 <memzero>
  24:	d284b000 	mov	x0, #0x2580                	// #9600
  28:	940001e0 	bl	7a8 <uart_init>

000000000000002c <set_stk>:
  2c:	d53800a0 	mrs	x0, mpidr_el1
  30:	92401c00 	and	x0, x0, #0xff
  34:	d2820001 	mov	x1, #0x1000                	// #4096
  38:	9b007c21 	mul	x1, x1, x0
  3c:	d2a00802 	mov	x2, #0x400000              	// #4194304
  40:	8b020021 	add	x1, x1, x2
  44:	9100003f 	mov	sp, x1
  48:	940002ae 	bl	b00 <kernel_main>
  4c:	14000001 	b	50 <proc_hang>

0000000000000050 <proc_hang>:
  50:	14000000 	b	50 <proc_hang>

Disassembly of section .text:

0000000000000054 <_i2s>:
  54:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
  58:	910003fd 	mov	x29, sp
  5c:	b9001fa0 	str	w0, [x29,#28]
  60:	f9000ba1 	str	x1, [x29,#16]
  64:	52800020 	mov	w0, #0x1                   	// #1
  68:	b9002fa0 	str	w0, [x29,#44]
  6c:	b9401fa0 	ldr	w0, [x29,#28]
  70:	11002400 	add	w0, w0, #0x9
  74:	7100481f 	cmp	w0, #0x12
  78:	54000289 	b.ls	c8 <_i2s+0x74>
  7c:	b9401fa0 	ldr	w0, [x29,#28]
  80:	528ccce1 	mov	w1, #0x6667                	// #26215
  84:	72acccc1 	movk	w1, #0x6666, lsl #16
  88:	9b217c01 	smull	x1, w0, w1
  8c:	d360fc21 	lsr	x1, x1, #32
  90:	13027c21 	asr	w1, w1, #2
  94:	131f7c00 	asr	w0, w0, #31
  98:	4b000020 	sub	w0, w1, w0
  9c:	f9400ba1 	ldr	x1, [x29,#16]
  a0:	97ffffed 	bl	54 <_i2s>
  a4:	2a0003e1 	mov	w1, w0
  a8:	b9402fa0 	ldr	w0, [x29,#44]
  ac:	0b010000 	add	w0, w0, w1
  b0:	b9002fa0 	str	w0, [x29,#44]
  b4:	f9400ba0 	ldr	x0, [x29,#16]
  b8:	f9400000 	ldr	x0, [x0]
  bc:	91000401 	add	x1, x0, #0x1
  c0:	f9400ba0 	ldr	x0, [x29,#16]
  c4:	f9000001 	str	x1, [x0]
  c8:	f9400ba0 	ldr	x0, [x29,#16]
  cc:	f9400003 	ldr	x3, [x0]
  d0:	b9401fa1 	ldr	w1, [x29,#28]
  d4:	528ccce0 	mov	w0, #0x6667                	// #26215
  d8:	72acccc0 	movk	w0, #0x6666, lsl #16
  dc:	9b207c20 	smull	x0, w1, w0
  e0:	d360fc00 	lsr	x0, x0, #32
  e4:	13027c02 	asr	w2, w0, #2
  e8:	131f7c20 	asr	w0, w1, #31
  ec:	4b000042 	sub	w2, w2, w0
  f0:	2a0203e0 	mov	w0, w2
  f4:	531e7400 	lsl	w0, w0, #2
  f8:	0b020000 	add	w0, w0, w2
  fc:	531f7800 	lsl	w0, w0, #1
 100:	4b000022 	sub	w2, w1, w0
 104:	53001c40 	uxtb	w0, w2
 108:	1100c000 	add	w0, w0, #0x30
 10c:	53001c00 	uxtb	w0, w0
 110:	39000060 	strb	w0, [x3]
 114:	f9400ba0 	ldr	x0, [x29,#16]
 118:	f9400000 	ldr	x0, [x0]
 11c:	91000400 	add	x0, x0, #0x1
 120:	3900001f 	strb	wzr, [x0]
 124:	b9402fa0 	ldr	w0, [x29,#44]
 128:	a8c37bfd 	ldp	x29, x30, [sp],#48
 12c:	d65f03c0 	ret

0000000000000130 <i2s>:
 130:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 134:	910003fd 	mov	x29, sp
 138:	b9001fa0 	str	w0, [x29,#28]
 13c:	f9000ba1 	str	x1, [x29,#16]
 140:	910043a0 	add	x0, x29, #0x10
 144:	f90017a0 	str	x0, [x29,#40]
 148:	f94017a1 	ldr	x1, [x29,#40]
 14c:	b9401fa0 	ldr	w0, [x29,#28]
 150:	97ffffc1 	bl	54 <_i2s>
 154:	a8c37bfd 	ldp	x29, x30, [sp],#48
 158:	d65f03c0 	ret

000000000000015c <prt_int>:
 15c:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 160:	910003fd 	mov	x29, sp
 164:	f9000fa0 	str	x0, [x29,#24]
 168:	f9000ba1 	str	x1, [x29,#16]
 16c:	b9002bbf 	str	wzr, [x29,#40]
 170:	b9002fbf 	str	wzr, [x29,#44]
 174:	9100a3a0 	add	x0, x29, #0x28
 178:	52800082 	mov	w2, #0x4                   	// #4
 17c:	aa0003e1 	mov	x1, x0
 180:	f9400fa0 	ldr	x0, [x29,#24]
 184:	94000247 	bl	aa0 <mem_cpy>
 188:	b9402ba0 	ldr	w0, [x29,#40]
 18c:	f9400ba1 	ldr	x1, [x29,#16]
 190:	97ffffe8 	bl	130 <i2s>
 194:	b9002fa0 	str	w0, [x29,#44]
 198:	b9402fa0 	ldr	w0, [x29,#44]
 19c:	a8c37bfd 	ldp	x29, x30, [sp],#48
 1a0:	d65f03c0 	ret

00000000000001a4 <h2s>:
 1a4:	d10043ff 	sub	sp, sp, #0x10
 1a8:	39003fe0 	strb	w0, [sp,#15]
 1ac:	39403fe0 	ldrb	w0, [sp,#15]
 1b0:	71003c1f 	cmp	w0, #0xf
 1b4:	540001e8 	b.hi	1f0 <h2s+0x4c>
 1b8:	90000001 	adrp	x1, 0 <_start>
 1bc:	91300021 	add	x1, x1, #0xc00
 1c0:	b8605820 	ldr	w0, [x1,w0,uxtw #2]
 1c4:	10000061 	adr	x1, 1d0 <h2s+0x2c>
 1c8:	8b20c820 	add	x0, x1, w0, sxtw #2
 1cc:	d61f0000 	br	x0
 1d0:	39403fe0 	ldrb	w0, [sp,#15]
 1d4:	1100c000 	add	w0, w0, #0x30
 1d8:	53001c00 	uxtb	w0, w0
 1dc:	14000006 	b	1f4 <h2s+0x50>
 1e0:	39403fe0 	ldrb	w0, [sp,#15]
 1e4:	1100dc00 	add	w0, w0, #0x37
 1e8:	53001c00 	uxtb	w0, w0
 1ec:	14000002 	b	1f4 <h2s+0x50>
 1f0:	52800000 	mov	w0, #0x0                   	// #0
 1f4:	910043ff 	add	sp, sp, #0x10
 1f8:	d65f03c0 	ret

00000000000001fc <_i2h>:
 1fc:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 200:	910003fd 	mov	x29, sp
 204:	f9000bf3 	str	x19, [sp,#16]
 208:	b9002fa0 	str	w0, [x29,#44]
 20c:	f90013a1 	str	x1, [x29,#32]
 210:	52800020 	mov	w0, #0x1                   	// #1
 214:	b9003fa0 	str	w0, [x29,#60]
 218:	b9402fa0 	ldr	w0, [x29,#44]
 21c:	13047c00 	asr	w0, w0, #4
 220:	7100001f 	cmp	w0, #0x0
 224:	540001c0 	b.eq	25c <_i2h+0x60>
 228:	b9402fa0 	ldr	w0, [x29,#44]
 22c:	13047c00 	asr	w0, w0, #4
 230:	f94013a1 	ldr	x1, [x29,#32]
 234:	97fffff2 	bl	1fc <_i2h>
 238:	2a0003e1 	mov	w1, w0
 23c:	b9403fa0 	ldr	w0, [x29,#60]
 240:	0b010000 	add	w0, w0, w1
 244:	b9003fa0 	str	w0, [x29,#60]
 248:	f94013a0 	ldr	x0, [x29,#32]
 24c:	f9400000 	ldr	x0, [x0]
 250:	91000401 	add	x1, x0, #0x1
 254:	f94013a0 	ldr	x0, [x29,#32]
 258:	f9000001 	str	x1, [x0]
 25c:	f94013a0 	ldr	x0, [x29,#32]
 260:	f9400013 	ldr	x19, [x0]
 264:	b9402fa0 	ldr	w0, [x29,#44]
 268:	53001c00 	uxtb	w0, w0
 26c:	12000c00 	and	w0, w0, #0xf
 270:	53001c00 	uxtb	w0, w0
 274:	97ffffcc 	bl	1a4 <h2s>
 278:	53001c00 	uxtb	w0, w0
 27c:	39000260 	strb	w0, [x19]
 280:	b9403fa0 	ldr	w0, [x29,#60]
 284:	f9400bf3 	ldr	x19, [sp,#16]
 288:	a8c47bfd 	ldp	x29, x30, [sp],#64
 28c:	d65f03c0 	ret

0000000000000290 <i2h>:
 290:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 294:	910003fd 	mov	x29, sp
 298:	b9001fa0 	str	w0, [x29,#28]
 29c:	f9000ba1 	str	x1, [x29,#16]
 2a0:	910043a0 	add	x0, x29, #0x10
 2a4:	f90017a0 	str	x0, [x29,#40]
 2a8:	f94017a1 	ldr	x1, [x29,#40]
 2ac:	b9401fa0 	ldr	w0, [x29,#28]
 2b0:	97ffffd3 	bl	1fc <_i2h>
 2b4:	a8c37bfd 	ldp	x29, x30, [sp],#48
 2b8:	d65f03c0 	ret

00000000000002bc <prt_hex>:
 2bc:	a9bc7bfd 	stp	x29, x30, [sp,#-64]!
 2c0:	910003fd 	mov	x29, sp
 2c4:	f9000fa0 	str	x0, [x29,#24]
 2c8:	f9000ba1 	str	x1, [x29,#16]
 2cc:	f9400fa0 	ldr	x0, [x29,#24]
 2d0:	b9400000 	ldr	w0, [x0]
 2d4:	b9003fa0 	str	w0, [x29,#60]
 2d8:	f9400ba0 	ldr	x0, [x29,#16]
 2dc:	91000401 	add	x1, x0, #0x1
 2e0:	f9000ba1 	str	x1, [x29,#16]
 2e4:	52800601 	mov	w1, #0x30                  	// #48
 2e8:	39000001 	strb	w1, [x0]
 2ec:	f9400ba0 	ldr	x0, [x29,#16]
 2f0:	91000401 	add	x1, x0, #0x1
 2f4:	f9000ba1 	str	x1, [x29,#16]
 2f8:	52800f01 	mov	w1, #0x78                  	// #120
 2fc:	39000001 	strb	w1, [x0]
 300:	52800040 	mov	w0, #0x2                   	// #2
 304:	b9003ba0 	str	w0, [x29,#56]
 308:	b9403fa0 	ldr	w0, [x29,#60]
 30c:	f9400ba1 	ldr	x1, [x29,#16]
 310:	97ffffe0 	bl	290 <i2h>
 314:	2a0003e1 	mov	w1, w0
 318:	b9403ba0 	ldr	w0, [x29,#56]
 31c:	0b010000 	add	w0, w0, w1
 320:	b9003ba0 	str	w0, [x29,#56]
 324:	b9403ba0 	ldr	w0, [x29,#56]
 328:	a8c47bfd 	ldp	x29, x30, [sp],#64
 32c:	d65f03c0 	ret

0000000000000330 <prt_chr>:
 330:	d10043ff 	sub	sp, sp, #0x10
 334:	f90007e0 	str	x0, [sp,#8]
 338:	f90003e1 	str	x1, [sp]
 33c:	f94007e0 	ldr	x0, [sp,#8]
 340:	39400001 	ldrb	w1, [x0]
 344:	f94003e0 	ldr	x0, [sp]
 348:	39000001 	strb	w1, [x0]
 34c:	52800000 	mov	w0, #0x0                   	// #0
 350:	910043ff 	add	sp, sp, #0x10
 354:	d65f03c0 	ret

0000000000000358 <prt_parser>:
 358:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 35c:	910003fd 	mov	x29, sp
 360:	f90017a0 	str	x0, [x29,#40]
 364:	f90013a1 	str	x1, [x29,#32]
 368:	f9000fa2 	str	x2, [x29,#24]
 36c:	f94017a0 	ldr	x0, [x29,#40]
 370:	f9400000 	ldr	x0, [x0]
 374:	39400000 	ldrb	w0, [x0]
 378:	51018c00 	sub	w0, w0, #0x63
 37c:	7100541f 	cmp	w0, #0x15
 380:	540002a8 	b.hi	3d4 <prt_parser+0x7c>
 384:	90000001 	adrp	x1, 0 <_start>
 388:	91310021 	add	x1, x1, #0xc40
 38c:	b8605820 	ldr	w0, [x1,w0,uxtw #2]
 390:	10000061 	adr	x1, 39c <prt_parser+0x44>
 394:	8b20c820 	add	x0, x1, w0, sxtw #2
 398:	d61f0000 	br	x0
 39c:	f9400fa1 	ldr	x1, [x29,#24]
 3a0:	f94013a0 	ldr	x0, [x29,#32]
 3a4:	97ffff6e 	bl	15c <prt_int>
 3a8:	1400000c 	b	3d8 <prt_parser+0x80>
 3ac:	52800000 	mov	w0, #0x0                   	// #0
 3b0:	1400000a 	b	3d8 <prt_parser+0x80>
 3b4:	f9400fa1 	ldr	x1, [x29,#24]
 3b8:	f94013a0 	ldr	x0, [x29,#32]
 3bc:	97ffffc0 	bl	2bc <prt_hex>
 3c0:	14000006 	b	3d8 <prt_parser+0x80>
 3c4:	f9400fa1 	ldr	x1, [x29,#24]
 3c8:	f94013a0 	ldr	x0, [x29,#32]
 3cc:	97ffffd9 	bl	330 <prt_chr>
 3d0:	14000002 	b	3d8 <prt_parser+0x80>
 3d4:	12800000 	mov	w0, #0xffffffff            	// #-1
 3d8:	a8c37bfd 	ldp	x29, x30, [sp],#48
 3dc:	d65f03c0 	ret

00000000000003e0 <_printf>:
 3e0:	a9ac7bfd 	stp	x29, x30, [sp,#-320]!
 3e4:	910003fd 	mov	x29, sp
 3e8:	b9002fa0 	str	w0, [x29,#44]
 3ec:	b9002ba1 	str	w1, [x29,#40]
 3f0:	b90027a2 	str	w2, [x29,#36]
 3f4:	b90023a3 	str	w3, [x29,#32]
 3f8:	b9001fa4 	str	w4, [x29,#28]
 3fc:	b9001ba5 	str	w5, [x29,#24]
 400:	b90017a6 	str	w6, [x29,#20]
 404:	b90013a7 	str	w7, [x29,#16]
 408:	b9013fbf 	str	wzr, [x29,#316]
 40c:	910523a0 	add	x0, x29, #0x148
 410:	f9009ba0 	str	x0, [x29,#304]
 414:	14000031 	b	4d8 <_printf+0xf8>
 418:	f940a3a0 	ldr	x0, [x29,#320]
 41c:	39400000 	ldrb	w0, [x0]
 420:	7100281f 	cmp	w0, #0xa
 424:	540002a0 	b.eq	478 <_printf+0x98>
 428:	7100941f 	cmp	w0, #0x25
 42c:	540003a1 	b.ne	4a0 <_printf+0xc0>
 430:	f940a3a0 	ldr	x0, [x29,#320]
 434:	91000400 	add	x0, x0, #0x1
 438:	f900a3a0 	str	x0, [x29,#320]
 43c:	9100c3a1 	add	x1, x29, #0x30
 440:	b9813fa0 	ldrsw	x0, [x29,#316]
 444:	8b000020 	add	x0, x1, x0
 448:	aa0003e2 	mov	x2, x0
 44c:	f9409ba1 	ldr	x1, [x29,#304]
 450:	910503a0 	add	x0, x29, #0x140
 454:	97ffffc1 	bl	358 <prt_parser>
 458:	2a0003e1 	mov	w1, w0
 45c:	b9413fa0 	ldr	w0, [x29,#316]
 460:	0b010000 	add	w0, w0, w1
 464:	b9013fa0 	str	w0, [x29,#316]
 468:	f9409ba0 	ldr	x0, [x29,#304]
 46c:	91002000 	add	x0, x0, #0x8
 470:	f9009ba0 	str	x0, [x29,#304]
 474:	14000016 	b	4cc <_printf+0xec>
 478:	b9413fa0 	ldr	w0, [x29,#316]
 47c:	11000401 	add	w1, w0, #0x1
 480:	b9013fa1 	str	w1, [x29,#316]
 484:	93407c00 	sxtw	x0, w0
 488:	d13b03a1 	sub	x1, x29, #0xec0
 48c:	8b000020 	add	x0, x1, x0
 490:	aa0003e1 	mov	x1, x0
 494:	52800140 	mov	w0, #0xa                   	// #10
 498:	393bc020 	strb	w0, [x1,#3824]
 49c:	1400000c 	b	4cc <_printf+0xec>
 4a0:	b9413fa0 	ldr	w0, [x29,#316]
 4a4:	11000401 	add	w1, w0, #0x1
 4a8:	b9013fa1 	str	w1, [x29,#316]
 4ac:	f940a3a1 	ldr	x1, [x29,#320]
 4b0:	39400022 	ldrb	w2, [x1]
 4b4:	93407c00 	sxtw	x0, w0
 4b8:	d13b03a1 	sub	x1, x29, #0xec0
 4bc:	8b000020 	add	x0, x1, x0
 4c0:	2a0203e1 	mov	w1, w2
 4c4:	393bc001 	strb	w1, [x0,#3824]
 4c8:	d503201f 	nop
 4cc:	f940a3a0 	ldr	x0, [x29,#320]
 4d0:	91000400 	add	x0, x0, #0x1
 4d4:	f900a3a0 	str	x0, [x29,#320]
 4d8:	f940a3a0 	ldr	x0, [x29,#320]
 4dc:	39400000 	ldrb	w0, [x0]
 4e0:	7100001f 	cmp	w0, #0x0
 4e4:	54fff9a1 	b.ne	418 <_printf+0x38>
 4e8:	b9813fa0 	ldrsw	x0, [x29,#316]
 4ec:	d13b03a1 	sub	x1, x29, #0xec0
 4f0:	8b000020 	add	x0, x1, x0
 4f4:	393bc01f 	strb	wzr, [x0,#3824]
 4f8:	9100c3a0 	add	x0, x29, #0x30
 4fc:	94000081 	bl	700 <uart_send_string>
 500:	b9413fa0 	ldr	w0, [x29,#316]
 504:	a8d47bfd 	ldp	x29, x30, [sp],#320
 508:	d65f03c0 	ret

000000000000050c <is_end>:
 50c:	d10043ff 	sub	sp, sp, #0x10
 510:	39003fe0 	strb	w0, [sp,#15]
 514:	39403fe0 	ldrb	w0, [sp,#15]
 518:	7100801f 	cmp	w0, #0x20
 51c:	54000080 	b.eq	52c <is_end+0x20>
 520:	39403fe0 	ldrb	w0, [sp,#15]
 524:	7100341f 	cmp	w0, #0xd
 528:	54000061 	b.ne	534 <is_end+0x28>
 52c:	52800020 	mov	w0, #0x1                   	// #1
 530:	14000002 	b	538 <is_end+0x2c>
 534:	52800000 	mov	w0, #0x0                   	// #0
 538:	53001c00 	uxtb	w0, w0
 53c:	910043ff 	add	sp, sp, #0x10
 540:	d65f03c0 	ret

0000000000000544 <is_num>:
 544:	d10043ff 	sub	sp, sp, #0x10
 548:	39003fe0 	strb	w0, [sp,#15]
 54c:	39403fe0 	ldrb	w0, [sp,#15]
 550:	7100c01f 	cmp	w0, #0x30
 554:	54000089 	b.ls	564 <is_num+0x20>
 558:	39403fe0 	ldrb	w0, [sp,#15]
 55c:	7100e01f 	cmp	w0, #0x38
 560:	54000069 	b.ls	56c <is_num+0x28>
 564:	52800020 	mov	w0, #0x1                   	// #1
 568:	14000002 	b	570 <is_num+0x2c>
 56c:	52800000 	mov	w0, #0x0                   	// #0
 570:	53001c00 	uxtb	w0, w0
 574:	910043ff 	add	sp, sp, #0x10
 578:	d65f03c0 	ret

000000000000057c <get_int>:
 57c:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 580:	910003fd 	mov	x29, sp
 584:	f9000fa0 	str	x0, [x29,#24]
 588:	b9002fbf 	str	wzr, [x29,#44]
 58c:	9400004d 	bl	6c0 <uart_recv>
 590:	3900afa0 	strb	w0, [x29,#43]
 594:	3940afa0 	ldrb	w0, [x29,#43]
 598:	97ffffdd 	bl	50c <is_end>
 59c:	53001c00 	uxtb	w0, w0
 5a0:	7100001f 	cmp	w0, #0x0
 5a4:	54000281 	b.ne	5f4 <get_int+0x78>
 5a8:	3940afa0 	ldrb	w0, [x29,#43]
 5ac:	97ffffe6 	bl	544 <is_num>
 5b0:	53001c00 	uxtb	w0, w0
 5b4:	7100001f 	cmp	w0, #0x0
 5b8:	54000060 	b.eq	5c4 <get_int+0x48>
 5bc:	12800000 	mov	w0, #0xffffffff            	// #-1
 5c0:	14000012 	b	608 <get_int+0x8c>
 5c4:	b9402fa1 	ldr	w1, [x29,#44]
 5c8:	2a0103e0 	mov	w0, w1
 5cc:	531e7400 	lsl	w0, w0, #2
 5d0:	0b010000 	add	w0, w0, w1
 5d4:	531f7800 	lsl	w0, w0, #1
 5d8:	b9002fa0 	str	w0, [x29,#44]
 5dc:	3940afa0 	ldrb	w0, [x29,#43]
 5e0:	5100c000 	sub	w0, w0, #0x30
 5e4:	b9402fa1 	ldr	w1, [x29,#44]
 5e8:	0b000020 	add	w0, w1, w0
 5ec:	b9002fa0 	str	w0, [x29,#44]
 5f0:	17ffffe7 	b	58c <get_int+0x10>
 5f4:	d503201f 	nop
 5f8:	f9400fa0 	ldr	x0, [x29,#24]
 5fc:	b9402fa1 	ldr	w1, [x29,#44]
 600:	b9000001 	str	w1, [x0]
 604:	52800000 	mov	w0, #0x0                   	// #0
 608:	a8c37bfd 	ldp	x29, x30, [sp],#48
 60c:	d65f03c0 	ret

0000000000000610 <get_hex>:
 610:	d10043ff 	sub	sp, sp, #0x10
 614:	f90007e0 	str	x0, [sp,#8]
 618:	52800000 	mov	w0, #0x0                   	// #0
 61c:	910043ff 	add	sp, sp, #0x10
 620:	d65f03c0 	ret

0000000000000624 <get_parser>:
 624:	d10083ff 	sub	sp, sp, #0x20
 628:	f90007e0 	str	x0, [sp,#8]
 62c:	f90003e1 	str	x1, [sp]
 630:	b9001fff 	str	wzr, [sp,#28]
 634:	b9401fe0 	ldr	w0, [sp,#28]
 638:	910083ff 	add	sp, sp, #0x20
 63c:	d65f03c0 	ret

0000000000000640 <_scanf>:
 640:	d100c3ff 	sub	sp, sp, #0x30
 644:	b9001fe0 	str	w0, [sp,#28]
 648:	b9001be1 	str	w1, [sp,#24]
 64c:	b90017e2 	str	w2, [sp,#20]
 650:	b90013e3 	str	w3, [sp,#16]
 654:	b9000fe4 	str	w4, [sp,#12]
 658:	b9000be5 	str	w5, [sp,#8]
 65c:	b90007e6 	str	w6, [sp,#4]
 660:	b90003e7 	str	w7, [sp]
 664:	b9002fff 	str	wzr, [sp,#44]
 668:	b9402fe0 	ldr	w0, [sp,#44]
 66c:	9100c3ff 	add	sp, sp, #0x30
 670:	d65f03c0 	ret

0000000000000674 <uart_send>:
 674:	a9be7bfd 	stp	x29, x30, [sp,#-32]!
 678:	910003fd 	mov	x29, sp
 67c:	39007fa0 	strb	w0, [x29,#31]
 680:	d28a0a80 	mov	x0, #0x5054                	// #20564
 684:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 688:	94000155 	bl	bdc <get32>
 68c:	121b0000 	and	w0, w0, #0x20
 690:	7100001f 	cmp	w0, #0x0
 694:	54000041 	b.ne	69c <uart_send+0x28>
 698:	17fffffa 	b	680 <uart_send+0xc>
 69c:	d503201f 	nop
 6a0:	39407fa0 	ldrb	w0, [x29,#31]
 6a4:	2a0003e1 	mov	w1, w0
 6a8:	d28a0800 	mov	x0, #0x5040                	// #20544
 6ac:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 6b0:	94000149 	bl	bd4 <put32>
 6b4:	52800020 	mov	w0, #0x1                   	// #1
 6b8:	a8c27bfd 	ldp	x29, x30, [sp],#32
 6bc:	d65f03c0 	ret

00000000000006c0 <uart_recv>:
 6c0:	a9bf7bfd 	stp	x29, x30, [sp,#-16]!
 6c4:	910003fd 	mov	x29, sp
 6c8:	d28a0a80 	mov	x0, #0x5054                	// #20564
 6cc:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 6d0:	94000143 	bl	bdc <get32>
 6d4:	12000000 	and	w0, w0, #0x1
 6d8:	7100001f 	cmp	w0, #0x0
 6dc:	54000041 	b.ne	6e4 <uart_recv+0x24>
 6e0:	17fffffa 	b	6c8 <uart_recv+0x8>
 6e4:	d503201f 	nop
 6e8:	d28a0800 	mov	x0, #0x5040                	// #20544
 6ec:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 6f0:	9400013b 	bl	bdc <get32>
 6f4:	53001c00 	uxtb	w0, w0
 6f8:	a8c17bfd 	ldp	x29, x30, [sp],#16
 6fc:	d65f03c0 	ret

0000000000000700 <uart_send_string>:
 700:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 704:	910003fd 	mov	x29, sp
 708:	f9000fa0 	str	x0, [x29,#24]
 70c:	b9002fbf 	str	wzr, [x29,#44]
 710:	14000011 	b	754 <uart_send_string+0x54>
 714:	b9802fa0 	ldrsw	x0, [x29,#44]
 718:	f9400fa1 	ldr	x1, [x29,#24]
 71c:	8b000020 	add	x0, x1, x0
 720:	39400000 	ldrb	w0, [x0]
 724:	97ffffd4 	bl	674 <uart_send>
 728:	b9802fa0 	ldrsw	x0, [x29,#44]
 72c:	f9400fa1 	ldr	x1, [x29,#24]
 730:	8b000020 	add	x0, x1, x0
 734:	39400000 	ldrb	w0, [x0]
 738:	7100281f 	cmp	w0, #0xa
 73c:	54000061 	b.ne	748 <uart_send_string+0x48>
 740:	528001a0 	mov	w0, #0xd                   	// #13
 744:	97ffffcc 	bl	674 <uart_send>
 748:	b9402fa0 	ldr	w0, [x29,#44]
 74c:	11000400 	add	w0, w0, #0x1
 750:	b9002fa0 	str	w0, [x29,#44]
 754:	b9802fa0 	ldrsw	x0, [x29,#44]
 758:	f9400fa1 	ldr	x1, [x29,#24]
 75c:	8b000020 	add	x0, x1, x0
 760:	39400000 	ldrb	w0, [x0]
 764:	7100001f 	cmp	w0, #0x0
 768:	54fffd61 	b.ne	714 <uart_send_string+0x14>
 76c:	b9402fa0 	ldr	w0, [x29,#44]
 770:	51000400 	sub	w0, w0, #0x1
 774:	a8c37bfd 	ldp	x29, x30, [sp],#48
 778:	d65f03c0 	ret

000000000000077c <get_baud_reg>:
 77c:	d10083ff 	sub	sp, sp, #0x20
 780:	b9000fe0 	str	w0, [sp,#12]
 784:	529aca01 	mov	w1, #0xd650                	// #54864
 788:	72a03b81 	movk	w1, #0x1dc, lsl #16
 78c:	b9400fe0 	ldr	w0, [sp,#12]
 790:	1ac00820 	udiv	w0, w1, w0
 794:	51000400 	sub	w0, w0, #0x1
 798:	b9001fe0 	str	w0, [sp,#28]
 79c:	b9401fe0 	ldr	w0, [sp,#28]
 7a0:	910083ff 	add	sp, sp, #0x20
 7a4:	d65f03c0 	ret

00000000000007a8 <uart_init>:
 7a8:	a9bd7bfd 	stp	x29, x30, [sp,#-48]!
 7ac:	910003fd 	mov	x29, sp
 7b0:	b9001fa0 	str	w0, [x29,#28]
 7b4:	d2800080 	mov	x0, #0x4                   	// #4
 7b8:	f2a7e400 	movk	x0, #0x3f20, lsl #16
 7bc:	94000108 	bl	bdc <get32>
 7c0:	b9002fa0 	str	w0, [x29,#44]
 7c4:	b9402fa0 	ldr	w0, [x29,#44]
 7c8:	12117000 	and	w0, w0, #0xffff8fff
 7cc:	b9002fa0 	str	w0, [x29,#44]
 7d0:	b9402fa0 	ldr	w0, [x29,#44]
 7d4:	32130000 	orr	w0, w0, #0x2000
 7d8:	b9002fa0 	str	w0, [x29,#44]
 7dc:	b9402fa0 	ldr	w0, [x29,#44]
 7e0:	120e7000 	and	w0, w0, #0xfffc7fff
 7e4:	b9002fa0 	str	w0, [x29,#44]
 7e8:	b9402fa0 	ldr	w0, [x29,#44]
 7ec:	32100000 	orr	w0, w0, #0x10000
 7f0:	b9002fa0 	str	w0, [x29,#44]
 7f4:	b9402fa1 	ldr	w1, [x29,#44]
 7f8:	d2800080 	mov	x0, #0x4                   	// #4
 7fc:	f2a7e400 	movk	x0, #0x3f20, lsl #16
 800:	940000f5 	bl	bd4 <put32>
 804:	52800001 	mov	w1, #0x0                   	// #0
 808:	d2801280 	mov	x0, #0x94                  	// #148
 80c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
 810:	940000f1 	bl	bd4 <put32>
 814:	d28012c0 	mov	x0, #0x96                  	// #150
 818:	940000f3 	bl	be4 <delay>
 81c:	52980001 	mov	w1, #0xc000                	// #49152
 820:	d2801300 	mov	x0, #0x98                  	// #152
 824:	f2a7e400 	movk	x0, #0x3f20, lsl #16
 828:	940000eb 	bl	bd4 <put32>
 82c:	d28012c0 	mov	x0, #0x96                  	// #150
 830:	940000ed 	bl	be4 <delay>
 834:	52800001 	mov	w1, #0x0                   	// #0
 838:	d2801300 	mov	x0, #0x98                  	// #152
 83c:	f2a7e400 	movk	x0, #0x3f20, lsl #16
 840:	940000e5 	bl	bd4 <put32>
 844:	52800021 	mov	w1, #0x1                   	// #1
 848:	d28a0080 	mov	x0, #0x5004                	// #20484
 84c:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 850:	940000e1 	bl	bd4 <put32>
 854:	52800001 	mov	w1, #0x0                   	// #0
 858:	d28a0c00 	mov	x0, #0x5060                	// #20576
 85c:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 860:	940000dd 	bl	bd4 <put32>
 864:	52800001 	mov	w1, #0x0                   	// #0
 868:	d28a0880 	mov	x0, #0x5044                	// #20548
 86c:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 870:	940000d9 	bl	bd4 <put32>
 874:	52800061 	mov	w1, #0x3                   	// #3
 878:	d28a0980 	mov	x0, #0x504c                	// #20556
 87c:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 880:	940000d5 	bl	bd4 <put32>
 884:	52800001 	mov	w1, #0x0                   	// #0
 888:	d28a0a00 	mov	x0, #0x5050                	// #20560
 88c:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 890:	940000d1 	bl	bd4 <put32>
 894:	b9401fa0 	ldr	w0, [x29,#28]
 898:	97ffffb9 	bl	77c <get_baud_reg>
 89c:	b9002ba0 	str	w0, [x29,#40]
 8a0:	b9402ba1 	ldr	w1, [x29,#40]
 8a4:	d28a0d00 	mov	x0, #0x5068                	// #20584
 8a8:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 8ac:	940000ca 	bl	bd4 <put32>
 8b0:	52800061 	mov	w1, #0x3                   	// #3
 8b4:	d28a0c00 	mov	x0, #0x5060                	// #20576
 8b8:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 8bc:	940000c6 	bl	bd4 <put32>
 8c0:	d503201f 	nop
 8c4:	a8c37bfd 	ldp	x29, x30, [sp],#48
 8c8:	d65f03c0 	ret

00000000000008cc <mem_dump>:
 8cc:	d10103ff 	sub	sp, sp, #0x40
 8d0:	a9017bfd 	stp	x29, x30, [sp,#16]
 8d4:	910043fd 	add	x29, sp, #0x10
 8d8:	f9000fa0 	str	x0, [x29,#24]
 8dc:	b90017a1 	str	w1, [x29,#20]
 8e0:	90000000 	adrp	x0, 0 <_start>
 8e4:	91326000 	add	x0, x0, #0xc98
 8e8:	f90003e0 	str	x0, [sp]
 8ec:	52800007 	mov	w7, #0x0                   	// #0
 8f0:	52800006 	mov	w6, #0x0                   	// #0
 8f4:	52800005 	mov	w5, #0x0                   	// #0
 8f8:	52800004 	mov	w4, #0x0                   	// #0
 8fc:	52800003 	mov	w3, #0x0                   	// #0
 900:	52800002 	mov	w2, #0x0                   	// #0
 904:	52800001 	mov	w1, #0x0                   	// #0
 908:	52800000 	mov	w0, #0x0                   	// #0
 90c:	97fffeb5 	bl	3e0 <_printf>
 910:	b9002fbf 	str	wzr, [x29,#44]
 914:	1400004f 	b	a50 <mem_dump+0x184>
 918:	b9402fa0 	ldr	w0, [x29,#44]
 91c:	12000c00 	and	w0, w0, #0xf
 920:	7100001f 	cmp	w0, #0x0
 924:	540001c1 	b.ne	95c <mem_dump+0x90>
 928:	90000000 	adrp	x0, 0 <_start>
 92c:	9132c000 	add	x0, x0, #0xcb0
 930:	f90003e0 	str	x0, [sp]
 934:	52800007 	mov	w7, #0x0                   	// #0
 938:	52800006 	mov	w6, #0x0                   	// #0
 93c:	52800005 	mov	w5, #0x0                   	// #0
 940:	52800004 	mov	w4, #0x0                   	// #0
 944:	52800003 	mov	w3, #0x0                   	// #0
 948:	52800002 	mov	w2, #0x0                   	// #0
 94c:	52800001 	mov	w1, #0x0                   	// #0
 950:	52800000 	mov	w0, #0x0                   	// #0
 954:	97fffea3 	bl	3e0 <_printf>
 958:	14000011 	b	99c <mem_dump+0xd0>
 95c:	b9402fa0 	ldr	w0, [x29,#44]
 960:	12000800 	and	w0, w0, #0x7
 964:	7100001f 	cmp	w0, #0x0
 968:	540001a1 	b.ne	99c <mem_dump+0xd0>
 96c:	90000000 	adrp	x0, 0 <_start>
 970:	9132e000 	add	x0, x0, #0xcb8
 974:	f90003e0 	str	x0, [sp]
 978:	52800007 	mov	w7, #0x0                   	// #0
 97c:	52800006 	mov	w6, #0x0                   	// #0
 980:	52800005 	mov	w5, #0x0                   	// #0
 984:	52800004 	mov	w4, #0x0                   	// #0
 988:	52800003 	mov	w3, #0x0                   	// #0
 98c:	52800002 	mov	w2, #0x0                   	// #0
 990:	52800001 	mov	w1, #0x0                   	// #0
 994:	52800000 	mov	w0, #0x0                   	// #0
 998:	97fffe92 	bl	3e0 <_printf>
 99c:	b9802fa0 	ldrsw	x0, [x29,#44]
 9a0:	f9400fa1 	ldr	x1, [x29,#24]
 9a4:	8b000020 	add	x0, x1, x0
 9a8:	39400000 	ldrb	w0, [x0]
 9ac:	53047c00 	lsr	w0, w0, #4
 9b0:	3900afa0 	strb	w0, [x29,#43]
 9b4:	3940afa0 	ldrb	w0, [x29,#43]
 9b8:	1100c000 	add	w0, w0, #0x30
 9bc:	b9000be0 	str	w0, [sp,#8]
 9c0:	90000000 	adrp	x0, 0 <_start>
 9c4:	91330000 	add	x0, x0, #0xcc0
 9c8:	f90003e0 	str	x0, [sp]
 9cc:	52800007 	mov	w7, #0x0                   	// #0
 9d0:	52800006 	mov	w6, #0x0                   	// #0
 9d4:	52800005 	mov	w5, #0x0                   	// #0
 9d8:	52800004 	mov	w4, #0x0                   	// #0
 9dc:	52800003 	mov	w3, #0x0                   	// #0
 9e0:	52800002 	mov	w2, #0x0                   	// #0
 9e4:	52800001 	mov	w1, #0x0                   	// #0
 9e8:	52800000 	mov	w0, #0x0                   	// #0
 9ec:	97fffe7d 	bl	3e0 <_printf>
 9f0:	b9802fa0 	ldrsw	x0, [x29,#44]
 9f4:	f9400fa1 	ldr	x1, [x29,#24]
 9f8:	8b000020 	add	x0, x1, x0
 9fc:	39400000 	ldrb	w0, [x0]
 a00:	12000c00 	and	w0, w0, #0xf
 a04:	3900afa0 	strb	w0, [x29,#43]
 a08:	3940afa0 	ldrb	w0, [x29,#43]
 a0c:	1100c000 	add	w0, w0, #0x30
 a10:	b9000be0 	str	w0, [sp,#8]
 a14:	90000000 	adrp	x0, 0 <_start>
 a18:	91330000 	add	x0, x0, #0xcc0
 a1c:	f90003e0 	str	x0, [sp]
 a20:	52800007 	mov	w7, #0x0                   	// #0
 a24:	52800006 	mov	w6, #0x0                   	// #0
 a28:	52800005 	mov	w5, #0x0                   	// #0
 a2c:	52800004 	mov	w4, #0x0                   	// #0
 a30:	52800003 	mov	w3, #0x0                   	// #0
 a34:	52800002 	mov	w2, #0x0                   	// #0
 a38:	52800001 	mov	w1, #0x0                   	// #0
 a3c:	52800000 	mov	w0, #0x0                   	// #0
 a40:	97fffe68 	bl	3e0 <_printf>
 a44:	b9402fa0 	ldr	w0, [x29,#44]
 a48:	11000400 	add	w0, w0, #0x1
 a4c:	b9002fa0 	str	w0, [x29,#44]
 a50:	b9402fa1 	ldr	w1, [x29,#44]
 a54:	b94017a0 	ldr	w0, [x29,#20]
 a58:	6b00003f 	cmp	w1, w0
 a5c:	54fff5e3 	b.cc	918 <mem_dump+0x4c>
 a60:	90000000 	adrp	x0, 0 <_start>
 a64:	91332000 	add	x0, x0, #0xcc8
 a68:	f90003e0 	str	x0, [sp]
 a6c:	52800007 	mov	w7, #0x0                   	// #0
 a70:	52800006 	mov	w6, #0x0                   	// #0
 a74:	52800005 	mov	w5, #0x0                   	// #0
 a78:	52800004 	mov	w4, #0x0                   	// #0
 a7c:	52800003 	mov	w3, #0x0                   	// #0
 a80:	52800002 	mov	w2, #0x0                   	// #0
 a84:	52800001 	mov	w1, #0x0                   	// #0
 a88:	52800000 	mov	w0, #0x0                   	// #0
 a8c:	97fffe55 	bl	3e0 <_printf>
 a90:	d503201f 	nop
 a94:	910003bf 	mov	sp, x29
 a98:	a8c37bfd 	ldp	x29, x30, [sp],#48
 a9c:	d65f03c0 	ret

0000000000000aa0 <mem_cpy>:
 aa0:	d100c3ff 	sub	sp, sp, #0x30
 aa4:	f9000fe0 	str	x0, [sp,#24]
 aa8:	f9000be1 	str	x1, [sp,#16]
 aac:	b9000fe2 	str	w2, [sp,#12]
 ab0:	b9002fff 	str	wzr, [sp,#44]
 ab4:	1400000c 	b	ae4 <mem_cpy+0x44>
 ab8:	b9802fe0 	ldrsw	x0, [sp,#44]
 abc:	f9400be1 	ldr	x1, [sp,#16]
 ac0:	8b000020 	add	x0, x1, x0
 ac4:	b9802fe1 	ldrsw	x1, [sp,#44]
 ac8:	f9400fe2 	ldr	x2, [sp,#24]
 acc:	8b010041 	add	x1, x2, x1
 ad0:	39400021 	ldrb	w1, [x1]
 ad4:	39000001 	strb	w1, [x0]
 ad8:	b9402fe0 	ldr	w0, [sp,#44]
 adc:	11000400 	add	w0, w0, #0x1
 ae0:	b9002fe0 	str	w0, [sp,#44]
 ae4:	b9402fe1 	ldr	w1, [sp,#44]
 ae8:	b9400fe0 	ldr	w0, [sp,#12]
 aec:	6b00003f 	cmp	w1, w0
 af0:	54fffe4b 	b.lt	ab8 <mem_cpy+0x18>
 af4:	d503201f 	nop
 af8:	9100c3ff 	add	sp, sp, #0x30
 afc:	d65f03c0 	ret

0000000000000b00 <kernel_main>:
 b00:	d10103ff 	sub	sp, sp, #0x40
 b04:	a9017bfd 	stp	x29, x30, [sp,#16]
 b08:	910043fd 	add	x29, sp, #0x10
 b0c:	b9001fa0 	str	w0, [x29,#28]
 b10:	d503201f 	nop
 b14:	90000000 	adrp	x0, 0 <_start>
 b18:	9133e400 	add	x0, x0, #0xcf9
 b1c:	39400000 	ldrb	w0, [x0]
 b20:	53001c00 	uxtb	w0, w0
 b24:	2a0003e1 	mov	w1, w0
 b28:	b9401fa0 	ldr	w0, [x29,#28]
 b2c:	6b00003f 	cmp	w1, w0
 b30:	54ffff2b 	b.lt	b14 <kernel_main+0x14>
 b34:	b9401fa0 	ldr	w0, [x29,#28]
 b38:	b9000be0 	str	w0, [sp,#8]
 b3c:	90000000 	adrp	x0, 0 <_start>
 b40:	91336000 	add	x0, x0, #0xcd8
 b44:	f90003e0 	str	x0, [sp]
 b48:	52800007 	mov	w7, #0x0                   	// #0
 b4c:	52800006 	mov	w6, #0x0                   	// #0
 b50:	52800005 	mov	w5, #0x0                   	// #0
 b54:	52800004 	mov	w4, #0x0                   	// #0
 b58:	52800003 	mov	w3, #0x0                   	// #0
 b5c:	52800002 	mov	w2, #0x0                   	// #0
 b60:	52800001 	mov	w1, #0x0                   	// #0
 b64:	52800000 	mov	w0, #0x0                   	// #0
 b68:	97fffe1e 	bl	3e0 <_printf>
 b6c:	90000000 	adrp	x0, 0 <_start>
 b70:	9133e400 	add	x0, x0, #0xcf9
 b74:	39400000 	ldrb	w0, [x0]
 b78:	53001c00 	uxtb	w0, w0
 b7c:	11000400 	add	w0, w0, #0x1
 b80:	53001c01 	uxtb	w1, w0
 b84:	90000000 	adrp	x0, 0 <_start>
 b88:	9133e400 	add	x0, x0, #0xcf9
 b8c:	39000001 	strb	w1, [x0]
 b90:	1400000a 	b	bb8 <kernel_main+0xb8>
 b94:	97fffecb 	bl	6c0 <uart_recv>
 b98:	3900bfa0 	strb	w0, [x29,#47]
 b9c:	3940bfa0 	ldrb	w0, [x29,#47]
 ba0:	97fffeb5 	bl	674 <uart_send>
 ba4:	3940bfa0 	ldrb	w0, [x29,#47]
 ba8:	7100341f 	cmp	w0, #0xd
 bac:	54000061 	b.ne	bb8 <kernel_main+0xb8>
 bb0:	52800140 	mov	w0, #0xa                   	// #10
 bb4:	97fffeb0 	bl	674 <uart_send>
 bb8:	b9401fa0 	ldr	w0, [x29,#28]
 bbc:	71000c1f 	cmp	w0, #0x3
 bc0:	54fffea0 	b.eq	b94 <kernel_main+0x94>
 bc4:	d503201f 	nop
 bc8:	910003bf 	mov	sp, x29
 bcc:	a8c37bfd 	ldp	x29, x30, [sp],#48
 bd0:	d65f03c0 	ret

0000000000000bd4 <put32>:
 bd4:	b9000001 	str	w1, [x0]
 bd8:	d65f03c0 	ret

0000000000000bdc <get32>:
 bdc:	b9400000 	ldr	w0, [x0]
 be0:	d65f03c0 	ret

0000000000000be4 <delay>:
 be4:	f1000400 	subs	x0, x0, #0x1
 be8:	54ffffe1 	b.ne	be4 <delay>
 bec:	d65f03c0 	ret

0000000000000bf0 <memzero>:
 bf0:	f800841f 	str	xzr, [x0],#8
 bf4:	f1002021 	subs	x1, x1, #0x8
 bf8:	54ffffcc 	b.gt	bf0 <memzero>
 bfc:	d65f03c0 	ret

Disassembly of section .rodata:

0000000000000c00 <.rodata>:
	...
 c28:	00000004 	.word	0x00000004
 c2c:	00000004 	.word	0x00000004
 c30:	00000004 	.word	0x00000004
 c34:	00000004 	.word	0x00000004
 c38:	00000004 	.word	0x00000004
 c3c:	00000004 	.word	0x00000004
 c40:	0000000a 	.word	0x0000000a
 c44:	00000000 	.word	0x00000000
 c48:	0000000e 	.word	0x0000000e
 c4c:	0000000e 	.word	0x0000000e
 c50:	0000000e 	.word	0x0000000e
 c54:	0000000e 	.word	0x0000000e
 c58:	0000000e 	.word	0x0000000e
 c5c:	0000000e 	.word	0x0000000e
 c60:	0000000e 	.word	0x0000000e
 c64:	00000004 	.word	0x00000004
 c68:	0000000e 	.word	0x0000000e
 c6c:	0000000e 	.word	0x0000000e
 c70:	0000000e 	.word	0x0000000e
 c74:	0000000e 	.word	0x0000000e
 c78:	0000000e 	.word	0x0000000e
 c7c:	0000000e 	.word	0x0000000e
 c80:	0000000e 	.word	0x0000000e
 c84:	0000000e 	.word	0x0000000e
 c88:	0000000e 	.word	0x0000000e
 c8c:	0000000e 	.word	0x0000000e
 c90:	0000000e 	.word	0x0000000e
 c94:	00000006 	.word	0x00000006
 c98:	3d3d0d0a 	.word	0x3d3d0d0a
 c9c:	656d203d 	.word	0x656d203d
 ca0:	7564206d 	.word	0x7564206d
 ca4:	3d20706d 	.word	0x3d20706d
 ca8:	0d0a3d3d 	.word	0x0d0a3d3d
 cac:	00000000 	.word	0x00000000
 cb0:	0000000a 	.word	0x0000000a
 cb4:	00000000 	.word	0x00000000
 cb8:	00000020 	.word	0x00000020
 cbc:	00000000 	.word	0x00000000
 cc0:	00006325 	.word	0x00006325
 cc4:	00000000 	.word	0x00000000
 cc8:	3d3d0d0a 	.word	0x3d3d0d0a
 ccc:	3d3d3d3d 	.word	0x3d3d3d3d
 cd0:	00000d0a 	.word	0x00000d0a
 cd4:	00000000 	.word	0x00000000
 cd8:	6c6c6548 	.word	0x6c6c6548
 cdc:	74202c6f 	.word	0x74202c6f
 ce0:	20736968 	.word	0x20736968
 ce4:	70207369 	.word	0x70207369
 ce8:	65636f72 	.word	0x65636f72
 cec:	72657373 	.word	0x72657373
 cf0:	0a642520 	.word	0x0a642520
	...

Disassembly of section .bss:

0000000000000cf8 <bss_begin>:
	...

0000000000000cf9 <inited>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	3a434347 	ccmn	w26, w3, #0x7, mi
   4:	62552820 	.inst	0x62552820 ; undefined
   8:	75746e75 	.inst	0x75746e75 ; undefined
   c:	6e694c2f 	uqshl	v15.8h, v1.8h, v9.8h
  10:	206f7261 	.inst	0x206f7261 ; undefined
  14:	2e342e35 	uqsub	v21.8b, v17.8b, v20.8b
  18:	75362d30 	.inst	0x75362d30 ; undefined
  1c:	746e7562 	.inst	0x746e7562 ; undefined
  20:	317e3175 	adds	w21, w11, #0xf8c, lsl #12
  24:	34302e36 	cbz	w22, 605e8 <bss_end+0x5f8ee>
  28:	2029392e 	.inst	0x2029392e ; undefined
  2c:	2e342e35 	uqsub	v21.8b, v17.8b, v20.8b
  30:	30322030 	adr	x16, 64435 <bss_end+0x6373b>
  34:	36303631 	tbz	w17, #6, 6f8 <uart_recv+0x38>
  38:	Address 0x0000000000000038 is out of bounds.

