;Project 5: This project will generate a random lettered string of length L and output it 20 times
;Author: Travis Taylor
;March 11, 2022

INCLUDE Irvine32.inc

.data
L = 8
source BYTE "ABCDEFGHIJKLMNOPQRSTUVWXYZ", 0
strArr BYTE L DUP(?), 0
prompt BYTE "Press any key to continue...", 0

.code
main PROC

mov eax, L						;moves length of L to eax
mov esi, OFFSET strArr			;offset of strArr
mov ecx, 20						;loop counter set to 20

L1:								;loop to display the strings of 10 random letters
push ecx						;pushes loop counter onto a stack
call RandStr					;calls RandStr proceedure
mov edx, esi					;moves esi array to edx to be represented as a string
call WriteString				;writes string from esi
call Crlf						;prints new line
pop ecx							;pops loop counter off stack until 20
Loop L1							;loop back to L1

mov edx, OFFSET prompt			;shows prompt message
Call WriteString				;writes string
Call ReadChar					;reads each character
exit
main ENDP

RandStr PROC USES eax esi       ;ecx used for push/pop
mov ecx, eax					;moves 10 to ecx for 10 letters

L2:
mov eax, sizeof source - 1		;generates random index from range 0 to 25
call RandomRange				;randomly generates index
add al, 65						;adds 65 to index to create capital letter from 'A'-'Z'
mov [esi], al					;gets eax index value from random number generated
inc esi							;increment by 1
loop L2                         ;loop back to L2

ret                             
RandStr ENDP					;end RandStr process
END main

COMMENT !

USZNJESO
FQUPWYLF
DGEFXVQU
GKFEWDLN
JDTQKKEK
MEUPDGZZ
OHCFOEOZ
FZPMHIDB
DXDOBHUJ
FHAPTDFR
DEKJXMAV
UHREMMBS
QOTBUMMZ
IIOEEKSA
QKEQKHQV
BYRPVTIO
TTTJCMEE
EICUPAEE
FLWSZYSK
MCZRSSIK
Press any key to continue...

!