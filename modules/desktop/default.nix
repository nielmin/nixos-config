{ config, ... }:
{
  flake.modules = {
    nixos.desktop.imports = with config.flake.modules.nixos; [
      plasma
      firefox
      sound
      niri
    ];

    homeManager.desktop.imports = with config.flake.modules.homeManager; [
      alacritty
      media
      keepassxc
      niri
      waybar
    ];
  };
}
