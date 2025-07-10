# Desktop control related system packages
gum log --level info "Installing desktop control related system packages..."
_ yay -S --noconfirm --needed brightnessctl playerctl pamixer pavucontrol wireplumber     \
  fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool wl-clip-persist clipse-bin

# Common desktop apps
gum log --level info "Installing common desktop apps..."
_ yay -S --noconfirm --needed nautilus sushi ffmpegthumbnailer gnome-calculator chromium   \
  chromium mpv evince imv localsend-bin 1password-beta 1password-cli

# Use dark mode for QT apps
gum log --level info "Installing dark mode for QT apps..."
_ sudo pacman -S --noconfirm kvantum-qt5

# Install Gnome theme
gum log --level info "Installing Gnome theme..."
_ sudo pacman -S --noconfirm gnome-themes-extra
_ gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
_ gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"