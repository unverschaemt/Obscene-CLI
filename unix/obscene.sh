#!/bin/sh

display_usage() { 
	echo "Unsupported arguments" 
	echo -e "\nUsage:\n$0 install\n$0 create directoryName\n$0 plugin add pluginName\n$0 plugin remove pluginName"
} 

if [ $# -eq 1 ] && [ $1 == "install" ]; then
#npm install + phonegap install ?
command -v npm >/dev/null && npm install || echo "npm is required but it's not installed" && read -p "Do you want to install npm now ? [y/n]: " RESP
if [[ "$RESP" = "y" || "$RESP" = "yes" ]]; then
  echo "Installing.." #hier npm installieren
else
  echo "without npm the command cannot be executed. Aborting."
  exit 0;
fi

elif [ $# -eq 2 ] && [ $1 == "create" ]; then
if [ -d $2 ]; then
  echo "The directory already exists. Choose another name"
  exit 0
fi
mkdir $2 #ordner hier erstellen
#und templates in die files laden + vorgefertigte files erstellen
cd $2
mkdir controller
mkdir css
cd css
mkdir lib
cd ..
mkdir lib
mkdir resource
cd resource
mkdir icons
mkdir images
cd ..
touch app.html
touch app.js
touch config.js
touch config.xml
curl -sS http://cordova.apache.org/images/cordova_128.png > icon.png

elif [ $# -eq 3 ] && [ $1 == "plugin" ]; then
if [ $2 == "add" ]; then
echo "plugin add operation" #plugin hinzufügen
elif [ $2 == "remove" ]; then
echo "plugin remove operation" #plugin entfernen
else 
display_usage
exit 0
fi

else 
display_usage
exit 0
fi