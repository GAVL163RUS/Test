@echo off
for /f %%i in ('powershell ^(get-date^).DayOfWeek') do set a=%%i
IF %a% EQU Wednesday ((echo "Nuzen dopolnitel'niy akcept, prodolzit?") 
(choice /M "Press Y to continue or N to stop" /c YN
if errorlevel 255 (
  echo Error
) else if errorlevel 2 (
  echo No.
) else if errorlevel 1 (
  echo Yes.
) else if errorlevel 0 (
  echo Ctrl+C pressed.
))
)
IF %a% NEQ Wednesday  (echo "Segodnya ne sreda")
pause
