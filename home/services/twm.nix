{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.twm.services; in {

  options = {
    home.twm.services.enable = lib.mkEnableOption "Enable TWM user services";
  };

  config = lib.mkIf cfg.enable {
    catppuccin.mako.enable = true;

    services = {
      swayosd = {
        enable = true;
      };
      gammastep = {
        enable = true;
        latitude = 29.4;
        longitude = -98.5;
        temperature = {
          day = 6500;
          night = 4500;
        };
      };
      mako = {
        enable = true;
      };
      kanshi = {
        enable = true;
        systemdTarget = "graphical.target";
        settings = [
          { output.criteria = "eDP-1";
            output.scale = 1.0;
          }
          { profile.name = "undocked";
            profile.outputs = [
              {
                criteria = "eDP-1";
                status = "enable";
              }
            ];
          }
          { profile.name = "docked";
            profile.outputs = [
              {
                criteria = "Acer Technologies XV272U 0x0301BD59";
                status = "enable";
                mode = "2560x1440@120Hz";
                position = "0,0";
                scale = 2.0;
              }
              {
                criteria = "eDP-1";
                status = "disable";
              }
            ];
          }
        ];
      };
    };
  };
}
