{ config, lib, pkgs, ...}:
with lib;

let
  cfg = config.desktop.niri ; in {

  imports = [
    ./common-twm.nix
  ];
  
  options = {
    desktop.niri.enable = lib.mkEnableOption "Enable Niri";
  };

  config = lib.mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      nautilus
      niri
    ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    xdg.portal.config.common.default = "*";
  };
}
