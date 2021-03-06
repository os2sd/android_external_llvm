; RUN: llc -march=xcore < %s | FileCheck %s

declare i8 addrspace(1)* @llvm.xcore.getst.p1i8.p1i8(i8 addrspace(1)* %r)
declare void @llvm.xcore.msync.p1i8(i8 addrspace(1)* %r)
declare void @llvm.xcore.ssync()
declare void @llvm.xcore.mjoin.p1i8(i8 addrspace(1)* %r)
declare void @llvm.xcore.initsp.p1i8(i8 addrspace(1)* %r, i8* %value)
declare void @llvm.xcore.initpc.p1i8(i8 addrspace(1)* %r, i8* %value)
declare void @llvm.xcore.initlr.p1i8(i8 addrspace(1)* %r, i8* %value)
declare void @llvm.xcore.initcp.p1i8(i8 addrspace(1)* %r, i8* %value)
declare void @llvm.xcore.initdp.p1i8(i8 addrspace(1)* %r, i8* %value)

define i8 addrspace(1)* @test_getst(i8 addrspace(1)* %r) {
; CHECK-LABEL: test_getst:
; CHECK: getst r0, res[r0]
        %result = call i8 addrspace(1)* @llvm.xcore.getst.p1i8.p1i8(i8 addrspace(1)* %r)
        ret i8 addrspace(1)* %result
}

define void @test_ssync() {
; CHECK-LABEL: test_ssync:
; CHECK: ssync
	call void @llvm.xcore.ssync()
	ret void
}

define void @test_mjoin(i8 addrspace(1)* %r) {
; CHECK-LABEL: test_mjoin:
; CHECK: mjoin res[r0]
	call void @llvm.xcore.mjoin.p1i8(i8 addrspace(1)* %r)
	ret void
}

define void @test_initsp(i8 addrspace(1)* %t, i8* %src) {
; CHECK-LABEL: test_initsp:
; CHECK: init t[r0]:sp, r1
        call void @llvm.xcore.initsp.p1i8(i8 addrspace(1)* %t, i8* %src)
        ret void
}

define void @test_initpc(i8 addrspace(1)* %t, i8* %src) {
; CHECK-LABEL: test_initpc:
; CHECK: init t[r0]:pc, r1
        call void @llvm.xcore.initpc.p1i8(i8 addrspace(1)* %t, i8* %src)
        ret void
}

define void @test_initlr(i8 addrspace(1)* %t, i8* %src) {
; CHECK-LABEL: test_initlr:
; CHECK: init t[r0]:lr, r1
        call void @llvm.xcore.initlr.p1i8(i8 addrspace(1)* %t, i8* %src)
        ret void
}

define void @test_initcp(i8 addrspace(1)* %t, i8* %src) {
; CHECK-LABEL: test_initcp:
; CHECK: init t[r0]:cp, r1
        call void @llvm.xcore.initcp.p1i8(i8 addrspace(1)* %t, i8* %src)
        ret void
}

define void @test_initdp(i8 addrspace(1)* %t, i8* %src) {
; CHECK-LABEL: test_initdp:
; CHECK: init t[r0]:dp, r1
        call void @llvm.xcore.initdp.p1i8(i8 addrspace(1)* %t, i8* %src)
        ret void
}
