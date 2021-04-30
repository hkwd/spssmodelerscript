@echo off
setlocal
SET MODELERPATH="C:\Program Files\IBM\SPSS\Modeler\18.2.2\bin\modelerclient.exe"
SET MODELERSCRIPT="%AppData%\Microsoft\Windows\SendTo\changecurrelpath.py"

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
  REM カレントディレクトリをデフォルトディレクトリとしてModelerを起動。引数のstrファイルを開き相対パスに書き換えるスクリプトを実行する
  start "" %MODELERPATH% -directory "%CDIR%" -stream "%1" -script "%MODELERSCRIPT%" -execute
)
