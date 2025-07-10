gum log --level info "Installing extra applications..."
yay -S --noconfirm --needed \
  spotify libreoffice pinta 

# Copy over applications
source ~/.charbOS/bin/charbos-sync-applications || true
