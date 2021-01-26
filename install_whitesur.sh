#Install requirements
sudo apt install sassc

#Download and inject OSX theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git
cd WhiteSur-gtk-theme
./install.sh -i void -p 25 -c light --nautilus-use-colors
sudo ./install.sh -g -c light

#Inject flatpak
sudo flatpak override --filesystem=~/.themes
flatpak override --user --filesystem=~/.themes

#Cleanup
sudo rm -rf /usr/share/themes/WhiteSur*
cd ..
rm -rf WhiteSur-gtk-theme

#Uninstall requirements
sudo apt purge sassc
