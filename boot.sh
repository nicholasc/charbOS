logo='           /██                           /██        /▄████▄   /▄████▄ 
          | ██                          | ██       /██__  ██ /██__  ██
  /▄█████▄| ██████▄   /▄████▄   /▄████▄ | ██████▄ | ██  \ ██| ██  \__/
 /██_____/| ██__  ██ |____  ██ /██__  ▀█| ██__  ██| ██  | ██|  ▀████▄ 
| ██      | ██  \ ██  /▄██████| ██  \__/| ██  \ ██| ██  | ██ \____  ██
| ██      | ██  | ██ /██__  ██| ██      | ██  | ██| ██  | ██ /██  \ ██
|  ▀█████▀| ██  | ██|  ▀██████| ██      | ██████▀/|  ▀████▀/|  ▀████▀/
 \_______/|__/  |__/ \_______/|__/      |_______/  \______/  \______/ '

echo -e "\n$logo\n"

pacman -Q git &>/dev/null || sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning charbOS..."
rm -rf ~/.local/share/charbOS/
git clone https://github.com/nicholasc/charbOS.git ~/.local/share/charbOS >/dev/null

# Use custom branch if instructed
if [[ -n "$CHARBOS_REF" ]]; then
  echo -e "\eUsing branch: $CHARBOS_REF"
  cd ~/.local/share/charbOS
  git fetch origin "${CHARBOS_REF}" && git checkout "${CHARBOS_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/charbOS/install.sh

