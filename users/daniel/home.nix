{ config, pkgs, lib, systemConfig, username, catppuccin, ... }:

{
  imports = [
    ../../home
    ../../home/programs
    ../../home/shell
    ../../home/desktop
    ../../home/neovim
    ../../home/services
    ../../home/waybar
    catppuccin.homeModules.catppuccin
  ];

  home.gnome.enable = systemConfig.desktop.gnome.enable or false; 
  home.hyprland.enable = systemConfig.desktop.hyprland.enable or false;
  home.sway.enable = systemConfig.desktop.sway.enable or false;
}
