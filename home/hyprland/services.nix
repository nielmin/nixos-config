{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.hyprland.services; in {

  options = {
    home.hyprland.services.enable = lib.mkEnableOption "Enable Hyprland user services";
  };

  config = lib.mkIf cfg.enable {
    services = {
      hypridle = {
        enable = true;
        settings = {
           general = {
            after_sleep_cmd = "hyprctl dispatch dpms on";
            ignore_dbus_inhibit = false;
            lock_cmd = "hyprlock";
          };

          listener = [
            {
              timeout = 900;
              on-timeout = "hyprlock";
            }
            {
              timeout = 1200;
              on-timeout = "hyprctl dispatch dpms off";
              on-resume = "hyprctl dispatch dpms on";
            }
          ];
        };
      };
      hyprpaper = {
        enable = true;
        settings = {
          preload = [ "~/nixos-config/wallpapers/slavic-town.jpg" ];
          wallpaper = [ ",~/nixos-config/wallpapers/slavic-town.jpg" ];
        };
      };
      hyprsunset = {
        enable = true;
        transitions = {
          sunrise = {
            calendar = "*-*-* 06:00:00";
            requests = [
              [ "temperature" "6500" ]
            ];
          };
          sunset = {
            calendar = "*-*-* 19:00:00";
            requests = [
              [ "temperature" "3500" ]
            ];
          };
        };
      };
    };
  };
}
