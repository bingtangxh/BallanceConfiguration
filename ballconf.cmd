:start
@echo off
cls
title Ballance ���ù���
VERIFY OTHER 2>nul
setlocal enableextensions
if errorlevel 1 (
    echo δ������������չ��
    echo �������޷��������У��밴������˳���
    pause>nul
    goto end
)
set p="%cd%\Player.ini"
rem ���pָ����Player.ini��·��
if exist %p% (goto mainMenu) else goto defPath

:defPath
cls
echo �������ڵ�ǰĿ¼��û���ҵ�Player.ini
echo ���ֶ�ָ�����ļ�����·�����ļ������Բ���Player.ini
echo �´����б�����֮ǰ������Խ��������Player.exe����ͬһ���ļ����¡�
echo.
pause
goto defPath2

:defPath2
cls
echo �����������ļ�������·����Ҳ��������꽫�ļ��Ͻ�������Ȼ��Enter��
echo ���Բ���˫���š�
echo.
set /p p=�����ļ���·����
for /f "tokens=*" %%A in ("%p%") do set p="%%~A"
if exist %p% (goto mainMenu) else goto defPathError

:defPathError
echo �������·���������������롣
echo.
pause
goto defPath2

:mainMenu

echo �X�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�[
echo �U              ��ѡ����Ҫ�鿴�����          �U
echo �c�������������������Щ��������������������������������Щ����������������������������������f
echo �U   [1]   ��     Startup    ��       ����      �U
echo �U   [2]   ��     Graphics   ��       ͼ��      �U
echo �U   [3]   ��     Window     ��       ����      �U
echo �U   [4]   ��     Game       ��       ����      �U
echo �c�������������������ة��������������������������������ة����������������������������������f
echo �U   [5]  ��ת��ע�����أ�������ԭ��Player���U
echo �^�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�T�a
echo.
pause
