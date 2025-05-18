{ config, lib, pkgs, ...}:
with lib;

let
  cfg = config.desktop.niri ; in {
  
  options = {
    desktop.niri.enable = lib.mkEnableOption "Enable Niri";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      niri
      fuzzel
    ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
