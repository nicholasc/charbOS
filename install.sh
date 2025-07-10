logo='           /██                           /██        /▄████▄   /▄████▄ 
          | ██                          | ██       /██__  ██ /██__  ██
  /▄█████▄| ██████▄   /▄████▄   /▄████▄ | ██████▄ | ██  \ ██| ██  \__/
 /██_____/| ██__  ██ |____  ██ /██__  ▀█| ██__  ██| ██  | ██|  ▀████▄ 
| ██      | ██  \ ██  /▄██████| ██  \__/| ██  \ ██| ██  | ██ \____  ██
| ██      | ██  | ██ /██__  ██| ██      | ██  | ██| ██  | ██ /██  \ ██
|  ▀█████▀| ██  | ██|  ▀██████| ██      | ██████▀/|  ▀████▀/|  ▀████▀/
 \_______/|__/  |__/ \_______/|__/      |_______/  \______/  \______/ '

# Exit on error
set -e

# Print logo
echo -e "\n$logo\n"

# Install gum in the background
if ! command -v gum &>/dev/null; then
  sudo pacman -S --noconfirm --needed gum &>/dev/null && wait $!
fi

# Exit on error
trap 'gum log --level error "Error: charbOS failed to install. Please check the logs for more information."' ERR

# Run a command silently
_() { "$@" &>/dev/null && wait $!; }

# Print message
gum log --level info "Ready to install charbOS!"

# Get user information
gum style --bold --foreground 2 "Identify yourself."
export CHARBOS_NAME=$(gum input --placeholder "Enter full name" --prompt "Name: ")
export CHARBOS_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email: ")

# Clone charbOS
gum log --level info "Cloning charbOS..."

# Install dependencies
_ sudo pacman -S --noconfirm --needed git

rm -rf ~/.charbOS/
_ git clone -q https://github.com/nicholasc/charbOS.git ~/.charbOS

# Use custom branch if instructed
if [[ -n "$CHARBOS_BRANCH" ]]; then
  gum log --level info "Selecting branch: $CHARBOS_BRANCH"
  cd ~/.charbOS
  git fetch origin "${CHARBOS_BRANCH}" && git checkout "${CHARBOS_BRANCH}"
  cd -
fi

# YAY to install AUR packages
if ! command -v yay &>/dev/null; then
  gum log --level info "Building yay from source..."

  _ git clone https://aur.archlinux.org/yay-bin.git

  cd yay-bin
  _ makepkg -si --noconfirm

  cd ~
  rm -rf yay-bin
fi

# install_package(package, items...)
#   - package: The package to install.
#   - item: The item to install.
install_package() {
  local package="$1"
  local items=("${@:2}")

  for item in "${items[@]}"; do
    source ~/.charbOS/install/$package/$item.sh
  done
}

# Install charbOS packages
packages=("core" "config" "development" "applications")
for package in "${packages[@]}"; do
  source ~/.charbOS/install/$package/main.sh
done

# Update plocate database
_ sudo updatedb

# Reboot
gum confirm "Install complete! Reboot ?" && reboot
