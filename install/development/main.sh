# Development related packages
gum spin --spinner=points --title="Installing development: dependencies..." \
  -- yay -S --noconfirm --needed cargo clang llvm nvm

# Install development items
items=("docker")
install_package "development" "${items[@]}"