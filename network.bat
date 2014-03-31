@echo off
:MAIN_MENU
@echo ------------------- Menu ------------------------
@echo 1. Start Wifi
@echo 2. Stop Wifi
@echo 0. Exit
@echo -------------------------------------------------

set /p choice=Enter your chice: 

if "%choice%"=="1" (
    GOTO START_WIFI
) else if "%choice%"=="2" (
    GOTO STOP_WIFI
) else (
	exit
)


:START_WIFI
	cls
	netsh wlan start hostednetwork
	goto MAIN_MENU
	
:STOP_WIFI
	cls
	netsh wlan stop hostednetwork
	goto MAIN_MENU
	
	
	