#          _                _      ____   _____ 
#         | |              | |    / __ \ / ____|
#      ___| |__   __ _ _ __| |__ | |  | | (___  
#     / __| '_ \ / _` | '__| '_ \| |  | |\___ \ 
#    | (__| | | | (_| | |  | |_) | |__| |____) |
#     \___|_| |_|\__,_|_|  |_.__/ \____/|_____/ 
#
{
  description = "A development-centric minimalist NixOS configuration.";

  inputs = {
    nixpkg = { url = "github:nixos/nixpkgs"; };

    # Manage user environment.
    # https://nix-community.github.io/home-manager/
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkg.follows = "nixpkg";
    };

    # Hyprland Window Manager.
    # https://wiki.hyprland.org/
    hyprland = { url: "github:hyprwm/Hyprland"; };
  };

  outputs = inputs@{ self, nixpkg, } : {
  };
}