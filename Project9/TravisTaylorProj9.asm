; Project 9: This is a string find procedure that takes two inputs then finds the source location from the target
; Author: Travis Taylor
; May 2, 2022

include irvine32.inc
Str_find PROTO, pSource:PTR BYTE, pTarget:PTR BYTE

.data

target BYTE 128 DUP (?), 0
source BYTE 128 DUP (?), 0
tChars DWORD 127
positionCount DWORD 0

msg1 BYTE "Enter source string (the string to search for): ", 0
msg2 BYTE "Enter target string (the string to search from): ", 0
msg3 BYTE "Source source found at position ", 0
msg4 BYTE " in Target string (counting from zero).", 0  
msg5 BYTE "Do you want to do another search? y/n: ", 0
msg6 BYTE "The string has not been found", 0 


stopPosition DWORD 0
targetLength DWORD 0
sourceLength DWORD 0


.code
main PROC
start:
	call Crlf
	call userInputs																	; calls for user inputs
	INVOKE Str_find, ADDR target, ADDR source										
	mov positionCount, eax															; store the position value		
	jnz notFound																	; ZF = 0
	mov edx, OFFSET msg3															; source found msg
	call WriteString
	mov eax, positionCount															; store the position value
	call WriteDec																	; prints the numeric location
	mov edx, OFFSET msg4															
	call WriteString
	call Crlf	
	jmp ask																			; jump to ask user to continue or exit
notFound:																		
	mov edx, OFFSET msg6															; source not found 
	call WriteString
	call Crlf
	jmp ask																			; jump to ask user to continue or exit
ask:																				; Loop that asks user to continue or endin lowercase or uppercase
	mov edx, OFFSET msg5															
	call WriteString																; ask user to continue
	call ReadChar																	; gets user input
	call WriteChar
	cmp al, 'y'																		; compares input to lower and upper case 'y' and 'n', jumping to selected answer
	je start
	cmp al, 'Y'
	je start
	cmp al, 'n'
	je finish
	cmp al, 'N'
	je finish
finish:
	exit
main ENDP

Str_find PROC,
	pTarget:PTR BYTE,																; pointer to target
	pSource:PTR BYTE																; pointer to source
	INVOKE Str_length, pTarget														; get string length of target
	mov targetLength, eax
	INVOKE Str_length, pSource														; get string length of source
	mov sourceLength, eax
	mov edi, OFFSET target															; points to the target and to the source
	mov esi, OFFSET source
	mov eax, edi																	; uses the target for stop
	add eax, targetLength															; adds length of the target
	sub eax, sourceLength															; adds length of the source
	inc eax
	mov stopPosition, eax															; stop position 
	cld																				; compare source to new target
	mov ecx, sourceLength															; uses length of source for ecx

L1:
	pushad
	repe cmpsb																		; compares all the bytes
	popad
	je charFound																	; jumps to loop if char is found			
	inc edi																			; continues to next postion in target
	cmp edi, stopPosition															; sees if 
	jae charNotFound																; jumps to loop if char is not found
	jmp L1

charNotFound:
	or eax, 1																		; check the ZF to see if it equals 1
	jmp return																		; done loop to return

charFound:
	mov eax, edi																	
	sub eax, pTarget																; finds position of target
	cmp eax, eax																	; checks to see if ZF equals 1, then returns

return:
	ret

Str_find ENDP

userInputs PROC uses ecx
    mov ecx, tChars																	

    mov  edx, OFFSET msg1															; ask for source
    call WriteString
    mov edx, OFFSET source															; location for source
    call Readstring																	; get source

    mov  edx, OFFSET msg2															; ask for target
    call WriteString
    mov edx, OFFSET target															; location for target
    call Readstring																	; get target
	call Crlf

    ret

userInputs ENDP
END main

comment !
; Project 9: This is a string find procedure that takes two inputs then finds the source location from the target
; Author: Travis Taylor
; May 2, 2022

Enter source string (the string to search for): AABA
Enter target string (the string to search from): 0123ABAAABAAAABA789

Source source found at position 7 in Target string (counting from zero).
Do you want to do another search? y/n: y
Enter source string (the string to search for): AAABA
Enter target string (the string to search from): 0123ABAAABAAAABA789

Source source found at position 6 in Target string (counting from zero).
Do you want to do another search? y/n: N
C:\irvine\examples\Project32_VS2017\Debug\Project.exe (process 18520) exited with code 0.
To automatically close the console when debugging stops, enable Tools->Options->Debugging->Automatically close the console when debugging stops.
Press any key to close this window . . .

!