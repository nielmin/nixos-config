{ config, lib, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    nwg-look
    papirus-icon-theme
    phinger-cursors
    rose-pine-gtk-theme
  ];
}
