# Install bluetooth controls
gum log --level info "Installing bluetooth controls..."
yay -S --noconfirm --needed blueberry

# Turn on bluetooth by default
gum log --level info "Turning on bluetooth by default..."
sudo systemctl enable --now bluetooth.service