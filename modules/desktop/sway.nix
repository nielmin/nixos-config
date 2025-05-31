{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.desktop.sway; in {

  options = {
    desktop.sway.enable = lib.mkEnableOption "Enable Sway";
  };

  imports = [
    ./twm.nix
  ];

  config = lib.mkIf cfg.enable {

    desktop.twm.enable = true;

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };

    services.gnome.gnome-keyring.enable = true;

    environment.systemPackages = with pkgs; [
      grim
      slurp
      mako
    ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    xdg.portal.config.common.default = "*";

  };
}
