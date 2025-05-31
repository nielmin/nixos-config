{ config, lib, pkgs, iwmenu, bzmenu, ... }:
with lib;

let
  cfg = config.desktop.twm; in {

  options = {
    desktop.twm.enable = lib.mkEnableOption "Enable twm pkgs";
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

      iwmenu.packages.${pkgs.system}.default
      bzmenu.packages.${pkgs.system}.default
    ];

    security.polkit.enable = true;

    security.pam.services.swaylock = {};

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
