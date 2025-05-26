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

    nvf.homeManagerModules.default
  ];

  nvf.enable = false;
  home.gnome.enable = systemConfig.desktop.gnome.enable or false; 
}
