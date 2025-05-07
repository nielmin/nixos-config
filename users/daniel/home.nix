{ pkgs, ... }:

{
  imports = [
    ../../home/core.nix
    ../../home/programs
    ../../home/shell
    ../../home/gnome
    ../../home/nvim
    ../../home/services
  ];
}
