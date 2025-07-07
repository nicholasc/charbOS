# Exit on error
set -e
trap 'echo "Error: $?"' ERR

# Need gum to query for input
yay -S --noconfirm --needed gum

# Install all scripts in the install directory
for f in ~/.local/share/charbOS/install/*.sh; do
    echo "\nInstalling $f"
    source "$f"
done

# Ensure locate is up to date now that everything has been installed
sudo updatedb

gum confirm "Reboot ?" && reboot
