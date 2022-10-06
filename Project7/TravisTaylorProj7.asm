; Project 7: Bitwise calculator that takes two integer inputs and multiplies both integers by adding their bits together, returns the integer value as multiplication product and prints it to console
; Author: Travis Taylor
; April 13, 2022

include irvine32.inc

.data 
choice BYTE ?
msg1 BYTE "Enter the multiplicand: ", 0
msg2 BYTE "Enter the multiplier: ", 0
msg3 BYTE "The product is: ", 0
msg4 BYTE "Do you want to do another calculation? y/n (lower case): ", 0
msg5 BYTE "Welcome to bitwise calculator", 0

.code
main PROC

L1:
	call Crlf
	mov edx, offset msg5						; shows title message
	call WriteString
	call Crlf

	call Crlf

	mov edx, offset msg1						; get multiplicand from user
	call WriteString
	call ReadInt
	mov ebx, eax								; multiplicand is stored in ebx

	mov edx, offset msg2						; get multiplier from user
	call WriteString
	call ReadInt

	call Crlf

	call BitWiseMultiply                        ; call BitWiseMultiply function
	mov edx, offset msg3						; show result from multiplication
	call WriteString
	call WriteDec

	call Crlf

	mov edx, offset msg4						; get response from user about running calculator again
	call WriteString
	call ReadChar
	call WriteChar

	call Crlf

	cmp al, 'y'									; lowercase input for yes
	je L1										; jump to L1, run again
	cmp al, 'Y'									; uppercase input for yes
	je L1										; jump to L1, run again

	call WaitMsg								; press any key
	exit 
main ENDP

BitWiseMultiply PROC
	push edx
	push ebx
	push ecx

	mov edx, eax								; edx holds the multiplicand
	mov ecx, 16
	mov eax, 0									; start from 0
L2:
	test ebx, 00000001h							; if the last bit in ebx is 1, add edx to eax
	jz Zero										; else, jump to Zero loop
	add eax, edx								
Zero:
	shl edx, 1									; shift multiplicand left 1 bit
	shr ebx, 1									; shift multiplier right 1 bit
	loop L2

	pop ecx
	pop ebx
	pop edx
	ret
BitWiseMultiply ENDP
END main

; Output for bitwise calculator
comment !


Welcome to bitwise calculator

Enter the multiplicand: 1234
Enter the multiplier: 5678

The product is: 7006652
Do you want to do another calculation? y/n (lower case): y

Welcome to bitwise calculator

Enter the multiplicand: 4321
Enter the multiplier: 8765

The product is: 37873565
Do you want to do another calculation? y/n (lower case): n
Press any key to continue...
C:\irvine\examples\Project32_VS2017\Debug\Project.exe (process 18948) exited with code 0.
!