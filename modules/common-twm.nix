{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.pkgs.twm; in {

  options = {
    pkgs.twm.enable = lib.mkEnableOption "Enable common TWM pkgs";
  };

  config = lib.mkIf cfg.enable {
    fonts.packages = with pkgs; [
      adwaita-fonts
      font-awesome
    ];

    environment.systemPackages = with pkgs; [
      waybar
      fuzzel 
      nwg-look
      brightnessctl
      fnott
      wlogout
      swaylock
      playerctl
      grim
      slurp
      wl-clipboard
      libnotify
      adwaita-icon-theme
      morewaita-icon-theme
      bibata-cursors
    ];

    security.polkit.enable = true;

    security.pam.services.swaylock = {};

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
