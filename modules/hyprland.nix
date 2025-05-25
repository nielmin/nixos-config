{ config, lib, pkgs, ...}:
with lib;

let
  cfg = config.desktop.hyprland; in {

  imports = [
    ./common-twm.nix
  ];

  options ={
    desktop.hyprland.enable = lib.mkEnableOption "Enable Hyprland";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };

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
