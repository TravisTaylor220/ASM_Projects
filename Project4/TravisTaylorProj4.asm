;Project 4: This project will take a string and reverse it. Then a null character will be added to end to have same string
;Author: Travis Taylor
;March 4, 2022

include irvine32.inc

comment !
.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword
!

.data
source BYTE "This is the string that will be reversed", 0	;creates source variable
target BYTE SIZEOF source DUP('#')							;creates target variable with # at end

.code
main PROC
mov ESI, OFFSET target - 2									;move address of the last char in source into ESI
mov EDI, OFFSET target										;move address of the first char in target into EDI
mov ECX, SIZEOF source - 1									;move the loop number into ECX

L1:
mov AL, [ESI]												;move char at address ESI to AL
mov [EDI], AL												;move AL to memory with address EDI
dec ESI														;decrease ESI
inc EDI														;increase EDI
Loop L1														;Loop to L1	
mov BYTE PTR [EDI], 0										;puts null character at end of string, removing #

invoke ExitProcess, 0
main ENDP
END main													


;Below is the output from the memory addresses with the normal and the reversed string 
;Reversed string starts at 0x00404029
;
comment !
0x00403FF5  00 00 00 00 00 00 00 00 00 00 00 54 68  ...........Th
0x00404002  69 73 20 69 73 20 74 68 65 20 73 74 72  is is the str
0x0040400F  69 6e 67 20 74 68 61 74 20 77 69 6c 6c  ing that will
0x0040401C  20 62 65 20 72 65 76 65 72 73 65 64 00   be reversed.
0x00404029  64 65 73 72 65 76 65 72 20 65 62 20 6c  desrever eb l
0x00404036  6c 69 77 20 74 61 68 74 20 67 6e 69 72  liw taht gnir
0x00404043  74 73 20 65 68 74 20 73 69 20 73 69 68  ts eht si sih
0x00404050  54 00 00 00 00 00 00 00 00 00 00 00 00  T............
!