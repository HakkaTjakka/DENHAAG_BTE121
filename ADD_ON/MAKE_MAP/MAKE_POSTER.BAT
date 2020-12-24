@ECHO OFF
REM setlocal EnableDelayedExpansion

set "outputdir=map" >NUL 2>NUL
set "outputdir_downsized=map_downsized" >NUL 2>NUL
set "outputdir_result=map_result" >NUL 2>NUL

echo outputdir=%outputdir%
echo outputdir_downsized=%outputdir_downsized%
echo outputdir_result=%outputdir_result%

mkdir %outputdir% >NUL 2>NUL
mkdir %outputdir_downsized% >NUL 2>NUL
mkdir %outputdir_result% >NUL 2>NUL

rem split into 10x10 dirs 
CALL :ONEROW 0
CALL :ONEROW 1
CALL :ONEROW 2
CALL :ONEROW 3
REM CALL :ONEROW 4
REM CALL :ONEROW 5
rem CALL :ONEROW 6
rem CALL :ONEROW 7
rem CALL :ONEROW 8
rem CALL :ONEROW 9
rem CALL :ONEROW 10
rem CALL :ONEROW 11
rem CALL :ONEROW 12
rem CALL :ONEROW 13
rem CALL :ONEROW 14
rem CALL :ONEROW 15

"C:\Program Files\IrfanView\i_view64.exe" /panorama=(2,%outputdir_result%\row_small.*.jpg) /convert=%outputdir_result%\clipboard_small.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(2,%outputdir_result%\row.*.jpg) /convert=%outputdir_result%\clipboard.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(2,%outputdir_result%\row_HIRES.*.jpg) /convert=%outputdir_result%\clipboard_HIRES.jpg

exit /b

:ONEROW

SET row=%1
SET row2=%1
IF %row2% == 0 SET row2=

echo row %row%

mkdir %row%  >NUL 2>NUL
move r.*.%row2%0.png %row% >NUL 2>NUL
move r.*.%row2%1.png %row% >NUL 2>NUL
move r.*.%row2%2.png %row% >NUL 2>NUL
move r.*.%row2%3.png %row% >NUL 2>NUL
move r.*.%row2%4.png %row% >NUL 2>NUL
move r.*.%row2%5.png %row% >NUL 2>NUL
move r.*.%row2%6.png %row% >NUL 2>NUL
move r.*.%row2%7.png %row% >NUL 2>NUL
move r.*.%row2%8.png %row% >NUL 2>NUL
move r.*.%row2%9.png %row% >NUL 2>NUL

CALL :ONECOLUMN 0
CALL :ONECOLUMN 1
CALL :ONECOLUMN 2
CALL :ONECOLUMN 3
REM CALL :ONECOLUMN 4
REM CALL :ONECOLUMN 5
REM CALL :ONECOLUMN 6
REM CALL :ONECOLUMN 7
REM CALL :ONECOLUMN 8
REM CALL :ONECOLUMN 9
REM CALL :ONECOLUMN 10

"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%outputdir_downsized%\a.%row%.*.jpg) /convert=%outputdir_result%\row.%row%.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%outputdir%\a.%row%.*.jpg) /convert=%outputdir_result%\row_HIRES.%row%.jpg
"C:\Program Files\IrfanView\i_view64.exe" "%CD%\%outputdir_result%\row.%row%.jpg" /resize=(8192) /aspectratio /resample /convert="%CD%\%outputdir_result%\row_small.%row%.jpg"

exit /b

:ONECOLUMN

SET column=%1
SET column2=%1
IF %column2% == 0 SET column2=

mkdir %row%  >NUL 2>NUL
cd %row%
mkdir %column%  >NUL 2>NUL

@echo off

MOVE r.%column2%0.*.png %column% >NUL 2>NUL
MOVE r.%column2%1.*.png %column% >NUL 2>NUL
MOVE r.%column2%2.*.png %column% >NUL 2>NUL
MOVE r.%column2%3.*.png %column% >NUL 2>NUL
MOVE r.%column2%4.*.png %column% >NUL 2>NUL
MOVE r.%column2%5.*.png %column% >NUL 2>NUL
MOVE r.%column2%6.*.png %column% >NUL 2>NUL
MOVE r.%column2%7.*.png %column% >NUL 2>NUL
MOVE r.%column2%8.*.png %column% >NUL 2>NUL
MOVE r.%column2%9.*.png %column% >NUL 2>NUL

cd ..

rem remove for making 10x10
rem exit /b

echo on

"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%0.png) /convert=%row%\%column%\0.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%1.png) /convert=%row%\%column%\1.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%2.png) /convert=%row%\%column%\2.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%3.png) /convert=%row%\%column%\3.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%4.png) /convert=%row%\%column%\4.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%5.png) /convert=%row%\%column%\5.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%6.png) /convert=%row%\%column%\6.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%7.png) /convert=%row%\%column%\7.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%8.png) /convert=%row%\%column%\8.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(1,%row%\%column%\r.*.%row2%9.png) /convert=%row%\%column%\9.0.jpg
"C:\Program Files\IrfanView\i_view64.exe" /panorama=(2,%row%\%column%\*.0.jpg) /convert=%outputdir%\a.%row%.%column%.jpg
"C:\Program Files\IrfanView\i_view64.exe" "%CD%\%outputdir%\a.%row%.%column%.jpg" /resize=(2048,2048) /resample /convert="%CD%\%outputdir_downsized%\a.%row%.%column%.jpg"

echo off

exit /b

