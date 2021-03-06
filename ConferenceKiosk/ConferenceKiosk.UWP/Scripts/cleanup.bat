@echo off

set project=ConferenceVision
set desktop=%USERPROFILE%\Desktop
set zip=7za.exe
set reset=%cd%

echo %1
echo %2

if "%1"=="archive" (
    echo Cleaning project directory...
    cd %desktop%\%project%
    for /d %%a in (*) do for /d %%b in (bin\) do rmdir /s /q "%%a\%%b"
    for /d %%a in (*) do for /d %%b in (obj\) do rmdir /s /q "%%a\%%b"
    for /d %%a in (.vs\) do rmdir /s /q "%%a"
    cd %reset%

    echo Archiving project to the desktop...
    %zip% a -r %desktop%\%project%.zip %desktop%\%project%
)

echo Removing project files...
rmdir /s /q %desktop%\%project%

if "%1"=="reset" (
    rmdir /s /q %desktop%\%project%
    del /q %desktop%\%project%.zip
)