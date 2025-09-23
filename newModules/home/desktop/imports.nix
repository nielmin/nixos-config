{ config, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    alacritty
    hyprland
    media
    sway
    syncthing
    keepassxc
    waybar
  ];
}
