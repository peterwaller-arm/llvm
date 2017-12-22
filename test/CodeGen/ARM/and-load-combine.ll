; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=armv7 %s -o - | FileCheck %s --check-prefix=ARM
; RUN: llc -mtriple=armv7eb %s -o - | FileCheck %s --check-prefix=ARMEB
; RUN: llc -mtriple=armv6m %s -o - | FileCheck %s --check-prefix=THUMB1
; RUN: llc -mtriple=thumbv8m.main %s -o - | FileCheck %s --check-prefix=THUMB2

define arm_aapcscc zeroext i1 @cmp_xor8_short_short(i16* nocapture readonly %a,
                                                    i16* nocapture readonly %b) {
; ARM-LABEL: cmp_xor8_short_short:
; ARM:         ldrb r2, [r0]
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    teq r1, r2
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_xor8_short_short:
; ARMEB:        ldrb r2, [r0, #1]
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    ldrb r1, [r1, #1]
; ARMEB-NEXT:    teq r1, r2
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_xor8_short_short:
; THUMB1:         ldrb r0, [r0]
; THUMB1-NEXT:    ldrb r2, [r1]
; THUMB1-NEXT:    eors r2, r0
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r2, #0
; THUMB1-NEXT:    beq .LBB0_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB0_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_xor8_short_short:
; THUMB2:         ldrb r2, [r0]
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    teq.w r1, r2
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i16, i16* %a, align 2
  %1 = load i16, i16* %b, align 2
  %xor2 = xor i16 %1, %0
  %2 = and i16 %xor2, 255
  %cmp = icmp eq i16 %2, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_xor8_short_int(i16* nocapture readonly %a,
                                                  i32* nocapture readonly %b) {
; ARM-LABEL: cmp_xor8_short_int:
; ARM:         ldrb r2, [r0]
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    teq r1, r2
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_xor8_short_int:
; ARMEB:         ldrb r2, [r0, #1]
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    ldrb r1, [r1, #3]
; ARMEB-NEXT:    teq r1, r2
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_xor8_short_int:
; THUMB1:         ldrb r0, [r0]
; THUMB1-NEXT:    ldrb r2, [r1]
; THUMB1-NEXT:    eors r2, r0
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r2, #0
; THUMB1-NEXT:    beq .LBB1_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB1_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_xor8_short_int:
; THUMB2:         ldrb r2, [r0]
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    teq.w r1, r2
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i16, i16* %a, align 2
  %conv = zext i16 %0 to i32
  %1 = load i32, i32* %b, align 4
  %xor = xor i32 %1, %conv
  %and = and i32 %xor, 255
  %cmp = icmp eq i32 %and, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_xor8_int_int(i32* nocapture readonly %a,
                                                i32* nocapture readonly %b) {
; ARM-LABEL: cmp_xor8_int_int:
; ARM:         ldrb r2, [r0]
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    teq r1, r2
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_xor8_int_int:
; ARMEB:         ldrb r2, [r0, #3]
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    ldrb r1, [r1, #3]
; ARMEB-NEXT:    teq r1, r2
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_xor8_int_int:
; THUMB1:         ldrb r0, [r0]
; THUMB1-NEXT:    ldrb r2, [r1]
; THUMB1-NEXT:    eors r2, r0
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r2, #0
; THUMB1-NEXT:    beq .LBB2_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB2_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_xor8_int_int:
; THUMB2:         ldrb r2, [r0]
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    teq.w r1, r2
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %xor = xor i32 %1, %0
  %and = and i32 %xor, 255
  %cmp = icmp eq i32 %and, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_xor16(i32* nocapture readonly %a,
                                         i32* nocapture readonly %b) {
; ARM-LABEL: cmp_xor16:
; ARM:         ldrh r2, [r0]
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    ldrh r1, [r1]
; ARM-NEXT:    teq r1, r2
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_xor16:
; ARMEB:         ldrh r2, [r0, #2]
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    ldrh r1, [r1, #2]
; ARMEB-NEXT:    teq r1, r2
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_xor16:
; THUMB1:         ldrh r0, [r0]
; THUMB1-NEXT:    ldrh r2, [r1]
; THUMB1-NEXT:    eors r2, r0
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r2, #0
; THUMB1-NEXT:    beq .LBB3_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB3_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_xor16:
; THUMB2:         ldrh r2, [r0]
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    ldrh r1, [r1]
; THUMB2-NEXT:    teq.w r1, r2
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %xor = xor i32 %1, %0
  %and = and i32 %xor, 65535
  %cmp = icmp eq i32 %and, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_or8_short_short(i16* nocapture readonly %a,
                                                   i16* nocapture readonly %b) {
; ARM-LABEL: cmp_or8_short_short:
; ARM:         ldrb r0, [r0]
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    orrs r0, r1, r0
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_or8_short_short:
; ARMEB:         ldrb r0, [r0, #1]
; ARMEB-NEXT:    ldrb r1, [r1, #1]
; ARMEB-NEXT:    orrs r0, r1, r0
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_or8_short_short:
; THUMB1:         ldrb r0, [r0]
; THUMB1-NEXT:    ldrb r2, [r1]
; THUMB1-NEXT:    orrs r2, r0
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r2, #0
; THUMB1-NEXT:    beq .LBB4_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB4_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_or8_short_short:
; THUMB2:         ldrb r0, [r0]
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    mov.w r0, #0
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i16, i16* %a, align 2
  %1 = load i16, i16* %b, align 2
  %or2 = or i16 %1, %0
  %2 = and i16 %or2, 255
  %cmp = icmp eq i16 %2, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_or8_short_int(i16* nocapture readonly %a,
                                                 i32* nocapture readonly %b) {
; ARM-LABEL: cmp_or8_short_int:
; ARM:         ldrb r0, [r0]
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    orrs r0, r1, r0
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_or8_short_int:
; ARMEB:         ldrb r0, [r0, #1]
; ARMEB-NEXT:    ldrb r1, [r1, #3]
; ARMEB-NEXT:    orrs r0, r1, r0
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_or8_short_int:
; THUMB1:         ldrb r0, [r0]
; THUMB1-NEXT:    ldrb r2, [r1]
; THUMB1-NEXT:    orrs r2, r0
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r2, #0
; THUMB1-NEXT:    beq .LBB5_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB5_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_or8_short_int:
; THUMB2:         ldrb r0, [r0]
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    mov.w r0, #0
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i16, i16* %a, align 2
  %conv = zext i16 %0 to i32
  %1 = load i32, i32* %b, align 4
  %or = or i32 %1, %conv
  %and = and i32 %or, 255
  %cmp = icmp eq i32 %and, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_or8_int_int(i32* nocapture readonly %a,
                                               i32* nocapture readonly %b) {
; ARM-LABEL: cmp_or8_int_int:
; ARM:         ldrb r0, [r0]
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    orrs r0, r1, r0
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_or8_int_int:
; ARMEB:         ldrb r0, [r0, #3]
; ARMEB-NEXT:    ldrb r1, [r1, #3]
; ARMEB-NEXT:    orrs r0, r1, r0
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_or8_int_int:
; THUMB1:         ldrb r0, [r0]
; THUMB1-NEXT:    ldrb r2, [r1]
; THUMB1-NEXT:    orrs r2, r0
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r2, #0
; THUMB1-NEXT:    beq .LBB6_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB6_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_or8_int_int:
; THUMB2:         ldrb r0, [r0]
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    mov.w r0, #0
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %or = or i32 %1, %0
  %and = and i32 %or, 255
  %cmp = icmp eq i32 %and, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_or16(i32* nocapture readonly %a,
                                        i32* nocapture readonly %b) {
; ARM-LABEL: cmp_or16:
; ARM:         ldrh r0, [r0]
; ARM-NEXT:    ldrh r1, [r1]
; ARM-NEXT:    orrs r0, r1, r0
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_or16:
; ARMEB:         ldrh r0, [r0, #2]
; ARMEB-NEXT:    ldrh r1, [r1, #2]
; ARMEB-NEXT:    orrs r0, r1, r0
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_or16:
; THUMB1:         ldrh r0, [r0]
; THUMB1-NEXT:    ldrh r2, [r1]
; THUMB1-NEXT:    orrs r2, r0
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r2, #0
; THUMB1-NEXT:    beq .LBB7_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB7_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_or16:
; THUMB2:         ldrh r0, [r0]
; THUMB2-NEXT:    ldrh r1, [r1]
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    mov.w r0, #0
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %or = or i32 %1, %0
  %and = and i32 %or, 65535
  %cmp = icmp eq i32 %and, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_and8_short_short(i16* nocapture readonly %a,
                                                    i16* nocapture readonly %b) {
; ARM-LABEL: cmp_and8_short_short:
; ARM:         ldrb r2, [r0]
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    tst r2, r1
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_and8_short_short:
; ARMEB:         ldrb r2, [r0, #1]
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    ldrb r1, [r1, #1]
; ARMEB-NEXT:    tst r2, r1
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_and8_short_short:
; THUMB1:         ldrb r2, [r1]
; THUMB1-NEXT:    ldrb r3, [r0]
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    tst r3, r2
; THUMB1-NEXT:    beq .LBB8_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB8_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_and8_short_short:
; THUMB2:         ldrb r2, [r0]
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    tst r2, r1
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i16, i16* %a, align 2
  %1 = load i16, i16* %b, align 2
  %and3 = and i16 %0, 255
  %2 = and i16 %and3, %1
  %cmp = icmp eq i16 %2, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_and8_short_int(i16* nocapture readonly %a,
                                                  i32* nocapture readonly %b) {
; ARM-LABEL: cmp_and8_short_int:
; ARM:         ldrb r2, [r0]
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    tst r1, r2
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_and8_short_int:
; ARMEB:         ldrb r2, [r0, #1]
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    ldrb r1, [r1, #3]
; ARMEB-NEXT:    tst r1, r2
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_and8_short_int:
; THUMB1:         ldrb r2, [r0]
; THUMB1-NEXT:    ldrb r3, [r1]
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    tst r3, r2
; THUMB1-NEXT:    beq .LBB9_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB9_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_and8_short_int:
; THUMB2:         ldrb r2, [r0]
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    tst r1, r2
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i16, i16* %a, align 2
  %1 = load i32, i32* %b, align 4
  %2 = and i16 %0, 255
  %and = zext i16 %2 to i32
  %and1 = and i32 %1, %and
  %cmp = icmp eq i32 %and1, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_and8_int_int(i32* nocapture readonly %a,
                                                i32* nocapture readonly %b) {
; ARM-LABEL: cmp_and8_int_int:
; ARM:         ldrb r2, [r0]
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    ldrb r1, [r1]
; ARM-NEXT:    tst r2, r1
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_and8_int_int:
; ARMEB:         ldrb r2, [r0, #3]
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    ldrb r1, [r1, #3]
; ARMEB-NEXT:    tst r2, r1
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_and8_int_int:
; THUMB1:         ldrb r2, [r1]
; THUMB1-NEXT:    ldrb r3, [r0]
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    tst r3, r2
; THUMB1-NEXT:    beq .LBB10_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB10_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_and8_int_int:
; THUMB2:         ldrb r2, [r0]
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    ldrb r1, [r1]
; THUMB2-NEXT:    tst r2, r1
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %and = and i32 %0, 255
  %and1 = and i32 %and, %1
  %cmp = icmp eq i32 %and1, 0
  ret i1 %cmp
}

define arm_aapcscc zeroext i1 @cmp_and16(i32* nocapture readonly %a,
                                         i32* nocapture readonly %b) {
; ARM-LABEL: cmp_and16:
; ARM:         ldrh r2, [r0]
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    ldrh r1, [r1]
; ARM-NEXT:    tst r2, r1
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: cmp_and16:
; ARMEB:         ldrh r2, [r0, #2]
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    ldrh r1, [r1, #2]
; ARMEB-NEXT:    tst r2, r1
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: cmp_and16:
; THUMB1:         ldrh r2, [r1]
; THUMB1-NEXT:    ldrh r3, [r0]
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    tst r3, r2
; THUMB1-NEXT:    beq .LBB11_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB11_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: cmp_and16:
; THUMB2:         ldrh r2, [r0]
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    ldrh r1, [r1]
; THUMB2-NEXT:    tst r2, r1
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %and = and i32 %0, 65535
  %and1 = and i32 %and, %1
  %cmp = icmp eq i32 %and1, 0
  ret i1 %cmp
}

define arm_aapcscc i32 @add_and16(i32* nocapture readonly %a, i32 %y, i32 %z) {
; ARM-LABEL: add_and16:
; ARM:         add r1, r1, r2
; ARM-NEXT:    ldrh r0, [r0]
; ARM-NEXT:    uxth r1, r1
; ARM-NEXT:    orr r0, r0, r1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: add_and16:
; ARMEB:         add r1, r1, r2
; ARMEB-NEXT:    ldrh r0, [r0, #2]
; ARMEB-NEXT:    uxth r1, r1
; ARMEB-NEXT:    orr r0, r0, r1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: add_and16:
; THUMB1:         adds r1, r1, r2
; THUMB1-NEXT:    uxth r1, r1
; THUMB1-NEXT:    ldrh r0, [r0]
; THUMB1-NEXT:    orrs r0, r1
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: add_and16:
; THUMB2:         add r1, r2
; THUMB2-NEXT:    ldrh r0, [r0]
; THUMB2-NEXT:    uxth r1, r1
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    bx lr
entry:
  %x = load i32, i32* %a, align 4
  %add = add i32 %y, %z
  %or = or i32 %x, %add
  %and = and i32 %or, 65535
  ret i32 %and
}

define arm_aapcscc i32 @test1(i32* %a, i32* %b, i32 %x, i32 %y) {
; ARM-LABEL: test1:
; ARM:         mul r2, r2, r3
; ARM-NEXT:    ldrh r1, [r1]
; ARM-NEXT:    ldrh r0, [r0]
; ARM-NEXT:    eor r0, r0, r1
; ARM-NEXT:    uxth r1, r2
; ARM-NEXT:    orr r0, r0, r1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test1:
; ARMEB:         mul r2, r2, r3
; ARMEB-NEXT:    ldrh r1, [r1, #2]
; ARMEB-NEXT:    ldrh r0, [r0, #2]
; ARMEB-NEXT:    eor r0, r0, r1
; ARMEB-NEXT:    uxth r1, r2
; ARMEB-NEXT:    orr r0, r0, r1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test1:
; THUMB1:         ldrh r1, [r1]
; THUMB1-NEXT:    ldrh r4, [r0]
; THUMB1-NEXT:    eors r4, r1
; THUMB1-NEXT:    muls r2, r3, r2
; THUMB1-NEXT:    uxth r0, r2
; THUMB1-NEXT:    orrs r0, r4
; THUMB1-NEXT:    pop
;
; THUMB2-LABEL: test1:
; THUMB2:         ldrh r1, [r1]
; THUMB2-NEXT:    ldrh r0, [r0]
; THUMB2-NEXT:    eors r0, r1
; THUMB2-NEXT:    mul r1, r2, r3
; THUMB2-NEXT:    uxth r1, r1
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %mul = mul i32 %x, %y
  %xor = xor i32 %0, %1
  %or = or i32 %xor, %mul
  %and = and i32 %or, 65535
  ret i32 %and
}

define arm_aapcscc i32 @test2(i32* %a, i32* %b, i32 %x, i32 %y) {
; ARM-LABEL: test2:
; ARM:         ldr r1, [r1]
; ARM-NEXT:    ldr r0, [r0]
; ARM-NEXT:    mul r1, r2, r1
; ARM-NEXT:    eor r0, r0, r3
; ARM-NEXT:    orr r0, r0, r1
; ARM-NEXT:    uxth r0, r0
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test2:
; ARMEB:         ldr r1, [r1]
; ARMEB-NEXT:    ldr r0, [r0]
; ARMEB-NEXT:    mul r1, r2, r1
; ARMEB-NEXT:    eor r0, r0, r3
; ARMEB-NEXT:    orr r0, r0, r1
; ARMEB-NEXT:    uxth r0, r0
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test2:
; THUMB1:         ldr r1, [r1]
; THUMB1-NEXT:    muls r1, r2, r1
; THUMB1-NEXT:    ldr r0, [r0]
; THUMB1-NEXT:    eors r0, r3
; THUMB1-NEXT:    orrs r0, r1
; THUMB1-NEXT:    uxth r0, r0
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: test2:
; THUMB2:         ldr r1, [r1]
; THUMB2-NEXT:    ldr r0, [r0]
; THUMB2-NEXT:    muls r1, r2, r1
; THUMB2-NEXT:    eors r0, r3
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    uxth r0, r0
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %mul = mul i32 %x, %1
  %xor = xor i32 %0, %y
  %or = or i32 %xor, %mul
  %and = and i32 %or, 65535
  ret i32 %and
}

define arm_aapcscc i32 @test3(i32* %a, i32* %b, i32 %x, i16* %y) {
; ARM-LABEL: test3:
; ARM:         ldr r0, [r0]
; ARM-NEXT:    mul r1, r2, r0
; ARM-NEXT:    ldrh r2, [r3]
; ARM-NEXT:    eor r0, r0, r2
; ARM-NEXT:    orr r0, r0, r1
; ARM-NEXT:    uxth r0, r0
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test3:
; ARMEB:         ldr r0, [r0]
; ARMEB-NEXT:    mul r1, r2, r0
; ARMEB-NEXT:    ldrh r2, [r3]
; ARMEB-NEXT:    eor r0, r0, r2
; ARMEB-NEXT:    orr r0, r0, r1
; ARMEB-NEXT:    uxth r0, r0
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test3:
; THUMB1:         ldr r0, [r0]
; THUMB1-NEXT:    muls r2, r0, r2
; THUMB1-NEXT:    ldrh r1, [r3]
; THUMB1-NEXT:    eors r1, r0
; THUMB1-NEXT:    orrs r1, r2
; THUMB1-NEXT:    uxth r0, r1
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: test3:
; THUMB2:         ldr r0, [r0]
; THUMB2-NEXT:    mul r1, r2, r0
; THUMB2-NEXT:    ldrh r2, [r3]
; THUMB2-NEXT:    eors r0, r2
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    uxth r0, r0
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i16, i16* %y, align 4
  %2 = zext i16 %1 to i32
  %mul = mul i32 %x, %0
  %xor = xor i32 %0, %2
  %or = or i32 %xor, %mul
  %and = and i32 %or, 65535
  ret i32 %and
}

define arm_aapcscc i32 @test4(i32* %a, i32* %b, i32 %x, i32 %y) {
; ARM-LABEL: test4:
; ARM:         mul r2, r2, r3
; ARM-NEXT:    ldrh r1, [r1]
; ARM-NEXT:    ldrh r0, [r0]
; ARM-NEXT:    eor r0, r0, r1
; ARM-NEXT:    uxth r1, r2
; ARM-NEXT:    orr r0, r0, r1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test4:
; ARMEB:         mul r2, r2, r3
; ARMEB-NEXT:    ldrh r1, [r1, #2]
; ARMEB-NEXT:    ldrh r0, [r0, #2]
; ARMEB-NEXT:    eor r0, r0, r1
; ARMEB-NEXT:    uxth r1, r2
; ARMEB-NEXT:    orr r0, r0, r1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test4:
; THUMB1:         ldrh r1, [r1]
; THUMB1-NEXT:    ldrh r4, [r0]
; THUMB1-NEXT:    eors r4, r1
; THUMB1-NEXT:    muls r2, r3, r2
; THUMB1-NEXT:    uxth r0, r2
; THUMB1-NEXT:    orrs r0, r4
; THUMB1-NEXT:    pop
;
; THUMB2-LABEL: test4:
; THUMB2:         ldrh r1, [r1]
; THUMB2-NEXT:    ldrh r0, [r0]
; THUMB2-NEXT:    eors r0, r1
; THUMB2-NEXT:    mul r1, r2, r3
; THUMB2-NEXT:    uxth r1, r1
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %mul = mul i32 %x, %y
  %xor = xor i32 %0, %1
  %or = or i32 %xor, %mul
  %and = and i32 %or, 65535
  ret i32 %and
}

define arm_aapcscc i32 @test5(i32* %a, i32* %b, i32 %x, i16 zeroext %y) {
; ARM-LABEL: test5:
; ARM:         ldr r1, [r1]
; ARM-NEXT:    ldrh r0, [r0]
; ARM-NEXT:    mul r1, r2, r1
; ARM-NEXT:    eor r0, r0, r3
; ARM-NEXT:    uxth r1, r1
; ARM-NEXT:    orr r0, r0, r1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test5:
; ARMEB:         ldr r1, [r1]
; ARMEB-NEXT:    ldrh r0, [r0, #2]
; ARMEB-NEXT:    mul r1, r2, r1
; ARMEB-NEXT:    eor r0, r0, r3
; ARMEB-NEXT:    uxth r1, r1
; ARMEB-NEXT:    orr r0, r0, r1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test5:
; THUMB1:         ldrh r4, [r0]
; THUMB1-NEXT:    eors r4, r3
; THUMB1-NEXT:    ldr r0, [r1]
; THUMB1-NEXT:    muls r0, r2, r0
; THUMB1-NEXT:    uxth r0, r0
; THUMB1-NEXT:    orrs r0, r4
; THUMB1-NEXT:    pop
;
; THUMB2-LABEL: test5:
; THUMB2:         ldr r1, [r1]
; THUMB2-NEXT:    ldrh r0, [r0]
; THUMB2-NEXT:    muls r1, r2, r1
; THUMB2-NEXT:    eors r0, r3
; THUMB2-NEXT:    uxth r1, r1
; THUMB2-NEXT:    orrs r0, r1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %a, align 4
  %1 = load i32, i32* %b, align 4
  %mul = mul i32 %x, %1
  %ext = zext i16 %y to i32
  %xor = xor i32 %0, %ext
  %or = or i32 %xor, %mul
  %and = and i32 %or, 65535
  ret i32 %and
}

define arm_aapcscc i1 @test6(i8* %x, i8 %y, i8 %z) {
; ARM-LABEL: test6:
; ARM:       @ %bb.0: @ %entry
; ARM-NEXT:    ldrb r0, [r0]
; ARM-NEXT:    uxtb r2, r2
; ARM-NEXT:    and r0, r0, r1
; ARM-NEXT:    uxtb r1, r0
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    cmp r1, r2
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test6:
; ARMEB:       @ %bb.0: @ %entry
; ARMEB-NEXT:    ldrb r0, [r0]
; ARMEB-NEXT:    uxtb r2, r2
; ARMEB-NEXT:    and r0, r0, r1
; ARMEB-NEXT:    uxtb r1, r0
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    cmp r1, r2
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test6:
; THUMB1:       @ %bb.0: @ %entry
; THUMB1-NEXT:    ldrb r0, [r0]
; THUMB1-NEXT:    ands r0, r1
; THUMB1-NEXT:    uxtb r3, r0
; THUMB1-NEXT:    uxtb r2, r2
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r3, r2
; THUMB1-NEXT:    beq .LBB18_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB18_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: test6:
; THUMB2:       @ %bb.0: @ %entry
; THUMB2-NEXT:    ldrb r0, [r0]
; THUMB2-NEXT:    uxtb r2, r2
; THUMB2-NEXT:    ands r0, r1
; THUMB2-NEXT:    uxtb r1, r0
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    cmp r1, r2
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i8, i8* %x, align 4
  %1 = and i8 %0, %y
  %2 = icmp eq i8 %1, %z
  ret i1 %2
}

define arm_aapcscc i1 @test7(i16* %x, i16 %y, i8 %z) {
; ARM-LABEL: test7:
; ARM:       @ %bb.0: @ %entry
; ARM-NEXT:    ldrb r0, [r0]
; ARM-NEXT:    uxtb r2, r2
; ARM-NEXT:    and r1, r0, r1
; ARM-NEXT:    mov r0, #0
; ARM-NEXT:    cmp r1, r2
; ARM-NEXT:    movweq r0, #1
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test7:
; ARMEB:       @ %bb.0: @ %entry
; ARMEB-NEXT:    ldrb r0, [r0, #1]
; ARMEB-NEXT:    uxtb r2, r2
; ARMEB-NEXT:    and r1, r0, r1
; ARMEB-NEXT:    mov r0, #0
; ARMEB-NEXT:    cmp r1, r2
; ARMEB-NEXT:    movweq r0, #1
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test7:
; THUMB1:       @ %bb.0: @ %entry
; THUMB1-NEXT:    ldrb r3, [r0]
; THUMB1-NEXT:    ands r3, r1
; THUMB1-NEXT:    uxtb r2, r2
; THUMB1-NEXT:    movs r0, #1
; THUMB1-NEXT:    movs r1, #0
; THUMB1-NEXT:    cmp r3, r2
; THUMB1-NEXT:    beq .LBB19_2
; THUMB1-NEXT:  @ %bb.1: @ %entry
; THUMB1-NEXT:    mov r0, r1
; THUMB1-NEXT:  .LBB19_2: @ %entry
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: test7:
; THUMB2:       @ %bb.0: @ %entry
; THUMB2-NEXT:    ldrb r0, [r0]
; THUMB2-NEXT:    uxtb r2, r2
; THUMB2-NEXT:    ands r1, r0
; THUMB2-NEXT:    movs r0, #0
; THUMB2-NEXT:    cmp r1, r2
; THUMB2-NEXT:    it eq
; THUMB2-NEXT:    moveq r0, #1
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i16, i16* %x, align 4
  %1 = and i16 %0, %y
  %2 = trunc i16 %1 to i8
  %3 = icmp eq i8 %2, %z
  ret i1 %3
}

define arm_aapcscc void @test8(i32* nocapture %p) {
; ARM-LABEL: test8:
; ARM:       @ %bb.0: @ %entry
; ARM-NEXT:    ldrb r1, [r0]
; ARM-NEXT:    eor r1, r1, #255
; ARM-NEXT:    str r1, [r0]
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test8:
; ARMEB:       @ %bb.0: @ %entry
; ARMEB-NEXT:    ldrb r1, [r0, #3]
; ARMEB-NEXT:    eor r1, r1, #255
; ARMEB-NEXT:    str r1, [r0]
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test8:
; THUMB1:       @ %bb.0: @ %entry
; THUMB1-NEXT:    ldrb r1, [r0]
; THUMB1-NEXT:    movs r2, #255
; THUMB1-NEXT:    eors r2, r1
; THUMB1-NEXT:    str r2, [r0]
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: test8:
; THUMB2:       @ %bb.0: @ %entry
; THUMB2-NEXT:    ldrb r1, [r0]
; THUMB2-NEXT:    eor r1, r1, #255
; THUMB2-NEXT:    str r1, [r0]
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %p, align 4
  %neg = and i32 %0, 255
  %and = xor i32 %neg, 255
  store i32 %and, i32* %p, align 4
  ret void
}

define arm_aapcscc void @test9(i32* nocapture %p) {
; ARM-LABEL: test9:
; ARM:       @ %bb.0: @ %entry
; ARM-NEXT:    ldrb r1, [r0]
; ARM-NEXT:    eor r1, r1, #255
; ARM-NEXT:    str r1, [r0]
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test9:
; ARMEB:       @ %bb.0: @ %entry
; ARMEB-NEXT:    ldrb r1, [r0, #3]
; ARMEB-NEXT:    eor r1, r1, #255
; ARMEB-NEXT:    str r1, [r0]
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test9:
; THUMB1:       @ %bb.0: @ %entry
; THUMB1-NEXT:    ldrb r1, [r0]
; THUMB1-NEXT:    movs r2, #255
; THUMB1-NEXT:    eors r2, r1
; THUMB1-NEXT:    str r2, [r0]
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: test9:
; THUMB2:       @ %bb.0: @ %entry
; THUMB2-NEXT:    ldrb r1, [r0]
; THUMB2-NEXT:    eor r1, r1, #255
; THUMB2-NEXT:    str r1, [r0]
; THUMB2-NEXT:    bx lr
entry:
  %0 = load i32, i32* %p, align 4
  %neg = xor i32 %0, -1
  %and = and i32 %neg, 255
  store i32 %and, i32* %p, align 4
  ret void
}

; ARM-LABEL: test10:
; ARM:       @ %bb.0: @ %entry
; ARM-NEXT:    ldrb r1, [r0]
; ARM-NEXT:    eor r1, r1, #255
; ARM-NEXT:    str r1, [r0]
; ARM-NEXT:    bx lr
;
; ARMEB-LABEL: test10:
; ARMEB:       @ %bb.0: @ %entry
; ARMEB-NEXT:    ldrb r1, [r0, #3]
; ARMEB-NEXT:    eor r1, r1, #255
; ARMEB-NEXT:    str r1, [r0]
; ARMEB-NEXT:    bx lr
;
; THUMB1-LABEL: test10:
; THUMB1:       @ %bb.0: @ %entry
; THUMB1-NEXT:    ldrb r1, [r0]
; THUMB1-NEXT:    movs r2, #255
; THUMB1-NEXT:    eors r2, r1
; THUMB1-NEXT:    str r2, [r0]
; THUMB1-NEXT:    bx lr
;
; THUMB2-LABEL: test10:
; THUMB2:       @ %bb.0: @ %entry
; THUMB2-NEXT:    ldrb r1, [r0]
; THUMB2-NEXT:    eor r1, r1, #255
; THUMB2-NEXT:    str r1, [r0]
; THUMB2-NEXT:    bx lr
define arm_aapcscc void @test10(i32* nocapture %p) {
entry:
  %0 = load i32, i32* %p, align 4
  %neg = and i32 %0, 255
  %and = xor i32 %neg, 255
  store i32 %and, i32* %p, align 4
  ret void
}

