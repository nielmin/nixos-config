{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.hyprland.services; in {

  options = {
    home.hyprland.services.enable = lib.mkEnableOption "Enable Hyprland user services";
  };

  config = lib.mkIf cfg.enable {
    services = {
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
      fnott = {
        enable = true;
        settings = {

          main = {
            min-width = 0;
            max-width = 440;
            max-height = 0;
            stacking-order = "bottom-up";
            anchor = "top-right";
            edge-margin-vertical = 10;
            edge-margin-horizontal = 10;
            notification-margin = 10;
            icon-theme = "Papirus-Dark";
            max-icon-size = 36;

            layer = "overlay";
            background = "100F0Fff";
            border-color = "282726ff";
            border-radius = 0;
            border-size = 1;

            padding-vertical = 15;
            padding-horizontal = 15;
            dpi-aware = "no";

            title-font = "JetBrainsMono Nerd Font Regular:pixelsize=14";
            title-color = "24837Bff";
            title-format = "%a%A";

            summary-font = "JetBrainsMono Nerd Font Regular:pixelsize=14";
            summary-color = "FFFCF0ff";
            summary-format = "<b>%s</b>";

            body-font = "JetBrainsMono Nerd Font Regular:pixelsize=14";
            body-color = "CECDC3ff";
            body-format = "%b";

            progress-bar-height = 20;
            progress-bar-color = "CECDC3ff";

            max-timeout = 0;
            default-timeout = 0;
            idle-timeout = 0;
          };

          critical = {
            border-color = "A02F6Fff";
            title-color = "A02F6Fff";
            body-color = "ffffffff";
            summary-color = "AD8301ff";
            background = "000000ff";
          };
        };
      };
    };
  };
}
