#!/bin/bash
#if [ -d /etc/pacman.d ]; then
  #sudo pacman -S  qt5-3d qt5-base qt5-charts qt5-connectivity qt5-datavis3d qt5-declarative qt5-doc qt5-examples qt5-gamepad qt5-graphicaleffects qt5-imageformats qt5-location qt5-lottie qt5-multimedia qt5-networkauth qt5-purchasing qt5-quick3d qt5-quickcontrols qt5-quickcontrols2 qt5-quicktimeline   qt5-remoteobjects qt5-script qt5-scxml qt5-sensors qt5-serialbus qt5-serialport  qt5-speech  qt5-svg   qt5-tools qt5-translations  qt5-virtualkeyboard  qt5-wayland qt5-webchannel qt5-webengine qt5-webglplugin qt5-websockets qt5-webview qt5-x11extras qt5-xmlpatterns qt5 cmake gcc make devtools
#fi
#if [ -d /etc/apt ]; then
#  sudo apt install qt5-3d qt5-base qt5-charts qt5-connectivity qt5-datavis3d qt5-declarative qt5-doc qt5-examples qt5-gamepad qt5-graphicaleffects qt5-imageformats qt5-location qt5-lottie qt5-multimedia qt5-networkauth qt5-purchasing qt5-quick3d qt5-quickcontrols qt5-quickcontrols2 qt5-quicktimeline   qt5-remoteobjects qt5-script qt5-scxml qt5-sensors qt5-serialbus qt5-serialport  qt5-speech  qt5-svg   qt5-tools qt5-translations  qt5-virtualkeyboard  qt5-wayland qt5-webchannel qt5-webengine qt5-webglplugin qt5-websockets qt5-webview qt5-x11extras qt5-xmlpatterns qt5 cmake gcc make devtools
#fi
#Download Icon
#wget https://icons.iconarchive.com/icons/papirus-team/papirus-apps/256/discord-icon.png

#Begin Building
cmake -B build


#Move Desktop Entry
sudo mv -v Rosary.desktop /usr/share/applications

#Move Icon
sudo mv -v discord-icon.png /opt
#Make project
make --directory=build

#Move Binary to bin directory
sudo mv build/Rosary /usr/bin
