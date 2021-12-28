@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo:
echo:
echo ============================================================================================================
echo  Program to rename Blender output jpg files 0001.jpg, 0005.jpg to desired naming convention
echo ============================================================================================================
echo 	Start in Dir where images are
echo    CALLING USAGE: 'CyclesRename.bat [param_name] [step] [turbosquid]' in the directory
echo:
echo   [param_name]		=  anything like eg.: 'image'
echo   [step]		=  use 1 if you want output eg.: 'image_1', 'image_2', ...
echo   [turbosquid]		=  use 'true' if you want eg.: 'image_01', 'image_02', ... for turbosquid format, MAX 72 pictures tho
echo:

echo -----------
echo  Program started, parameters were
echo:
echo $parameter_name: %1%
echo $step: %2%
echo $turbosquid: %3%

echo:
echo -----------
echo: 

REM helper variables
set /A NewStep= 0
set /A CurStep= 0
set Padding=%3%

REM minimum step is 1, this requires delayedexpansion  enabled
if %2% LSS 1 (
	set /A Inc=1
) else (
	set /A Inc=%2%
)

REM if used padding for turbosquid it will have leading zero
if "%Padding%"=="true" (
	echo HAHA
	set Padding=0
) else (
	echo HEHE
	set Padding=
)

REM uncomment in case you want to stop code here
REM goto :eof 

mkdir output

echo -----------
for %%x in (*.jpg) do call :body %%x %1%
goto :afterbody

:body
echo Old File Name: "%1"
	echo ..
	REM numeric assignment
	set /A NewStep= %CurStep% + %Inc%
	echo Current: [%CurStep%] , Next: [%NewStep%]
	echo ..
	
	REM for next round
	set /A CurStep = %NewStep%
	
	REM give leading zero in case of turbosquid, appliable when lower than 10
	if %NewStep% LSS 10 (
		set NewStep=%Padding%%NewStep%
	)

	set NewFName=%2_%NewStep%.jpg
	echo New File Name: %NewFName%
	::::ren %1 %NewFName%
	echo Copying %cd%\%1 >> into >> %cd%\output\%NewFName%
	copy %cd%\%1 %cd%\output\%NewFName%
	
	echo =========
goto :eof

:afterbody
echo ============================================================================================================
echo: 
pause
echo: