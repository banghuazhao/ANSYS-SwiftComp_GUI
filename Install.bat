@echo off
setlocal EnableDelayedExpansion

:start

set back=N

echo Enter the ANSYS version number XXX for installation (Example: For ANSYS 18.0, enter 180)

set /p ver=XXX: 

set name=ANSYS%ver%_DIR

cd %~dp0

if exist "!ANSYS%ver%_DIR!" (
	copy "Code\SwiftCompGUI_APDL" "!ANSYS%ver%_DIR!\apdl"
	copy "Code\SwiftCompGUI_UIDL" "!ANSYS%ver%_DIR!\gui\en-us\UIDL"
	if /i "%ver%" GEQ "180" (
		cd Code\ANSYS_menulist_new
		echo %%%name%%%\gui\en-us\UIDL\UIMENU.GRN > menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\UIFUNC1.GRN >> menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\UIFUNC2.GRN >> menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\MECHTOOL.AUI >> menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\SwiftCompMENU.GRN >> menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\SwiftCompFUNC1.GRN >> menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\SwiftCompFUNC2.GRN >> menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\SwiftCompFUNC3.GRN >> menulist.ans
		copy "menulist.ans" "!ANSYS%ver%_DIR!\gui\en-us\UIDL"
	)	else (
		cd Code\ANSYS_menulist_new
		echo %%%name%%%\gui\en-us\UIDL\UIMENU.GRN > menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\UIFUNC1.GRN >> menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\UIFUNC2.GRN >> menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\MECHTOOL.AUI >> menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\SwiftCompMENU.GRN >> menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\SwiftCompFUNC1.GRN >> menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\SwiftCompFUNC2.GRN >> menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\SwiftCompFUNC3.GRN >> menulist%ver%.ans
		copy "menulist%ver%.ans" "!ANSYS%ver%_DIR!\gui\en-us\UIDL"
	)
	echo ANSYS-SwiftComp GUI installation succeeded!
)	else (
	echo ANSYS-SwiftComp GUI installation failed!
	echo Please check the ANSYS version number. 
	echo The version number that you have entered is %ver%
	set /p back=Try again? [Y/N]   
	)
	if /i "%back%" EQU "Y" (
		echo.
		goto start
	) else (
	echo.
	)
)

pause