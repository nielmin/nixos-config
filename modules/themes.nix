{ config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    phinger-cursors
    tokyonight-gtk-theme
  ];
}
