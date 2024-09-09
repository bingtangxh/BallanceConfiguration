@echo off
rem 2020-02-12 2023-08-11
rem 喜羊羊与灰太狼十八周年
Setlocal enabledelayedexpansion
::CODER BY 9826HZg POWERD BY iBAT
:start
if exist "%systemdrive%\Program Files (x86)" (set b=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Ballance\Settings) else (set b=HKEY_LOCAL_MACHINE\SOFTWARE\Ballance\Settings)
IF EXIST ""%appdata%\9826\color.bat"" (call "%appdata%\9826\color.bat") ELSE (color 0f)
rem IF NOT EXIST "base.cmo" (goto setcd)
:Menu1
title Startup.exe Repair v1.1.0.20230803 Portable
cls
echo %b%
rem echo 请以管理员身份运行本程序！
%1 start "" mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 rem ","","runas",1)(window.close)&&exit
echo 欢迎使用Startup.exe修复器
echo 本程序通过修改注册表值实现目的
echo.
echo 请选择功能：
echo [1]修复 [2]附加功能 [3]退出
set /P c=输入数字并按Enter：
IF "%c%"=="1" (goto setcd)
IF "%c%"=="2" (goto Menu2)
IF "%c%"=="3" (goto end)
set e=1
goto error1
:Menu2
cls
echo 请选择功能：
echo [1]修改Ballance语言（不适用于汉化版）
echo [2]修改Ballance是否全屏
echo [3]撤销FullScreen Setup中的选择
echo [4]返回
set /P c=输入数字并按Enter：
IF "%c%"=="1" (goto Menu3)
IF "%c%"=="2" (goto Menu4)
IF "%c%"=="3" (goto Reg2)
IF "%c%"=="4" (goto Menu1)
set e=2
goto error1
:Menu3
cls
echo 请选择语言：
echo [0]德语
echo [1]英语
echo [2]意大利语
echo [3]西班牙语
echo [4]法语
echo [5]返回
set /P c=输入数字并按Enter：
IF "%c%"=="0" (goto Reg3)
IF "%c%"=="1" (goto Reg3)
IF "%c%"=="2" (goto Reg3)
IF "%c%"=="3" (goto Reg3)
IF "%c%"=="4" (goto Reg3)
IF "%c%"=="5" (goto Menu2)
set e=3
goto error1
:Menu4
cls
echo 请选择模式：
echo [0]窗口化
echo [1]全屏化
echo [2]返回
set /P c=输入数字并按Enter：
IF "%c%"=="0" (goto Reg4)
IF "%c%"=="1" (goto Reg4)
IF "%c%"=="2" (goto Menu2)
set e=4
goto error1
:error1
echo.
echo 输入好像不对哦，再试一次吧。
echo 输入的字符必须是半角，可以同时按Ctrl键和Shift来切换输入法。
echo.
pause
goto menu%e%
:setcd
cls
rem echo 当前目录好像不是Ballance所在的目录，因为这里没有Ballance标志性的base.cmo。
echo 请输入Ballance所在的路径，然后按Enter。
echo 这次本程序不会验证输入的路径是否有误，请小心。
echo 最后不要带反斜线。
set /p "r=输入路径>"
if not exist "%r%" echo 这个目录不存在！&pause&goto setcd
chdir /d %r%
goto Reg1

:Reg1
reg add %b% /v TargetDir /t REG_SZ /d %cd%
reg add %b% /v ScrDir /t REG_SZ /d C:\Setup
reg add %b% /v ScrDisc /t REG_SZ /d C:\
reg add %b% /v SetupCommand /t REG_SZ /d "C:\Program Files\InstallShield Installation Information\{42E0783D-3BA4-454B-B58A-BF26E49EB7DE}\setup.exe"
reg add %b% /v SrcDir /t REG_SZ /d C:\setup
reg add %b% /v SrcDisc /t REG_SZ /d C:
goto end

:Reg2
reg delete %b% /v VideoMode
reg delete %b% /v VideoDriver
goto end

:Reg3
reg add %b% /v Language /t REG_DWORD /d %c%
goto end

:Reg4
reg add %b% /v FullScreen /t REG_DWORD /d %c%
goto end

:done
:end