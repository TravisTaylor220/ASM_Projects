;Project 8: GCD For loop checking for absolute values and Recursive loop
;Author: Travis Taylor
;April 24, 2022

include irvine32.inc

.data 
msg1 BYTE "Greatest Common divisor of (5, 20) calculated by loop is: ", 0
msg2 BYTE "Greatest Common divisor of (24, 18) calculated by loop is: ", 0
msg3 BYTE "Greatest Common divisor of (11, 7) calculated by loop is: ", 0
msg4 BYTE "Greatest Common divisor of (438, 226) calculated by loop is: ", 0
msg5 BYTE "Greatest Common divisor of (26, 13) calculated by loop is: ", 0
msg6 BYTE "calculated by recursion is: ", 0


.code
main PROC
	push 5									; Pair 1
	push 20
	call GCD								; calls GCD function
	mov edx, OFFSET msg1
	call WriteString
	call WriteDec							; print GCD value
	call Crlf

	push 5									; Recursive Pair 1
	push 20
	call RecursiveGCD						; calls RecursiveGCD function
	mov edx, OFFSET msg6
	call WriteString
	call WriteDec							; print Recursive GCD value	
	call Crlf

	push 24									; Pair 2
	push 18 
	call GCD								; calls GCD function
	mov edx, OFFSET msg2					
	call WriteString
	call WriteDec							; print GCD value					
	call Crlf

	push 24									; Recursive Pair 2
	push 18
	call RecursiveGCD						; calls RecursiveGCD function
	mov edx, OFFSET msg6
	call WriteString
	call WriteDec							; print Recursive GCD value
	call Crlf

	push 11									; Pair 3
	push 7
	call GCD								; calls GCD function
	mov edx, OFFSET msg3
	call WriteString
	call WriteDec							; print GCD value					
	call Crlf

	push 11									; Recursive Pair 3
	push 7
	call RecursiveGCD						; calls RecursiveGCD function
	mov edx, OFFSET msg6
	call WriteString
	call WriteDec							; print Recursive GCD value		
	call Crlf

	push 438								; Pair 4
	push 226
	call GCD								; calls GCD function
	mov edx, OFFSET msg4
	call WriteString
	call WriteDec							; print GCD value					
	call Crlf

	push 438								; Recursive Pair 4
	push 226
	call RecursiveGCD						; calls RecursiveGCD function
	mov edx, OFFSET msg6
	call WriteString
	call WriteDec							; print Recursive GCD value		
	call Crlf

	push 26									; Pair 5
	push 13
	call GCD								; calls GCD function
	mov edx, OFFSET msg5
	call WriteString
	call WriteDec							; print GCD value					
	call Crlf

	push 26									; Recursive Pair 5
	push 13
	call RecursiveGCD						; calls RecursiveGCD function
	mov edx, OFFSET msg6
	call WriteString
	call WriteDec							; print Recursive GCD value		
	call Crlf

	exit
main ENDP


GCD PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp+12]						; gets x value
	mov ebx, [ebp+8]						; gets y value
	cmp ebx, 0								; checks if y > 0
	je ReturnGCD							; if y = 0, jump and return x
	jl NegativeEBX							; if y < 0, jump to NegativeEBX to make positive
	CheckEAX:								; loop to check if x < 0
		cmp eax, 0
		jl NegativeEAX						; x < 0, jump to NegativeEAX to make positive
	FindGCD:								; loop to find GCD
		mov edx, 0							; sets remainder to 0
		div ebx								; divides x / y and sets remainder to edx
		mov eax, edx						; moves remainder into eax
		push ebx							; ebx value new x
		push eax							; eax is remainder value
		call GCD							; calls loop again
	ReturnGCD:								; GCD is found, returned
		pop ebp
		ret 8
	NegativeEBX:							; if ebx is negative, makes positive
		neg ebx
		jmp CheckEAX
	NegativeEAX:							; if eax is negative, makes positive
		neg eax
		jmp FindGCD
GCD ENDP

RecursiveGCD PROC
		push ebp
		mov ebp, esp
		mov eax, [ebp+12]					; gets x value
		mov ebx, [ebp+8]					; gets y value
		cmp ebx, 0							; checks to see if y = 0, if yes, finish and return
		je ReturnGCD
		mov edx, 0							; sets remainder to 0
		div ebx								; divides x % y and returns remainder in edx
		mov eax, edx						; moves remainder into eax
		push ebx							; ebx value new x
		push eax							; eax is remainder value
		call RecursiveGCD
	ReturnGCD:								; returns GCD value 
		pop ebp
		ret 8
RecursiveGCD ENDP
END main

; Output for calculating GCD 
comment !

Greatest Common divisor of (5, 20) calculated by loop is: 5
calculated by recursion is: 5
Greatest Common divisor of (24, 18) calculated by loop is: 6
calculated by recursion is: 6
Greatest Common divisor of (11, 7) calculated by loop is: 1
calculated by recursion is: 1
Greatest Common divisor of (438, 226) calculated by loop is: 2
calculated by recursion is: 2
Greatest Common divisor of (26, 13) calculated by loop is: 13
calculated by recursion is: 13

C:\irvine\examples\Project32_VS2019\Debug\Project.exe (process 17116) exited with code 0.
To automatically close the console when debugging stops, enable Tools->Options->Debugging->Automatically close the console when debugging stops.
Press any key to close this window . . .
!