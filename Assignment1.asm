TITLE Program Template     (template.asm)

; Author: Caroline Springer
; Course / Project ID: Programming Assignment 1                  Date: 01/17/2016
; Description: User enters two integers and the program gives their sum, difference, quotient, and remainder.

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
numberOne		DWORD	?	;integer entered by user
numberTwo		DWORD	?	;integer entered by user
intro		BYTE		"Basic Calculations      By: Caroline Springer ", 0
rules		BYTE		"Enter two numbers and I will calculate their sum, difference, product, quotient, and remainder. ", 0
prompt_1		BYTE		"First Number: ", 0
prompt_2		BYTE		"Second Number: ", 0
numberAdd		DWORD	?
numberSub		DWORD	?
numberMul		DWORD	?
numberDiv		DWORD	?
numberRem		DWORD	?
sum			BYTE		"Sum: ", 0
difference	BYTE		"Difference: ", 0
product		BYTE		"Product: ", 0
quotient		BYTE		"Quotient: ", 0
remainder		BYTE		"Remainder: ", 0
goodBye		BYTE		"Thanks for playing! Goodbye."


.code
main PROC

; display programmer and program name
	mov		edx, OFFSET intro
	call		WriteString
	call		CrLf

; display instructions for user
	mov		edx, OFFSET rules
	call		WriteString
	call		CrLf

; prompt user to enter two numbers
	mov		edx, OFFSET prompt_1
	call		WriteString
	call		ReadInt
	mov		numberOne, eax
	mov		edx, OFFSET prompt_2
	call		WriteString
	call		ReadInt
	mov		numberTwo, eax

; calculate sum
	mov		eax, numberOne
	add		eax, numberTwo
	mov		numberAdd, eax

; calculate difference
	mov		eax, numberOne
	sub		eax, numberTwo
	mov		numberSub, eax

; calculate product
	mov		eax, numberOne
	mov		ebx, numberTwo
	mul		ebx
	mov		numberMul, eax

; calculate quotient and remainder
	mov		eax, numberOne
	mov		ebx, numberTwo
	xor		edx, edx
	div		ebx
	mov		numberDiv, eax
	mov		numberRem, edx
	

; display solutions
	mov		edx, OFFSET sum
	call		WriteString
	mov		eax, numberAdd
	call		WriteDec
	call		CrLf
	mov		edx, OFFSET difference
	call		WriteString
	mov		eax, numberSub
	call		WriteDec
	call		CrLf
	mov		edx, OFFSET product
	call		WriteString
	mov		eax, numberMul
	call		WriteDec
	call		CrLf
	mov		edx, OFFSET quotient
	call		WriteString
	mov		eax, numberDiv
	call		WriteDec
	call		CrLf
	mov		edx, OFFSET remainder
	call		WriteString
	mov		eax, numberRem
	call		WriteDec
	call		CrLf

; display terminating message
	mov		edx, OFFSET goodBye
	call		WriteString
	call		CrLf

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
