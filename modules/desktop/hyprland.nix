{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.desktop.hyprland; in {

  options = {
    desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };

  imports = [
    ./twm.nix
  ];

  config = lib.mkIf cfg.enable {

    desktop.twm.enable = true;

    programs.hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

    programs.thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };

    programs.xfconf.enable = true;

    services.gvfs.enable = true;
    services.tumbler.enable = true;

    environment.systemPackages = with pkgs; [
      hyprpaper
      hypridle
      hyprsunset
      hyprlock
    ];

    xdg.portal.enable = true;
    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    xdg.portal.config.common.default = "*";
  };
}
