

;Deniz Burak


INCLUDE Irvine32.inc
.data
	;--------- Enter Data Here
	vSemester BYTE "String Number One",0
	vAssignment BYTE "String Number Two",0
	vName BYTE "Deniz Burak",0
	vOutPut BYTE "Please enter your number in hexa:",0
	vTimeFieled BYTE "--:--:--",0

.code
main PROC
	;--------- Enter Code Below Here
	
	call clrscr

	mov dh, 7
	mov dl, 0
	call gotoxy

	mov edx, offset vSem
	call WriteString

	mov dh, 8
	mov dl, 0
	call gotoxy

	mov edx, offset vOdev
	call WriteString

	mov dh, 9
	mov dl, 0
	call gotoxy

	mov edx, offset vName
	call WriteString

	mov dh,11
	mov dl, 0
	call gotoxy

	mov edx, offset vOutPut
	call writeString

	call  ReadHex
	ror ax, 8
	
	mov cx, ax

	and ax, 1111100000000000b
	shr ax, 11
	mov bl, 10
	div bl

	add ax, 3030h
	mov word ptr [vTimeFieled+0], ax
	mov ax, cx 

	and ax, 0000011111100000b
	shr ax, 5
	mov bl, 10

	div bl

	add ax, 3030h
	mov word ptr [vTimeFieled+3], ax
	mov ax, cx

	and ax, 0000000000011111b
	SHL ax, 1
	mov bl, 10

	div bl

	add ax, 3030h
	mov word ptr [vTimeFieled+6], ax
	mov ax, cx
	
	mov edx, offset vTimeFieled
	call writeString 

	xor ecx, ecx
	call readchar

	exit

main ENDP
END main
