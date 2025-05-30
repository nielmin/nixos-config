{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.hyprland.services; in {

  options = {
    home.hyprland.services.enable = lib.mkEnableOption "Enable Hyprland user services";
  };

  config = lib.mkIf cfg.enable {
    services = {
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
