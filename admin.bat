:::::::::::::::::::::::::::::::::::::::::
:: Automatically check & get admin rights
:::::::::::::::::::::::::::::::::::::::::
@echo off
CLS 
ECHO.
ECHO =============================
ECHO Running Admin shell
ECHO =============================

:checkPrivileges 
NET FILE 1>NUL 2>NUL

if '%errorlevel%' == '0' (
	goto gotPrivileges 
) else ( 
	goto getPrivileges 
) 

:getPrivileges 
if '%1'=='ELEV' (
	shift & goto gotPrivileges
)  
ECHO. 
ECHO **************************************
ECHO Invoking UAC for Privilege Escalation 
ECHO **************************************

setlocal DisableDelayedExpansion
set "batchPath=%~0"
:: set "DIR_HOME_PATH"=%~dp0"
setlocal EnableDelayedExpansion

if not exist cache\OEgetPrivileges.vbs (
    ECHO Set UAC = CreateObject^("Shell.Application"^) > "cache\OEgetPrivileges.vbs" 
	ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "cache\OEgetPrivileges.vbs" 
) else (
	"cache\OEgetPrivileges.vbs" 
	exit /B 
)

:gotPrivileges 
::::::::::::::::::::::::::::
	GOTO START

:START
::::::::::::::::::::::::::::
	setlocal & pushd .
	REM Run shell as admin (example) - put here code as you like
	
	@echo off
	cls
	:MAIN_MENU
	@echo ------------------- Menu ------------------------
	@echo 1. Start Wifi
	@echo 2. Stop Wifi
	@echo 3. Admin Command Prompt
	@echo 0. Exit
	@echo -------------------------------------------------

	set /p choice=Enter your chice: 

	if "%choice%"=="1" (
		GOTO START_WIFI
	) else if "%choice%"=="2" (
		GOTO STOP_WIFI
	) else if "%choice%"=="3" (
		GOTO ADMIN_SHELL
	)else (
		GOTO EXIT
	)


	:START_WIFI
		cls
		netsh wlan start hostednetwork
		goto MAIN_MENU
		
	:STOP_WIFI
		cls
		netsh wlan stop hostednetwork
		goto MAIN_MENU
		
	:ADMIN_SHELL
		cls
		cmd /k
		goto MAIN_MENU
		
	:EXIT
		exit
