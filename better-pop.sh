#!/bin/bash

# Copyright 2020 Yuri6037
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#Make PopOS a better OS

#Enable minimize button
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,close'

#Install python3-nautilus extension support
sudo apt install python3-nautilus

#Install appimage thumbnailer
TEMP_DEB="$(mktemp)"
wget -O "$TEMP_DEB" 'https://github.com/azubieta/appimage-gnome-thumbnailer/releases/download/0.1.1/appimage-gnome-thumbnailer-0.1.1-gitf25fe7f.x86_64-trusty.deb'
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

#Install some basic extensions
sudo apt install gnome-shell-extensions gnome-shell-extension-dashtodock

#Install proper styling for dash to dock
sudo cp stylesheet.css /usr/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/

#Install arc menu extension
cp arcmenuarcmenu.com.v5.shell-extension.zip /tmp
cd /tmp
sudo mkdir /usr/share/gnome-shell/extensions/arcmenu@arcmenu.com
sudo unzip arcmenuarcmenu.com.v5.shell-extension.zip -d /usr/share/gnome-shell/extensions/arcmenu@arcmenu.com
sudo chmod -R 755 /usr/share/gnome-shell/extensions/arcmenu@arcmenu.com
cd -

#Install hide minimized extension
cp hide-minimizeddanigm.net.v2.shell-extension.zip /tmp
cd /tmp
sudo mkdir /usr/share/gnome-shell/extensions/hide-minimized@danigm.net
sudo unzip hide-minimizeddanigm.net.v2.shell-extension.zip -d /usr/share/gnome-shell/extensions/hide-minimized@danigm.net
sudo chmod -R 755 /usr/share/gnome-shell/extensions/hide-minimized@danigm.net
cd -

#Install the Tweaks System Menu to integrate Tweaks with the system
cd /tmp
wget https://github.com/F-i-f/tweaks-system-menu/releases/latest/download/tweaks-system-menu@extensions.gnome-shell.fifi.org.v11.shell-extension.zip
sudo unzip tweaks-system-menu@extensions.gnome-shell.fifi.org.v11.shell-extension.zip -d /usr/share/gnome-shell/extensions/tweaks-system-menu@extensions.gnome-shell.fifi.org
sudo chmod -R 755 /usr/share/gnome-shell/extensions/tweaks-system-menu@extensions.gnome-shell.fifi.org

#Install the Extensions System Menu to integrate Extensions with the system
cd /tmp
wget https://github.com/Leleat/extensions-in-system-menu/archive/master.zip
unzip master.zip
sudo cp -r extensions-in-system-menu-master/extensions-in-system-menu@leleat-on-github /usr/share/gnome-shell/extensions
rm -rf extensions-in-system-menu-master

#Restart gnome shell
killall -3 gnome-shell

#Install gnome tweaks
sudo apt install gnome-tweaks

#Install the GNOME extensions app for all users
sudo apt install gnome-shell-extension-prefs

#Enable some basic extensions
#gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
#gnome-extensions enable tweaks-system-menu@extensions.gnome-shell.fifi.org.v11.shell-extension

#Install rythmbox as default media player (GNOME Music is a peace of shit unable to read a fucking audio CD)
sudo add-apt-repository ppa:ubuntuhandbook1/apps
sudo apt update
sudo apt install rhythmbox
sudo apt autoremove --purge gnome-music

#Pre-install the repeat-one-song plugin
#cd /tmp
#git clone https://github.com/edumucelli/repeat-one-song.git
#mkdir ~/.local/share/rhythmbox
#mkdir ~/.local/share/rhythmbox/plugins
#mkdir ~/.local/share/rhythmbox/plugins/repeat-one-song
#mv repeat-one-song/README.md ~/.local/share/rhythmbox/plugins/repeat-one-song
#mv repeat-one-song/*.png ~/.local/share/rhythmbox/plugins/repeat-one-song
#mv repeat-one-song/icon.svg ~/.local/share/rhythmbox/plugins/repeat-one-song
#mv repeat-one-song/repeat* ~/.local/share/rhythmbox/plugins/repeat-one-song
#cd ~
#rm -rf /tmp/repeat-one-song
