# Desktop control related system packages
gum log --level info "Installing desktop control related system packages..."
yay -S --noconfirm --needed brightnessctl playerctl pamixer pavucontrol wireplumber     \
  fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool wl-clip-persist clipse-bin

# Common desktop apps
gum log --level info "Installing common desktop apps..."
yay -S --noconfirm --needed nautilus sushi ffmpegthumbnailer gnome-calculator chromium   \
  chromium mpv evince imv localsend-bin

# Use dark mode for QT apps
gum log --level info "Installing dark mode for QT apps..."
sudo pacman -S --noconfirm kvantum-qt5

# Install Gnome theme
gum log --level info "Installing Gnome theme..."
sudo pacman -S --noconfirm gnome-themes-extra

git clone https://github.com/vinceliuice/Orchis-theme.git ~/.orchis
cd ~/.orchis
./install.sh -n charbOS -l -c dark -t yellow --tweaks solid black macos
cd -
rm -rf ~/.orchis

gsettings set org.gnome.desktop.interface gtk-theme "charbOS-Yellow-Dark"
gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"