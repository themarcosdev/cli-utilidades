@echo off
reg add "HKEY_CLASSES_ROOT\myapp\shell\open\command" /ve /t REG_SZ /d "\"C:\path\to\secondfile.bat\" \"%1\"" /f
pause
