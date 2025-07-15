# Create a directory for local binaries
mkdir -p ~/.local/bin

# Install applications
items=("cursor" "webapps" "xtras")
install_package "applications" "${items[@]}"