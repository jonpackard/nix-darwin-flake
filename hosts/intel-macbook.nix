# Remember that this is used for GitHub Actions to test builds
{ config, pkgs, lib, home-manager, nur, ... }:

let
  hostname = "Jonathans-MacBook-Pro";
  username = "jonathan";
in {
  imports = [
    ../roles/defaults.nix
    ../roles/brew.nix
    # ../roles/yabai.nix
    ../roles/network.nix
    ../roles/home-manager/settings.nix
  ];
  # Define user settings
  users.users.${username} = import ../roles/user.nix { inherit config; inherit pkgs; };

  # Set home-manager configs for username
  home-manager.users.${username} = import ../roles/home-manager/user.nix;

  # Set hostname
  networking.hostName = "${hostname}";

  system.stateVersion = 4;
}
