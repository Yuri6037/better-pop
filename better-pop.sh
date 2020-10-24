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

#Install python3-nautilus extension support
sudo apt install python3-nautilus

#Install appimage thumbnailer
TEMP_DEB="$(mktemp)"
wget -O "$TEMP_DEB" 'https://github.com/azubieta/appimage-gnome-thumbnailer/releases/download/0.1.1/appimage-gnome-thumbnailer-0.1.1-gitf25fe7f.x86_64-trusty.deb'
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

#Copy required script to tmp
cp install_light_exclusive.sh /tmp

#Install de-hardcoded theme switcher
cd /tmp
git clone https://github.com/Yuri6037/theme-switcher.git
cd theme-switcher
sudo cp libpop_theme_switcher.so /usr/lib/libpop_theme_switcher.so
echo "libpop-theme-switcher hold" | sudo dpkg --set-selections
sudo cp *.json /usr/share/themes
cd ..
rm -rf theme-switcher

#Install exclusive light theme
bash install_light_exclusive.sh

rm /tmp/install_light_exclusive.sh
