;Project 6: This is a boolean calculator that accepts 2 32 bit hexadecimal operands and prints the result of the AND/OR/NOT/XOR function
;Author: Travis Taylor
;March 28, 2022

include irvine32.inc

.data 
	msgMenu BYTE "----Boolean Calculator----", 0dh, 0ah					; creates menu
	BYTE 0dh, 0ah
	BYTE "1. X AND Y", 0dh, 0ah
	BYTE "2. X OR Y", 0dh, 0ah
	BYTE "3. NOT X", 0dh, 0ah
	BYTE "4. X XOR Y", 0dh, 0ah
	BYTE "5. Exit Program", 0dh, 0ah
	BYTE 0dh, 0ah
	BYTE "Enter Integer: ", 0
	BYTE 0dh, 0ah

	msgAND BYTE "Boolean AND", 0										; creates messages
	msgOR BYTE "Boolean OR", 0
	msgNOT BYTE "Boolean NOT", 0
	msgXOR BYTE "Boolean XOR", 0

	msgOperand1 BYTE "Input the first 32-bit hexadecimal operand: ", 0	
	msgOperand2 BYTE "Input the second 32-bit hexadecimal operand: ", 0
	msgResult BYTE "The 32-bit hexadecimal result is:		", 0
	msgError BYTE "No such option. Please choose from 1 -- 5: ", 0

	CaseTable BYTE '1'													; creates case table
	DWORD AND_op
	EntrySize = ($ - caseTable)
	BYTE '2'
	DWORD OR_op
	BYTE '3'
	DWORD NOT_op
	BYTE '4'
	DWORD XOR_op
	NumberOfEntries = ($ - caseTable) / EntrySize

.code

main PROC
Display_Menu:
	mov edx, OFFSET msgMenu												; display menu
	call WriteString	

Get_Choice:
	call ReadChar														; get user's choice and display
	call WriteChar	
	call Crlf
	mov ebx, OFFSET CaseTable
	mov ecx, NumberOfEntries

Loop_CaseTable:															; loop through casetable, 
	cmp al, [ebx]														; compare choice with case
	jne Not_Match
	call Near PTR [ebx+1]												; if there is a match (1-4), call function
	call Crlf
	call Crlf
	jmp Display_menu
Not_Match:																; if not match, increase ebx appropiately and loop back to Loop_CaseTable
	add ebx, EntrySize
	loop Loop_CaseTable

	cmp al, '5'
	je Exit_Program														; if the choice is '5', jump to exitProgram
	mov edx, OFFSET msgError											; display wrong choice message and jump back to reget user's choice
	call WriteString
	jmp Get_Choice
Exit_Program:
	exit
main ENDP

AND_op PROC
	pushad																; preserve all registers
	call Crlf															; print new line
	mov edx, OFFSET msgAnd												; ask user to input first operand, and get input
	call WriteString	
	call Crlf
	call Crlf
	mov edx, OFFSET msgOperand1
	call WriteString
	call ReadHex
	mov ebx, eax														; store first operand in ebx
	mov edx, OFFSET msgOperand2											; ask user to input the second operand, and get input
	call WriteString
	call ReadHex														; second operand in eax

	and eax, ebx														; do and operation, result in eax

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf
	popad
	ret
AND_op ENDP

OR_op PROC
	pushad																; preserve all registers
	call Crlf															; print new line
	mov edx, OFFSET msgOr												; ask user to input first operand, and get input
	call WriteString
	call Crlf
	call Crlf
	mov edx, OFFSET msgOperand1
	call WriteString
	call ReadHex
	mov ebx, eax														; store first operand in ebx
	mov edx, OFFSET msgOperand2											; ask user to input the second operand, and get input
	call WriteString
	call ReadHex														; second operand in eax

	or eax, ebx															; do and operation, result in eax

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf
	popad
	ret
OR_op ENDP

NOT_op PROC
	pushad																; preserve all registers
	call Crlf															; print new line
	mov edx, OFFSET msgNot												; ask user to input first operand, and get input
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgOperand1											; ask for 32 bit integer
	call WriteString
	call ReadHex

	not eax																; do and operation, result in eax

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret
NOT_op ENDP

XOR_op PROC
	pushad																; preserve all registers
	call Crlf															; print new line
	mov edx, OFFSET msgXor												; ask user to input first operand, and get input
	call WriteString
	call Crlf
	call Crlf

	mov edx, OFFSET msgOperand1											; ask for 32 bit integer
	call WriteString
	call ReadHex
	mov ebx, eax														; store first operand in ebx

	mov edx, OFFSET msgOperand2											; ask user to input the second operand, and get input
	call WriteString
	call ReadHex														; second operand in eax

	xor eax, ebx														; do and operation, result in eax

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	popad
	ret
XOR_op ENDP

END main



; Output for boolean calculator at each case including exit

comment !
----Boolean Calculator----

1. X AND Y
2. X OR Y
3. NOT X
4. X XOR Y
5. Exit Program

Enter Integer: 1

Boolean AND

Input the first 32-bit hexadecimal operand: 11112222
Input the second 32-bit hexadecimal operand: 12345678
The 32-bit hexadecimal result is:               10100220


----Boolean Calculator----

1. X AND Y
2. X OR Y
3. NOT X
4. X XOR Y
5. Exit Program

Enter Integer: 2

Boolean OR

Input the first 32-bit hexadecimal operand: 12345678
Input the second 32-bit hexadecimal operand: 11112222
The 32-bit hexadecimal result is:               1335767A


----Boolean Calculator----

1. X AND Y
2. X OR Y
3. NOT X
4. X XOR Y
5. Exit Program

Enter Integer: 3

Boolean NOT

Input the first 32-bit hexadecimal operand: 12345678
The 32-bit hexadecimal result is:               EDCBA987


----Boolean Calculator----

1. X AND Y
2. X OR Y
3. NOT X
4. X XOR Y
5. Exit Program

Enter Integer: 4

Boolean XOR

Input the first 32-bit hexadecimal operand: 12345678
Input the second 32-bit hexadecimal operand: 11112222
The 32-bit hexadecimal result is:               0325745A


----Boolean Calculator----

1. X AND Y
2. X OR Y
3. NOT X
4. X XOR Y
5. Exit Program

Enter Integer: 5

C:\irvine\examples\Project32_VS2017\Debug\Project.exe (process 22492) exited with code 0.
To automatically close the console when debugging stops, enable Tools->Options->Debugging->Automatically close the console when debugging stops.
Press any key to close this window . . .
!