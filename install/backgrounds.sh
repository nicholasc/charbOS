BACKGROUNDS_DIR=~/.config/theme/backgrounds/

download_background_image() {
  local url="$1"
  local path="$2"
  gum spin --title "Downloading $url as $path..." -- curl -sL -o "$BACKGROUNDS_DIR/$path" "$url"
}

mkdir -p "$BACKGROUNDS_DIR"

source "$BACKGROUNDS_DIR/backgrounds.sh"; done
