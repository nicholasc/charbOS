# Docker related packages
gum log --level info "Installing Docker related packages..."
yay -S --noconfirm --needed docker docker-compose lazydocker-bin

# Limit log size to avoid running out of disk
gum log --level info "Limiting Docker log size to avoid running out of disk..."
sudo mkdir -p /etc/docker
echo '{"log-driver":"json-file","log-opts":{"max-size":"10m","max-file":"5"}}' | sudo tee /etc/docker/daemon.json

# Start Docker automatically
gum log --level info "Starting Docker automatically..."
sudo systemctl enable docker

# Give user privileged Docker access
gum log --level info "Giving user privileged Docker access..."
sudo usermod -aG docker ${USER}
