@echo off

    if exist "Lib Mad 1vCurrent.obj" del "Lib Mad 1vCurrent.obj"
    if exist "Lib Mad 1vCurrent.exe" del "Lib Mad 1vCurrent.exe"

    \masm32\bin\ml /c /coff "Lib Mad 1vCurrent.asm"
    if errorlevel 1 goto errasm

    \masm32\bin\PoLink /SUBSYSTEM:CONSOLE "Lib Mad 1vCurrent.obj"
    if errorlevel 1 goto errlink
    dir "Lib Mad 1vCurrent.*"
    goto TheEnd

  :errlink
    echo _
    echo Link error
    goto TheEnd

  :errasm
    echo _
    echo Assembly Error
    goto TheEnd
    
  :TheEnd

pause
