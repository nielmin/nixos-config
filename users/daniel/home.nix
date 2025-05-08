{ pkgs, ... }:

{
  imports = [
    ../../home
    ../../home/programs
    ../../home/shell
    ../../home/gnome
    ../../home/nvim
    ../../home/services
  ];
}
