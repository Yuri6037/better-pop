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

#Install requirements
sudo apt install sassc

#Download and inject OSX theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
export LIB_INSTALL_IMPORTED="true"
./install.sh -i void -p 30 -c light -N mojave
sudo ./tweaks.sh -g -c light

#Align system to use theme
sudo mkdir /etc/skel/.themes
sudo cp -r ~/.themes/WhiteSur-* /etc/skel/.themes/
sudo mkdir /etc/skel/.local
sudo mkdir /etc/skel/.local/share
sudo mkdir /etc/skel/.local/share/icons
sudo cp -r ~/.local/share/icons/WhiteSur* /etc/skel/.local/share/icons/

#Inject flatpak
sudo flatpak override --filesystem=~/.themes
flatpak override --user --filesystem=~/.themes

#Cleanup
sudo rm -rf /usr/share/themes/WhiteSur*
cd ..
rm -rf WhiteSur-gtk-theme

#Uninstall requirements
sudo apt purge sassc imagemagick libxml2-utils dialog libglib2.0-dev-bin imagemagick-6-common imagemagick-6.q16
sudo apt autoremove --purge
