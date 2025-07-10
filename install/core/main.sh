# Install core items from AUR
gum spin --spinner=points --title="Installing core: dependencies..." \
  -- yay -S --noconfirm --needed wget curl unzip inetutils fd eza ripgrep  \
  zoxide bat wl-clipboard fastfetch btop man tldr less whois plocate alacritty nvim      \
  bash-completion

# Install core items
items=("nvidia" "bluetooth" "hyprland" "desktop" "fonts" "mimetypes" "power")
install_package "core" "${items[@]}"
