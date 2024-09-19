@echo off
title Shine Solutions Improve System
color 0D

REM Check for Administrator permissions
:checkAdmin
net session >nul 2>&1
if %errorLevel% == 0 (goto init) else (goto getAdmin)

:getAdmin
echo Requesting administrative privileges...
echo Please accept the UAC prompt to continue.
powershell -Command "Start-Process cmd -ArgumentList '/c %~0' -Verb RunAs"
exit /b

:init
REM Check if the app is run for the first time
if not exist "first_run_marker.txt" (
    echo First run detected. Redirecting to Discord...
    start https://discord.gg/KFH3nmkmAx
    echo This marker file indicates the app has been run before. > first_run_marker.txt
)

:menu
cls
echo *************************************************************
echo *                                                           *
echo *   SSSSS   H   H   IIIII   N    N   EEEEE                  *
echo *   S       H   H     I     NN   N   E                      *
echo *   SSSSS   HHHHH     I     N N  N   EEEE                   *
echo *       S   H   H     I     N  N N   E                      *
echo *   SSSSS   H   H   IIIII   N    N   EEEEE                  *
echo *                                                           *
echo *         Shine Solutions Improve System                    *
echo *                                                           *
echo *************************************************************
echo Select an optimization option:
echo 1. Clear temporary files
echo 2. Adjust visual effects for best performance
echo 3. Disable unnecessary startup programs
echo 4. Set power plan to high performance
echo 5. Run all optimizations
echo 6. FiveM Improve
echo 0. Exit
echo *************************************************************
set /p choice="Enter your choice: "

if '%choice%' == '1' goto clear_temp_files
if '%choice%' == '2' goto adjust_visual_effects
if '%choice%' == '3' goto disable_startup_programs
if '%choice%' == '4' goto set_high_performance
if '%choice%' == '5' goto run_all
if '%choice%' == '6' goto fivem_improve
if '%choice%' == '0' goto end
goto menu

:animation
cls
echo Optimizing, please wait...
setlocal ENABLEDELAYEDEXPANSION
for /l %%x in (1, 1, 3) do (
    set "dots="
    for /l %%y in (1, 1, %%x) do set "dots=!dots!."
    echo !dots!
    ping -n 2 127.0.0.1 > nul
)
endlocal
cls
goto :eof

:clear_temp_files
call :animation
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem -Path $env:TEMP -Recurse | ForEach-Object { try { Remove-Item $_ -Force -Recurse } catch { Write-Output 'Skipping file in use: ' $_.FullName } }; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while clearing temporary files.
    goto post_optimization
) else (
    echo Temporary files cleared.
)
goto post_optimization

:adjust_visual_effects
call :animation
powershell -NoProfile -ExecutionPolicy Bypass -Command "$Performance = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'; Set-ItemProperty -Path $Performance -Name VisualFXSetting -Value 2; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while adjusting visual effects.
    goto post_optimization
) else (
    echo Visual effects adjusted.
)
goto post_optimization

:disable_startup_programs
call :animation
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_StartupCommand | ForEach-Object { $_.Delete() }; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while disabling startup programs.
    goto post_optimization
) else (
    echo Startup programs disabled.
)
goto post_optimization

:set_high_performance
call :animation
powershell -NoProfile -ExecutionPolicy Bypass -Command "powercfg -setactive SCHEME_MIN; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while setting power plan to high performance.
    goto post_optimization
) else (
    echo Power plan set to high performance.
)
goto post_optimization

:run_all
call :animation
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem -Path $env:TEMP -Recurse | ForEach-Object { try { Remove-Item $_ -Force -Recurse } catch { Write-Output 'Skipping file in use: ' $_.FullName } }; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while clearing temporary files.
    goto post_optimization
) else (
    echo Temporary files cleared.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "$Performance = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects'; Set-ItemProperty -Path $Performance -Name VisualFXSetting -Value 2; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while adjusting visual effects.
    goto post_optimization
) else (
    echo Visual effects adjusted.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_StartupCommand | ForEach-Object { $_.Delete() }; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while disabling startup programs.
    goto post_optimization
) else (
    echo Startup programs disabled.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "powercfg -setactive SCHEME_MIN; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while setting power plan to high performance.
    goto post_optimization
) else (
    echo Power plan set to high performance.
)
goto post_optimization

:fivem_improve
call :animation
powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Path $env:LOCALAPPDATA\FiveM\FiveM.app\cache\ -Recurse -Force; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while clearing FiveM cache.
    goto post_optimization
) else (
    echo FiveM cache cleared.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "
    $SettingsPath = [System.IO.Path]::Combine($env:LOCALAPPDATA, 'FiveM', 'FiveM.app', 'citizen', 'fx', 'settings.xml');
    if (Test-Path $SettingsPath) {
        [xml]$settings = Get-Content $SettingsPath;
        $settings.SelectSingleNode('//Graphics/Resolution').InnerText = '800x600';
        $settings.SelectSingleNode('//Graphics/Quality').InnerText = 'Low';
        $settings.Save($SettingsPath);
    }; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while setting FiveM graphics settings.
    goto post_optimization
) else (
    echo FiveM graphics settings adjusted.
)
powershell -NoProfile -ExecutionPolicy Bypass -Command "powercfg -setactive SCHEME_MIN; if ($?) { exit 0 } else { exit 1 }"
if %errorlevel% neq 0 (
    echo Error occurred while setting system performance mode.
    goto post_optimization
) else (
    echo System performance mode set.
)
goto post_optimization

:post_optimization
echo *************************************************************
echo * Optimization complete.                                    *
echo * 1. Back to the menu                                       *
echo * 0. Exit                                                   *
echo *************************************************************
set /p choice="Enter your choice: "
if '%choice%' == '1' goto menu
if '%choice%' == '0' goto end
goto post_optimization

:end
echo Exiting... 👋
pause
