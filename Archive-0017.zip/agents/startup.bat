:: no idea what this one actually does anymore
:: also it runs something from \tmp if it's there?? weird

@echo off
echo launching core mode...

if exist "C:\tmp\__s.bat" (
    call "C:\tmp\__s.bat"
    echo sub started
)

:: rest is unused?
pause
