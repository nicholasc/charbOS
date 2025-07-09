# Hyprland related packages
yay -S --noconfirm --needed hyprland hyprshot hyprpicker hyprlock hypridle               \
  hyprpolkitagent hyprland-qtutils wofi waybar mako swaybg xdg-desktop-portal-hyprland   \
  xdg-desktop-portal-gtk

# Autostart Hyprland on user session
echo "[[ -z \$DISPLAY && \$(tty) == /dev/tty1 ]] && exec Hyprland" >~/.bash_profile