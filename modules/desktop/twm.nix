{ config, lib, pkgs, catppuccin, ... }:
with lib;

let
  cfg = config.desktop.twm;
in
{
  options = {
    desktop.twm.enable = lib.mkEnableOption "Enable twm pkgs";
  };

  config = lib.mkIf cfg.enable {

    catppuccin.sddm.enable = true;

    services.displayManager.sddm = {
      package = pkgs.kdePackages.sddm;
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
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
