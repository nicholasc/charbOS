# Basic tools and Arch Linux packages
yay -S --noconfirm --needed base-devel gum wget curl unzip inetutils fd eza ripgrep  \
  zoxide bat wl-clipboard fastfetch btop man tldr less whois plocate alacritty nvim      \
  bash-completion



# YAY to install AUR packages
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ~
  rm -rf yay-bin
fi

# Configure identification
echo -e "\nConfiguring identification..."
export CHARBOS_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export CHARBOS_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

# Install core items
items=("power" "nvidia" "bluetooth" "hyprland" "desktop" "fonts" "mimetypes")
install_package "core" $items
