.386
.model flat,stdcall
option casemap:none

include     \masm32\include\windows.inc
include     \masm32\include\kernel32.inc
include     \masm32\include\msvcrt.inc

includelib  \masm32\lib\kernel32.lib
includelib  \masm32\lib\msvcrt.lib

.data

msg         db 'Press any key and hit RETURN',13,10,0
msg2        db 'You pressed %c before hitting RETURN',13,10,0

.code

start:

    invoke  crt_printf,ADDR msg

    invoke  crt_getchar

    invoke  crt_printf,ADDR msg2,eax

    invoke  ExitProcess,0

END start
