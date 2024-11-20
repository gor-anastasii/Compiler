.586
.model flat, stdcall
includelib libucrt.lib
includelib kernel32.lib
includelib ../Debug/StaticLib.lib
ExitProcess PROTO :DWORD

MathPow PROTO :DWORD, :DWORD
MathRand PROTO :DWORD, :DWORD
OutputStr PROTO :DWORD
OutputStrNoLine PROTO :DWORD
OutputInt PROTO :DWORD
OutputIntNoLine PROTO :DWORD

.stack 4096

.CONST
	overflownum BYTE "Выход за пределы значения", 0
	neguint BYTE "Отрицательное число", 0
	L1 DWORD 3
	L2 BYTE "true", 0
	L3 DWORD 0
	L4 DWORD 1
	L5 DWORD 21
	L6 DWORD 4
	L7 BYTE "numa: ", 0
	L8 DWORD 177
	L9 DWORD 346
	L10 BYTE "numb: ", 0
	L11 DWORD 15
	L12 DWORD 2
	L13 DWORD 22136
	L14 DWORD 13
	L15 BYTE "hello world!", 0
	L16 DWORD 10

.data
	count DWORD 0
	main_numa DWORD 0
	main_numb DWORD 0
	main_res DWORD 0
	main_i DWORD 0
	main_y DWORD 0
	main_text DWORD ?
	main_p DWORD 0

.code

change PROC change_a : DWORD, change_b : DWORD
	push change_a
	push L1
	pop ecx
CYCLE0:
	pop eax
	shl eax, 1
	cmp eax, 4294967295
ja OVERFLOW
	cmp eax, 0
jl NEGNUM
	push eax
	loop CYCLE0
	push change_b
	pop eax
	pop ebx
	add eax, ebx
	cmp eax, 4294967295
ja OVERFLOW
	cmp eax, 0
jl NEGNUM
	push eax
	pop change_a
	push change_a
	jmp local0
local0:
	pop eax
	ret
OutAsm:
	push 0
	call ExitProcess
OVERFLOW:
	push offset overflownum
	call OutputStr
	push 0
	call ExitProcess
NEGNUM:
	push offset neguint
	call OutputStr
	push 0
	call ExitProcess
change ENDP

checknums PROC checknums_x : DWORD, checknums_y : DWORD
	mov eax, checknums_x
	cmp eax, checknums_y
	je m0
	jne m1
	je m1
m0:
	push offset L2
	call OutputStr
m1:
	push L3
	jmp local1
local1:
	pop eax
	ret
OutAsm:
	push 0
	call ExitProcess
OVERFLOW:
	push offset overflownum
	call OutputStr
	push 0
	call ExitProcess
NEGNUM:
	push offset neguint
	call OutputStr
	push 0
	call ExitProcess
checknums ENDP

k PROC k_o : DWORD
	push k_o
	push L4
	pop ecx
CYCLE1:
	pop eax
	shr eax, 1
	cmp eax, 4294967295
ja OVERFLOW
	cmp eax, 0
jl NEGNUM
	push eax
	loop CYCLE1
	pop k_o
	push k_o
	jmp local2
local2:
	pop eax
	ret
OutAsm:
	push 0
	call ExitProcess
OVERFLOW:
	push offset overflownum
	call OutputStr
	push 0
	call ExitProcess
NEGNUM:
	push offset neguint
	call OutputStr
	push 0
	call ExitProcess
k ENDP

main PROC
	push L5
	push L6
	pop edx
	pop edx
	push L6
	push L5
	call MathPow
	push eax
	pop main_numa
	push offset L7
	call OutputStrNoLine
	push main_numa
	call OutputInt
	push L8
	push L9
	pop edx
	pop edx
	push L9
	push L8
	call MathRand
	push eax
	pop main_numb
	push offset L10
	call OutputStrNoLine
	push main_numb
	call OutputInt
	push main_numa
	push main_numb
	pop edx
	pop edx
	push main_numb
	push main_numa
	call checknums
	push eax
	pop main_res
	push main_res
	call OutputInt
	push L11
	pop main_i
	push main_i
	push L12
	pop ecx
CYCLE2:
	pop eax
	shr eax, 1
	cmp eax, 4294967295
ja OVERFLOW
	cmp eax, 0
jl NEGNUM
	push eax
	loop CYCLE2
	push L13
	push L14
	pop edx
	pop edx
	push L14
	push L13
	call change
	push eax
	pop eax
	pop ebx
	add eax, ebx
	cmp eax, 4294967295
ja OVERFLOW
	cmp eax, 0
jl NEGNUM
	push eax
	push main_numb
	pop ebx
	pop eax
	sub eax, ebx
	push eax
	cmp eax, 4294967295
ja OVERFLOW
	cmp eax, 0
jl NEGNUM
	pop main_y
	push main_y
	call OutputInt
	push offset L15
	pop main_text
	push main_text
	call OutputStrNoLine
	push L16
	pop edx
	push L16
	call k
	push eax
	pop main_p
	push main_p
	call OutputInt
OutAsm:
	push 0
	call ExitProcess
OVERFLOW:
	push offset overflownum
	call OutputStr
	push 0
	call ExitProcess
NEGNUM:
	push offset neguint
	call OutputStr
	push 0
	call ExitProcess
main ENDP
end main