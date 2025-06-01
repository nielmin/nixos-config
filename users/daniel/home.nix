{ config, pkgs, lib, nvf, systemConfig, username, ... }:

{
  imports = [
    ../../home
    ../../home/programs
    ../../home/shell
    ../../home/gnome
    ../../home/neovim
    ../../home/nvf
    ../../home/services
    ../../home/hyprland
    ../../home/sway

    nvf.homeManagerModules.default
  ];

  nvf.enable = false;
  home.gnome.enable = systemConfig.desktop.gnome.enable or false; 
  home.hyprland.enable = systemConfig.desktop.hyprland.enable or false;
  home.sway.enable = systemConfig.desktop.sway.enable or false;
}
