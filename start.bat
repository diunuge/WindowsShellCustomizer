@echo off
:MAIN
if not exist cache (
    GOTO CREATE_CACHE_FOLDER
) else (
	GOTO START
)

:CREATE_CACHE_FOLDER
	mkdir cache
	goto MAIN
	
:START
	"admin.bat"
	exit
	
	
	