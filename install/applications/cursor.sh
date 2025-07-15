# Install Cursor
gum log --level info "Installing Cursor..."

# Download the AppImage
wget https://os.charbs.dev/apps/Cursor.AppImage

# Move the AppImage to the local bin directory
mv Cursor.AppImage ~/.local/bin/cursor
chmod +x ~/.local/bin/cursor