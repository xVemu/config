@echo off
echo "Current Java Version is"
echo %JAVA_HOME%
setlocal enableDelayedExpansion
SET PT="C:\Program Files\Eclipse Adoptium"
cd %PT%
::build "array" of folders
set folderCnt=0
for /f "eol=: delims=" %%F in ('dir /b /ad *') do (
  set /a folderCnt+=1
  set "folder!folderCnt!=%%F"
)

::print menu
for /l %%N in (1 1 %folderCnt%) do echo %%N - !folder%%N!
echo(

:get selection
set selection=
set /p "selection=Enter number to Set the JAVA_HOME and PATH "
echo you picked %selection% - !folder%selection%!
cd %PT%\!folder%selection%!
echo %cd%
( endlocal & rem return
   Set jdk=%cd%

)
echo Setting JAVA_HOME
SETX /M JAVA_HOME "%jdk%"
SET JAVA_HOME=%jdk%
echo %JAVA_HOME%
echo setting PATH
setx PATH /M "%JAVA_HOME%\bin;%PATH%"
echo Display java version
java -version
