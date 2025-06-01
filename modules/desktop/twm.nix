{ config, lib, pkgs, iwmenu, bzmenu, ... }:
with lib;

let
  cfg = config.desktop.twm; in {

  options = {
    desktop.twm.enable = lib.mkEnableOption "Enable twm pkgs";
  };

  config = lib.mkIf cfg.enable {
    programs.uwsm = {
      enable = true;
      waylandCompositors = {
        sway = {
          prettyName = "Sway";
          comment = "Sway compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/sway";
        };
      };
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks";
        };
      };
    };

    fonts.packages = with pkgs; [
      adwaita-fonts
      font-awesome
    ];

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      bibata-cursors
      brightnessctl
      fnott
      fuzzel 
      grim
      libnotify
      morewaita-icon-theme
      nwg-look
      playerctl
      slurp
      sonusmix
      swaylock
      waybar
      wl-clipboard
      wleave
    ];

    security.polkit.enable = true;

    security.pam.services.swaylock = {};

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
