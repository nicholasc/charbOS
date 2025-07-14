gum log --level info "Installing fonts..."

yay -Sy --noconfirm --needed ttf-font-awesome noto-fonts noto-fonts-emoji noto-fonts-cjk \
  noto-fonts-extra

mkdir -p ~/.local/share/fonts

# FiraCode Nerd Font 
if ! fc-list | grep -qi "FiraCode Nerd Font"; then
  cd /tmp
  wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip
  unzip FiraCode.zip -d FiraCodeFont
  cp FiraCodeFont/FiraCodeNerdFont-Bold.ttf ~/.local/share/fonts/
  cp FiraCodeFont/FiraCodeNerdFont-Light.ttf ~/.local/share/fonts/
  cp FiraCodeFont/FiraCodeNerdFont-Medium.ttf ~/.local/share/fonts/
  cp FiraCodeFont/FiraCodeNerdFont-Regular.ttf ~/.local/share/fonts/
  cp FiraCodeFont/FiraCodeNerdFont-Retina.ttf ~/.local/share/fonts/
  cp FiraCodeFont/FiraCodeNerdFont-SemiBold.ttf ~/.local/share/fonts/
  rm -rf FiraCode.zip FiraCodeFont
  fc-cache
  cd -
fi