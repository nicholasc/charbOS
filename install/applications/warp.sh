# Install Warp Terminal
gum log --level info "Installing Warp Terminal..."

# Install the package
yay -S --noconfirm --needed warp-terminal-bin

# Copy over the theme
cp -r ~/.charbOS/share/warp-terminal ~/.local/share/warp-terminal