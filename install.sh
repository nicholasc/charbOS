set -e

trap 'echo "Error: $?"' ERR

for f in ~/.local/share/charbOS/install/*.sh; do
    echo "\nInstalling $f"
    source "$f"
done