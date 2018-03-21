	.file	"tasks.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"-----------------------------"
.LC1:
	.string	"Get data from ID: "
.LC2:
	.string	"\t"
	.section	.text.FuncTaskL1,"ax",@progbits
.global	FuncTaskL1
	.type	FuncTaskL1, @function
FuncTaskL1:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,9
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 9 */
/* stack size = 17 */
.L__stack_usage = 17
	lds r24,isr_cnt
	lds r25,isr_cnt+1
	adiw r24,1
	sts isr_cnt+1,r25
	sts isr_cnt,r24
	std Y+9,__zero_reg__
	lds r24,isr_cnt
	lds r25,isr_cnt+1
	cpi r24,-24
	sbci r25,3
	brsh .+2
	rjmp .L3
	sts isr_cnt+1,__zero_reg__
	sts isr_cnt,__zero_reg__
	ldi r24,lo8(CAN_rec)
	ldi r25,hi8(CAN_rec)
	call _ZN7MCP_CAN12checkReceiveEv
	cpi r24,lo8(3)
	breq .+2
	rjmp .L3
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	movw r20,r16
	movw r22,r28
	subi r22,-9
	sbci r23,-1
	ldi r24,lo8(CAN_rec)
	ldi r25,hi8(CAN_rec)
	call _ZN7MCP_CAN10readMsgBufEPhS0_
	ldi r24,lo8(CAN_rec)
	ldi r25,hi8(CAN_rec)
	call _ZN7MCP_CAN8getCanIdEv
	movw r12,r22
	movw r14,r24
	ldi r22,lo8(.LC0)
	ldi r23,hi8(.LC0)
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN5Print7printlnEPKc
	ldi r22,lo8(.LC1)
	ldi r23,hi8(.LC1)
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN5Print5printEPKc
	ldi r20,lo8(16)
	ldi r21,0
	movw r22,r12
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN5Print7printlnEji
	movw r14,r16
.L5:
	ldd r24,Y+9
	ldi r25,0
	movw r18,r14
	sub r18,r16
	sbc r19,r17
	cp r18,r24
	cpc r19,r25
	brge .L8
	movw r30,r14
	ld r22,Z+
	movw r14,r30
	ldi r20,lo8(16)
	ldi r21,0
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN5Print5printEhi
	ldi r22,lo8(.LC2)
	ldi r23,hi8(.LC2)
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN5Print5printEPKc
	rjmp .L5
.L8:
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN5Print7printlnEv
.L3:
	lds r24,TaskL1_count
	lds r25,TaskL1_count+1
	adiw r24,1
	sts TaskL1_count+1,r25
	sts TaskL1_count,r24
	call TerminateTask
/* epilogue start */
	adiw r28,9
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	FuncTaskL1, .-FuncTaskL1
	.section	.text.startup._GLOBAL__sub_I_TaskL1_count,"ax",@progbits
	.type	_GLOBAL__sub_I_TaskL1_count, @function
_GLOBAL__sub_I_TaskL1_count:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r22,lo8(10)
	ldi r24,lo8(CAN_rec)
	ldi r25,hi8(CAN_rec)
	jmp _ZN7MCP_CANC1Eh
	.size	_GLOBAL__sub_I_TaskL1_count, .-_GLOBAL__sub_I_TaskL1_count
	.global __do_global_ctors
	.section .ctors,"a",@progbits
	.p2align	1
	.word	gs(_GLOBAL__sub_I_TaskL1_count)
	.section	.rodata.str1.1
.LC3:
	.string	"TASK-L2\r\n"
	.section	.text.FuncTaskL2,"ax",@progbits
.global	FuncTaskL2
	.type	FuncTaskL2, @function
FuncTaskL2:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	ldi r20,lo8(9)
	ldi r21,0
	ldi r22,lo8(.LC3)
	ldi r23,hi8(.LC3)
	ldi r24,lo8(Serial)
	ldi r25,hi8(Serial)
	call _ZN5Print5writeEPKhj
	ldi r28,lo8(led)
	ldi r29,hi8(led)
	ldi r22,lo8(1)
	ld r24,Y
	call digitalWrite
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	ldi r24,0
	ldi r25,0
	call delay
	ldi r22,0
	ld r24,Y
	call digitalWrite
	ldi r22,lo8(-24)
	ldi r23,lo8(3)
	ldi r24,0
	ldi r25,0
	call delay
	lds r24,TaskL2_count
	lds r25,TaskL2_count+1
	adiw r24,1
	sts TaskL2_count+1,r25
	sts TaskL2_count,r24
/* epilogue start */
	pop r29
	pop r28
	jmp TerminateTask
	.size	FuncTaskL2, .-FuncTaskL2
.global	CAN_rec
	.section	.bss.CAN_rec,"aw",@nobits
	.type	CAN_rec, @object
	.size	CAN_rec, 10
CAN_rec:
	.zero	10
.global	isr_cnt
	.section	.bss.isr_cnt,"aw",@nobits
	.type	isr_cnt, @object
	.size	isr_cnt, 2
isr_cnt:
	.zero	2
.global	TaskL2_count
	.section	.bss.TaskL2_count,"aw",@nobits
	.type	TaskL2_count, @object
	.size	TaskL2_count, 2
TaskL2_count:
	.zero	2
.global	TaskL1_count
	.section	.bss.TaskL1_count,"aw",@nobits
	.type	TaskL1_count, @object
	.size	TaskL1_count, 2
TaskL1_count:
	.zero	2
	.ident	"GCC: (GNU) 4.9.2"
.global __do_copy_data
.global __do_clear_bss
