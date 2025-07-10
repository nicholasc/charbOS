# charbOS

A modern, customizable Linux desktop environment built on Arch Linux with Hyprland, featuring a complete setup script and curated configuration.

![charbOS Logo](https://img.shields.io/badge/charbOS-Desktop%20Environment-blue?style=for-the-badge&logo=archlinux)

## 🚀 Features

- **Hyprland-based**: Modern Wayland compositor with smooth animations and tiling
- **One-command installation**: Automated setup script for complete desktop environment
- **Curated applications**: Pre-configured essential tools and development environment
- **Custom keybindings**: Intuitive keyboard shortcuts for productivity
- **Web app integration**: Easy creation of desktop apps from web services
- **Power management**: Built-in power menu and system controls
- **Notification system**: Mako notifications with do-not-disturb mode
- **Custom scripts**: Utility scripts for common tasks

## 📋 Prerequisites

- Arch Linux (or Arch-based distribution)
- Internet connection
- Sudo privileges
- Git

## 🛠️ Installation

### Quick Install

```bash
curl -sSL https://raw.githubusercontent.com/nicholasc/charbOS/main/install.sh | bash
```

### Manual Install

1. Clone the repository:
```bash
git clone https://github.com/nicholasc/charbOS.git ~/.charbOS
cd ~/.charbOS
```

2. Run the installation script:
```bash
./install.sh
```

3. Follow the prompts to enter your name and email
4. The script will automatically install all dependencies and configurations
5. Reboot when prompted

## 🎯 What Gets Installed

### Core System
- **Hyprland**: Wayland compositor with tiling
- **Waybar**: Status bar with workspace indicators
- **Wofi**: Application launcher
- **Mako**: Notification daemon
- **Hyprlock**: Screen locker
- **Hypridle**: Idle management

### Essential Tools
- **Alacritty**: Fast terminal emulator
- **Neovim**: Modern text editor
- **Btop**: System monitor
- **Fastfetch**: System information
- **Ripgrep**: Fast file search
- **Fd**: Alternative to find
- **Eza**: Modern ls replacement
- **Bat**: Better cat with syntax highlighting

### Development Environment
- **Cargo**: Rust package manager
- **Clang/LLVM**: C/C++ compiler
- **NVM**: Node.js version manager
- **Docker**: Container platform

### Applications
- **Chromium**: Web browser
- **Spotify**: Music streaming
- **1Password**: Password manager
- **Nautilus**: File manager

## ⌨️ Keybindings

### Application Launchers
- `SUPER + Return` - Terminal
- `SUPER + F` - File manager
- `SUPER + B` - Browser
- `SUPER + M` - Music player
- `SUPER + Space` - Application launcher
- `SUPER + /` - Password manager

### System Controls
- `SUPER + Escape` - Lock screen
- `SUPER + Shift + Escape` - Suspend
- `SUPER + Alt + Escape` - Logout
- `SUPER + Ctrl + Escape` - Reboot
- `SUPER + Shift + Ctrl + Escape` - Power off

### Window Management
- `SUPER + W` - Close active window
- `SUPER + V` - Toggle floating
- `SUPER + J` - Toggle split
- `SUPER + Arrow Keys` - Move focus
- `SUPER + Shift + Arrow Keys` - Move window
- `SUPER + 1-10` - Switch workspaces
- `SUPER + Shift + 1-10` - Move window to workspace

### Screenshots
- `Print` - Region screenshot
- `Shift + Print` - Window screenshot
- `Ctrl + Print` - Full screen screenshot
- `SUPER + Print` - Color picker

### View All Keybindings
- `SUPER + K` - Show all keybindings in a searchable menu

## 🎨 Customization

### Configuration Files
- `~/.config/hypr/hyprland.conf` - Main Hyprland configuration
- `~/.config/waybar/config` - Status bar configuration
- `~/.config/waybar/style.css` - Status bar styling
- `~/.config/wofi/config` - Application launcher configuration
- `~/.config/wofi/style.css` - Application launcher styling

### Monitor Setup
Edit `~/.config/hypr/monitors.conf` to configure your display setup.

### Theme
The default theme uses a warm color scheme. Customize colors in the Hyprland configuration files.

## 🌐 Web Apps

Create desktop applications from web services using the `web2app` function:

```bash
web2app "WhatsApp" "https://web.whatsapp.com/" "https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/whatsapp.png"
```

### Remove Web Apps
```bash
web2app-remove "AppName"
```

## 🛠️ Utility Scripts

### Available Commands
- `charbos-show-keybindings` - Display all keybindings
- `charbos-power-menu` - Power management menu
- `charbos-refresh-waybar` - Reload status bar
- `charbos-config-link` - Link configuration files
- `charbos-sync-applications` - Sync application shortcuts
- `swaybg-next` - Next wallpaper

## 📁 Project Structure

```
charbOS/
├── bin/                    # Utility scripts
├── config/                 # Configuration templates
│   ├── hypr/              # Hyprland configuration
│   ├── waybar/            # Status bar configuration
│   ├── wofi/              # Application launcher
│   └── mako/              # Notifications
├── default/               # Default configurations
│   ├── hypr/              # Hyprland defaults
│   └── bash/              # Bash configuration
├── install/               # Installation scripts
│   ├── core/              # Core system packages
│   ├── applications/      # Application packages
│   ├── development/       # Development tools
│   └── config/            # Configuration setup
└── share/                 # Shared resources
    ├── applications/      # Desktop files
    └── icons/             # Application icons
```

## 🔧 Troubleshooting

### Common Issues

1. **Hyprland not starting**: Ensure you have a compatible graphics driver installed
2. **Applications not found**: Run `sudo updatedb` to update the locate database
3. **Keybindings not working**: Check if the configuration files are properly linked
4. **Display issues**: Configure your monitors in `~/.config/hypr/monitors.conf`

### Logs
- Hyprland logs: `journalctl --user -u hyprland`
- System logs: `journalctl -xe`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [Hyprland](https://hyprland.org/) - The amazing Wayland compositor
- [Arch Linux](https://archlinux.org/) - The base distribution
- [Waybar](https://github.com/Alexays/Waybar) - Status bar
- [Wofi](https://hg.sr.ht/~scoopta/wofi) - Application launcher

## 📞 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/nicholasc/charbOS/issues) page
2. Create a new issue with detailed information
3. Include your system information and error logs

---

**Enjoy your new charbOS desktop environment! 🎉** 