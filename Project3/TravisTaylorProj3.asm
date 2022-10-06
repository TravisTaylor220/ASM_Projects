; CSCI321_VA Project 3 write 4 simple MASM codes. Number them according to their reference in the word document. 
; Commented register output at bottom of file. 
; Author: Travis Taylor
; Date: February 16, 2022

.386
.model flat, stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; Question 2
.data 
SUN = 0
MON = 1
TUES = 2
WED = 3
THURS = 4
FRI = 5
SAT = 6
daysOfWeek BYTE SUN,MON,TUES,WED,THURS,FRI,SAT

; Question 3
.data
b BYTE 10
sb SBYTE -128
w WORD 65535
sw SWORD -32768
dwd DWORD 12345678h
sdd SDWORD -2147483648
fd FWORD 123456781234
qd QWORD 1234567812345678
tb TBYTE 80000000000000001234
r4 REAL4 -1.2
r8 REAL8 3.2E-260
r10 REAL10 4.6E+4096

; Question 4
.data
msg1 TEXTEQU <"How was your day?">
msg2 TEXTEQU <"Its night time.">
msg3 TEXTEQU <"Good Morning!">
.data
prompt1 BYTE msg1
prompt2 BYTE msg2
prompt3 BYTE msg3

; Question 1
.code
main proc
	mov	eax,5
	mov	ebx,4	
	add	eax,ebx
	mov ecx,3
	mov edx,2
	add ecx,edx
	sub eax,ecx

	
	invoke ExitProcess,0
main endp
end main


;Output after code has completed A=(A+B)-(C+D) ---- Inputs: A=5 B=4 C=3 D=2.
;
;EAX = 00000004 EBX = 00000004 ECX = 00000005 EDX = 00000002 ESI = 00401005 EDI = 00401005 EIP = 0040102A ESP = 0019FF74 EBP = 0019FF80 EFL = 00000202 