@echo off

if exist list.txt del list.txt

setlocal EnableDelayedExpansion

set /A offset_x = 6063
set /A offset_y = -10509

set /A offset_x2 = 6102
set /A offset_y2 = -10469

set /A number_y = !offset_y!
rem -11789

:X_IS_0

set /A number_x = !offset_x!
rem -16699

:NEXT_X

set /A number_y_move = !number_y! - !offset_y!
rem 11789
set /A number_x_move = !number_x! - !offset_x!
rem 16699

set filename=r.!number_x!.!number_y!.png
set filename_move=r.!number_x_move!.!number_y_move!.png

echo !filename! -- !filename_move! >> list.txt

set /a number_x = !number_x! + 1

if !number_x! GTR !offset_x2! (
	set /a number_y = !number_y! + 1
	if !number_y! equ !offset_y2! goto END
	goto X_IS_0
)

goto NEXT_X

:END

TIMEOUT 5