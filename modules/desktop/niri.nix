{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.desktop.niri ; in {

  options = {
    desktop.niri.enable = lib.mkEnableOption "Enable Niri";
  };

  imports = [
    ./twm.nix
  ];

  config = lib.mkIf cfg.enable {

    desktop.twm.enable = true;

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
