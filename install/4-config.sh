# Copy configs
cp -R ~/.local/share/charbOS/config/* ~/.config/

# Ensure application directory exists for update-desktop-database
mkdir -p ~/.local/share/applications

# Use default bashrc 
echo "source ~/.local/share/charbOS/default/bash/rc" >~/.bashrc

# Set default XCompose 
tee ~/.XCompose >/dev/null <<EOF
include "%H/.local/share/charbOS/default/xcompose"

# Identification
<Multi_key> <space> <n> : "$CHARBOS_USER_NAME"
<Multi_key> <space> <e> : "$CHARBOS_USER_EMAIL"
EOF
