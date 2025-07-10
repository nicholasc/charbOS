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

# install_package(package, items...)
#   - package: The package to install.
#   - item: The item to install.
install_package() {
  local package="$1"
  local items=("${@:2}")

  for item in "${items[@]}"; do
    echo "\nInstalling $item"
    source "~/.charbOS/install/$package/$item.sh"
  done
}

# Install git
sudo pacman -S --noconfirm --needed git

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

# Packages to install
packages=("core" "config" "development" "applications")

# Install charbOS
echo -e "\nBeginning installation..."
for package in "${packages[@]}"; do
  echo "\nInstalling $package"
  source ~/.charbOS/install/$package/main.sh
done

# Update plocate database
sudo updatedb

# Reboot
gum confirm "Reboot ?" && reboot
