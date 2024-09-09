:start
@echo off
cls
title Ballance 配置工具
VERIFY OTHER 2>nul
setlocal enableextensions
if errorlevel 1 (
    echo 未能启用命令扩展。
    echo 本程序无法继续运行，请按任意键退出。
    pause>nul
    goto end
)
set p="%cd%\Player.ini"
rem 这个p指的是Player.ini的路径
if exist %p% (goto mainMenu) else goto defPath

:defPath
cls
echo 本程序在当前目录下没有找到Player.ini
echo 请手动指定该文件所在路径，文件名可以不是Player.ini
echo 下次运行本程序之前，你可以将本程序和Player.exe放在同一个文件夹下。
echo.
pause
goto defPath2

:defPath2
cls
echo 请输入配置文件的完整路径（也可以用鼠标将文件拖进来），然后按Enter。
echo 可以不加双引号。
echo.
set /p p=配置文件的路径：
for /f "tokens=*" %%A in ("%p%") do set p="%%~A"
if exist %p% (goto mainMenu) else goto defPathError

:defPathError
echo 您输入的路径有误，请重新输入。
echo.
pause
goto defPath2

:mainMenu

echo ╔════════════════════════════════════════════╗
echo ║              请选择您要查看的类别          ║
echo ╟─────────┬────────────────┬─────────────────╢
echo ║   [1]   │     Startup    │       启动      ║
echo ║   [2]   │     Graphics   │       图形      ║
echo ║   [3]   │     Window     │       窗体      ║
echo ║   [4]   │     Game       │       界面      ║
echo ╟─────────┴────────────────┴─────────────────╢
echo ║   [5]  跳转到注册表相关（适用于原版Player）║
echo ╚════════════════════════════════════════════╝
echo.
pause
