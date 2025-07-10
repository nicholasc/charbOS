# Development related packages
yay -S --noconfirm --needed cargo clang llvm nvm

# Install development items
items=("docker")
install_package "development" "${items[@]}"