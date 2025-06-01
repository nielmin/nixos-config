{ config, pkgs, lib, ironbar , systemConfig, username, ... }:

{
  imports = [
    ../../home
    ../../home/programs
    ../../home/shell
    ../../home/gnome
    ../../home/neovim
    ../../home/services
    ../../home/hyprland
    ../../home/sway
    ironbar.homeManagerModules.default
  ];

  home.gnome.enable = systemConfig.desktop.gnome.enable or false; 
  home.hyprland.enable = systemConfig.desktop.hyprland.enable or false;
  home.sway.enable = systemConfig.desktop.sway.enable or false;
}
