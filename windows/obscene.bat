@echo off

set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% EQU 1 goto install
if %argC% EQU 2 goto dir
if %argC% EQU 3 goto plugin

echo.
echo "Unsupported arguments" 
echo "Usage:%0 install"
echo "%0 create directoryName"
echo "%0 plugin add pluginName"
echo "%0 plugin remove pluginName"
echo.
echo.
goto :end

:install
echo "installing..."
goto end

:dir
echo "creating directory..."
goto end

:plugin
echo "adding/removing plugin..."
goto end

:end
pause