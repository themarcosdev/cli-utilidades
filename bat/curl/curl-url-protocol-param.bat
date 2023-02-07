@echo off

set URL=https://example.com.br?teste=123&teste1=abc

for /f "tokens=1* delims=:" %%a in ('curl %URL% ^| findstr /r ".*teste.*"') do set "RESULT=%%b"

echo %RESULT%

pause
