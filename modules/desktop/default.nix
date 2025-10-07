{ config, ... }:
{
  flake.modules = {
    nixos.desktop.imports = with config.flake.modules.nixos; [
      firefox
      sound
    ];

    homeManager.desktop.imports = with config.flake.modules.homeManager; [
      alacritty
      hyprland
      media
      sway
      syncthing
      keepassxc
      waybar
    ];
  };
}
