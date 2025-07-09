# Set backgrounds directory
BACKGROUNDS_DIR=~/.local/share/theme/backgrounds/

# download_background_image(url, path)
#   - url:  The URL of the image to download.
#   - path: The filename to save the downloaded image as, inside the BACKGROUNDS_DIR.
download_background_image() {
  local url="$1"
  local path="$2"
  gum spin --title "Downloading $url as $path..." -- curl -sL -o "$BACKGROUNDS_DIR/$path" "$url"
}

# Install theme background images
mkdir -p "$BACKGROUNDS_DIR"
download_background_image "https://github.com/basecamp/omakub/raw/refs/heads/master/themes/gruvbox/background.jpg" "background1.jpg"

# Set initial background
ln -snf ~/.local/share/theme/backgrounds/background1.jpg ~/.local/share/theme/background
