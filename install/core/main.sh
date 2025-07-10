# Install core items from AUR
yay -S --noconfirm --needed gum wget curl unzip inetutils fd eza ripgrep  \
  zoxide bat wl-clipboard fastfetch btop man tldr less whois plocate alacritty nvim      \
  bash-completion

# Configure identification
echo -e "\nConfiguring identification..."
export CHARBOS_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export CHARBOS_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

# Install core items
items=("nvidia" "bluetooth" "hyprland" "desktop" "fonts" "mimetypes" "power")
install_package "core" $items
