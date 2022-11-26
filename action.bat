ping -n 1 %1 > nul
IF %ERRORLEVEL%==0 echo %1 >> done.txt
IF %ERRORLEVEL%==0 goto up
echo %1 >> offline.txt
goto end

:up
copy hosts.bat "\\%1\c$\windows\system32\"
psexec \\%1 hosts.bat
del "\\%1\c$\windows\system32\hosts.bat"

goto end

:end