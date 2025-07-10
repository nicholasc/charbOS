# Development related packages
gum log --level info "Installing development related packages..."
_ yay -S --noconfirm --needed cargo clang llvm nvm

# Install development items
items=("docker")
install_package "development" "${items[@]}"