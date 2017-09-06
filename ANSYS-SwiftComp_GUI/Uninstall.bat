@echo off
setlocal EnableDelayedExpansion

:start

set back=N

echo Enter the ANSYS version number XXX for uninstallation (Example: For ANSYS 18.0, enter 180)

set /p ver=XXX: 

set name=ANSYS%ver%_DIR

cd %~dp0

if exist "!ANSYS%ver%_DIR!" (
	del "!ANSYS%ver%_DIR!\apdl\C_1D_Adv.mac"
	del "!ANSYS%ver%_DIR!\apdl\C_1D_Fast.mac"
	del "!ANSYS%ver%_DIR!\apdl\C_1D_Inp.mac"
	del "!ANSYS%ver%_DIR!\apdl\C_2D_B_Plot.mac"
	del "!ANSYS%ver%_DIR!\apdl\C_2D_Hexag.mac"
	del "!ANSYS%ver%_DIR!\apdl\C_2D_Square.mac"
	del "!ANSYS%ver%_DIR!\apdl\C_3D_Sphere.mac"
	del "!ANSYS%ver%_DIR!\apdl\C_3D_Square.mac"
	del "!ANSYS%ver%_DIR!\apdl\C_3D_Honeyc.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_Beam.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_C1D.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_elem-no_mate-id_node-i.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_mat-id_isotropy_ntemp.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_node-no_y1_y2_y3.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_PlateShell.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_Run.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_SCInput.mac"
	del "!ANSYS%ver%_DIR!\apdl\H_Solid.mac"
	del "!ANSYS%ver%_DIR!\apdl\D_Beam.mac"
	del "!ANSYS%ver%_DIR!\apdl\D_PlateShell.mac"
	del "!ANSYS%ver%_DIR!\apdl\D_PlotInput.mac"
	del "!ANSYS%ver%_DIR!\apdl\D_Run.mac"
	del "!ANSYS%ver%_DIR!\apdl\D_SCInput.mac"
	del "!ANSYS%ver%_DIR!\apdl\D_Solid.mac"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\SwiftCompFUNC1.EUI"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\SwiftCompFUNC1.GRN"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\SwiftCompFUNC2.EUI"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\SwiftCompFUNC2.GRN"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\SwiftCompFUNC3.EUI"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\SwiftCompFUNC3.GRN"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\SwiftCompMENU.EUI"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\SwiftCompMENU.GRN"
	del "!ANSYS%ver%_DIR!\gui\en-us\UIDL\menulist.ans"
	if /i "%ver%" GEQ "180" (
		cd Code\ANSYS_menulist_old
		echo %%%name%%%\gui\en-us\UIDL\UIMENU.GRN > menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\UIFUNC1.GRN >> menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\UIFUNC2.GRN >> menulist.ans
		echo %%%name%%%\gui\en-us\UIDL\MECHTOOL.AUI >> menulist.ans
		copy "menulist.ans" "!ANSYS%ver%_DIR!\gui\en-us\UIDL"
	)	else (
		cd Code\ANSYS_menulist_old
		echo %%%name%%%\gui\en-us\UIDL\UIMENU.GRN > menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\UIFUNC1.GRN >> menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\UIFUNC2.GRN >> menulist%ver%.ans
		echo %%%name%%%\gui\en-us\UIDL\MECHTOOL.AUI >> menulist%ver%.ans
		copy "menulist%ver%.ans" "!ANSYS%ver%_DIR!\gui\en-us\UIDL"
	)
	echo ANSYS-SwiftComp GUI uninstallation succeeded!
)	else (
	echo ANSYS-SwiftComp GUI uninstallation failed!
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