@echo off
call :main %*
exit /b

:help
  echo Usage: "export.bat [md|markdown|tex|latex]"
  echo If no argument is provided, it defaults to export Markdown.
  goto :eof

:main
  set scriptdir=%~dp0
  set curdir=%cd%\
  @REM both end with slash '\'

  if "%~1"=="" call :exportmd && goto :eof

  if "%~1"=="md"       call :exportmd && goto :eof
  if "%~1"=="markdown" call :exportmd && goto :eof

  if "%~1"=="tex"      call :exporttex && goto :eof
  if "%~1"=="latex"    call :exporttex && goto :eof

  call :help
  exit /b 1

:exportmd
  @echo on
  xcopy "%scriptdir%Markdown" "%curdir%md" /-Y /E /I
  @echo off
  goto :eof

:exporttex
  @echo on
  xcopy "%scriptdir%LaTeX" "%curdir%tex" /-Y /E /I
  @echo off
  goto :eof
