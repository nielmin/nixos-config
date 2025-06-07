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
        hyprland = {
          prettyName = "Hyprland";
          comment = "Hyprland compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/Hyprland";
        };
        niri = {
          prettyName = "Niri";
          comment = "Niri compositor managed by UWSM";
          binPath = "/run/current-system/sw/bin/niri-session";
        };
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
    services.tlp = {
        enable = true;
        settings = {
          START_CHARGE_THRESH_BAT0 = 60;
          STOP_CHARGE_THRESH_BAT0 = 85;

          START_CHARGE_THRESH_BAT1 = 60;
          STOP_CHARGE_THRESH_BAT1 = 85;
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
      fuzzel 
      grim
      libnotify
      mako
      morewaita-icon-theme
      nwg-look
      playerctl
      slurp
      sonusmix
      swaylock
      swayidle
      swaybg
      waybar
      wl-clipboard
      wlogout
    ];

    security = {
      polkit.enable = true;
      pam.services = {
        hyprland = {};
        swaylock = {};
      };
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
