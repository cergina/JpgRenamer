@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo ============================================================================================================
echo  Program to rename JPG files 0001.jpg, 0005.jpg to [param_name]_[0+1*step].jpg, [param_name]_[0+2*step].jpg, ...
echo ============================================================================================================
echo 	Start in Dir where images are
echo    call this in way: CyclesRename.bat [param_name] [step] in the directory

echo Parameter name: %1%
echo Step is: %2%

set /A NewStep= 0
set /A CurStep= 0
set /A Inc= 1

mkdir OUTPUT

echo ============================================================================================================
for %%x in (*.jpg) do call :body %%x %1%
goto :afterbody

:body
echo Old File Name: "%1"
	echo ..
	set /A NewStep= %CurStep% + %Inc%
	echo Current: [%CurStep%] , Next: [%NewStep%]
	echo ..
	set NewFName=%2_%NewStep%.jpg
	echo New File Name: %NewFName%
	::::ren %1 %NewFName%
	echo Copying %cd%\%1 >> into >> %cd%\OUTPUT\%NewFName%
	copy %cd%\%1 %cd%\OUTPUT\%NewFName%
	set /A CurStep = %NewStep%
	echo =========
goto :eof

:afterbody
echo ============================================================================================================
pause
