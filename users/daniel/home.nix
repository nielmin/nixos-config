{ pkgs, nvf, ... }:

{
  imports = [
    ../../home
    ../../home/programs
    ../../home/shell
    ../../home/gnome
    #../../home/nvim
    ../../home/nvf
    ../../home/services

    nvf.homeManagerModules.default
  ];

}
