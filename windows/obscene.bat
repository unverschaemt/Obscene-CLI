@echo off

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% EQU 1 goto install
if %argC% EQU 2 goto dir
if %argC% EQU 3 goto plugin

:install
if "%1" NEQ "install" goto failed
echo "installing..."
goto end

:dir
if "%1" NEQ "create" goto failed
echo "creating directory..."
goto end

:plugin
if "%1" NEQ "plugin" goto failed
if "%2" EQU "add" (
echo "adding plugin"
goto end
)
if "%2" EQU "remove" (
echo "removing plugin"
goto end
)
goto failed

:failed
echo.
echo "Unsupported arguments" 
echo "Usage:%0 install"
echo "%0 create directoryName"
echo "%0 plugin add pluginName"
echo "%0 plugin remove pluginName"
echo.
echo.
goto end

:end
pause