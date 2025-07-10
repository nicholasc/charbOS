logo='           /██                           /██        /▄████▄   /▄████▄ 
          | ██                          | ██       /██__  ██ /██__  ██
  /▄█████▄| ██████▄   /▄████▄   /▄████▄ | ██████▄ | ██  \ ██| ██  \__/
 /██_____/| ██__  ██ |____  ██ /██__  ▀█| ██__  ██| ██  | ██|  ▀████▄ 
| ██      | ██  \ ██  /▄██████| ██  \__/| ██  \ ██| ██  | ██ \____  ██
| ██      | ██  | ██ /██__  ██| ██      | ██  | ██| ██  | ██ /██  \ ██
|  ▀█████▀| ██  | ██|  ▀██████| ██      | ██████▀/|  ▀████▀/|  ▀████▀/
 \_______/|__/  |__/ \_______/|__/      |_______/  \______/  \______/ '

echo -e "\n$logo\n"

# Exit on error
set -e
trap 'echo "Error: charbOS failed to install. Please check the logs for more information."' ERR

# Install base-devel, git and gum
sudo pacman -S --noconfirm --needed base-devel git gum > /dev/null 2>&1

# Get user information
gum style --border normal --margin "1" --padding "1 2" --border-foreground 212 "First, let's get some information about $(gum style --foreground 212 'you')."
export CHARBOS_NAME=$(gum input --placeholder "Enter full name" --prompt "Name> ")
export CHARBOS_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

# Clone charbOS
echo -e "\nCloning charbOS..."
rm -rf ~/.charbOS/
git clone https://github.com/nicholasc/charbOS.git ~/.charbOS >/dev/null

# Use custom branch if instructed
if [[ -n "$CHARBOS_BRANCH" ]]; then
  echo -e "\eSelecting branch: $CHARBOS_BRANCH"
  cd ~/.charbOS
  git fetch origin "${CHARBOS_BRANCH}" && git checkout "${CHARBOS_BRANCH}"
  cd -
fi

# YAY to install AUR packages
if ! command -v yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd ~
  rm -rf yay-bin
fi

# Packages to install
packages=("core" "config" "development" "applications")

# install_package(package, items...)
#   - package: The package to install.
#   - item: The item to install.
install_package() {
  local package="$1"
  local items=("${@:2}")

  for item in "${items[@]}"; do
    gum spin --title "Installing $package: $item..." -- source ~/.charbOS/install/$package/$item.sh
  done
}

# Install charbOS
for package in "${packages[@]}"; do
  source ~/.charbOS/install/$package/main.sh
done

# Update plocate database
sudo updatedb

# Reboot
gum confirm "Reboot ?" && reboot
