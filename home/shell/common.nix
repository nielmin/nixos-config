{ lib, pkgs, ... }:

{
  catppuccin.btop.enable = true;

  programs.btop = {
    enable = true;
  };
}
