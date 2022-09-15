@echo off
setlocal
SET MODELERPATH="C:\Program Files\IBM\SPSS\Modeler\18.3\bin\modelerclient.exe"

REM カレントディレクトリの取得
for /f "usebackq delims=" %%A in (`CHDIR`) do set CDIR=%%A
echo %CDIR%
echo %1\
REM 引数がフォルダであることを判定
for /f "usebackq delims=" %%A in (`powershell Test-Path -PathType container %1`) do set CONTAINTER=%%A
echo %CONTAINTER%

if  %CONTAINTER%==True (
  echo "direcotry"
  REM 引数をデフォルトディレクトリとしてModelerを起動
  start "" %MODELERPATH% -directory "%1"
) else (
  echo "file"
  REM カレントディレクトリをデフォルトディレクトリとしてModelerを起動。引数のstrファイルを開く
  start "" %MODELERPATH% -directory "%CDIR%" -stream "%1"
) 