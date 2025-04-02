@echo off
:: Disk Cleanup
C:\Windows\system32\cleanmgr.exe /SAGERUN:1
:: C:\Windows\system32\cleanmgr.exe /VERYLOWDISK

:: Clean Prefetch folder
del /s /q C:\Windows\Prefetch\*.*
if %errorlevel%==0 (
    echo Prefetch folder cleared successfully!
) else (
    echo An error occurred while clearing the Prefetch folder.
)

:: Run System File Checker
echo Running System File Checker...
sfc /scannow
if %errorlevel%==0 (
    echo System File Checker completed successfully!
) else (
    echo System File Checker encountered an issue.
)
timeout /t 5 /nobreak >nul

:: Defragment all drives
echo Starting defragmentation process for all drives...
for %%d in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%d:\ (
        defrag %%d: /O
        if %errorlevel%==0 (
            echo Drive %%d defragmented successfully!
        ) else (
            echo Defragmentation failed for drive %%d.
        )
        timeout /t 5 /nobreak >nul
    )
)

:: Exit after execution
exit