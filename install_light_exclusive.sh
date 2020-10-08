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

cd /tmp

#Install requirements
sudo apt install sassc ninja-build meson

#Download
git clone https://github.com/Yuri6037/Pop-full-light

#Run system-wide install
cd Pop-full-light
mkdir build
cd build
meson ..
sudo ninja install
cd ..

#Run flatpak system-wide install
cd flatpak/org.gtk.Gtk3theme.Pop-full-light
sudo flatpak install org.gtk.Gtk3theme.Pop-full-light.flatpak
cd ../../

#Cleanup
cd ..
sudo rm -rf Pop-full-light

#Uninstall requirements
sudo apt purge sassc ninja-build meson

