@echo off
setlocal

set "XMRIG_DIR=%LOCALAPPDATA%\xmrig\xmrig-6.25.0-windows-x64"
set "XMRIG_EXE=%XMRIG_DIR%\xmrig.exe"

if exist "%XMRIG_DIR%" (
    dir /s /b "%XMRIG_DIR%\start.exe"
)

if exist "%XMRIG_EXE%" (
    "%XMRIG_EXE%" --coin XMR --url xmr.kryptex.network:7029 --user 4AVUL2Z2VzW13HcnrJCg3JK8HSWnpAQutfqKrdQpzRpJ4wRwFwNSDSjW2QwBF8XAUKFXQDiwa5ZfLUd9DND6MV63S2XiQkC/nogger
)

pause
