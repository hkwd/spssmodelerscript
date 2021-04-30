@echo off
setlocal
SET MODELERPATH="C:\Program Files\IBM\SPSS\Modeler\18.2.2\bin\modelerclient.exe"
SET MODELERSCRIPT="%AppData%\Microsoft\Windows\SendTo\changecurrelpath.py"

REM �J�����g�f�B���N�g���̎擾
for /f "usebackq delims=" %%A in (`CHDIR`) do set CDIR=%%A
echo %CDIR%
echo %1\
REM �������t�H���_�ł��邱�Ƃ𔻒�
for /f "usebackq delims=" %%A in (`powershell Test-Path -PathType container %1`) do set CONTAINTER=%%A
echo %CONTAINTER%

if  %CONTAINTER%==True (
  echo "direcotry"
  REM �������f�t�H���g�f�B���N�g���Ƃ���Modeler���N��
  start "" %MODELERPATH% -directory "%1"
) else (
  echo "file"
  REM �J�����g�f�B���N�g�����f�t�H���g�f�B���N�g���Ƃ���Modeler���N���B������str�t�@�C�����J�����΃p�X�ɏ���������X�N���v�g�����s����
  start "" %MODELERPATH% -directory "%CDIR%" -stream "%1" -script "%MODELERSCRIPT%" -execute
)
