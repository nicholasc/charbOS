# Install bluetooth controls
gum log --level info "Installing bluetooth controls..."
_ yay -S --noconfirm --needed blueberry

# Turn on bluetooth by default
gum log --level info "Turning on bluetooth by default..."
_ sudo systemctl enable --now bluetooth.kervice