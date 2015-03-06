@echo off
set argC=0
for %%x in (%*) do Set /A argC+=1

if %argC% equ 1 (
    goto install
) else if %argC% equ 2 (
    goto dir
) else if %argC% equ 3 (
    goto plugin
)
else (
	echo "Unsupported arguments" 
	echo .
	echo "Usage:%0 install"
	echo .
	echo "%0 create directoryName"
	echo .
	echo "%0 plugin add pluginName"
	echo .
	echo "%0 plugin remove pluginName"
	pause
)

:install
echo "installing..."
:dir
echo "creating directory..."
:plugin
echo "adding/removing plugin..."

pause