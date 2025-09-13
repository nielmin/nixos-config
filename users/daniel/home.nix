{ catppuccin, ... }:

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
}
