{ pkgs, nvf, ... }:

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
}
