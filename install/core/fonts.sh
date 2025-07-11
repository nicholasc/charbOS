gum log --level info "Installing fonts..."

yay -Sy --noconfirm --needed ttf-font-awesome ttf-fira-code noto-fonts noto-fonts-emoji \
  noto-fonts-cjk noto-fonts-extra

mkdir -p ~/.local/share/fonts

if ! fc-list | grep -qi "iA Writer Mono S"; then
  gum log --level info "Installing iA Writer Mono S..."
  cd /tmp
  wget -O iafonts.zip https://github.com/iaolo/iA-Fonts/archive/refs/heads/master.zip
  unzip iafonts.zip -d iaFonts
  cp iaFonts/iA-Fonts-master/iA\ Writer\ Mono/Static/iAWriterMonoS-*.ttf ~/.local/share/fonts
  rm -rf iafonts.zip iaFonts
  fc-cache
  cd -
fi
