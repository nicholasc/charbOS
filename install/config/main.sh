# Copy configs
cp -R ~/.charbOS/config/* ~/.config/

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Use default bashrc
echo "source ~/.charbOS/default/bash/rc" >~/.bashrc

# Login directly as user, rely on disk encryption + hyprlock for security
sudo mkdir -p /etc/systemd/system/getty@tty1.service.d
sudo tee /etc/systemd/system/getty@tty1.service.d/override.conf >/dev/null <<EOF
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty --autologin $USER --noclear %I \$TERM
EOF

# Set default XCompose 
tee ~/.XCompose >/dev/null <<EOF
include "%H/.charbOS/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$CHARBOS_NAME"
<Multi_key> <space> <e> : "$CHARBOS_EMAIL"
EOF

# Install config items
items=("git" "theme")
install_package "config" "${items[@]}"