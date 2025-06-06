{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.twm.programs; in {

  options = {
    home.twm.programs.enable = lib.mkEnableOption "Enable TWM user programs";
  };

  imports = [
    ../waybar
  ];

  config = lib.mkIf cfg.enable {
    catppuccin.fuzzel.enable = true;
    catppuccin.waybar.enable = true;
    catppuccin.wlogout.enable = true;

    home.waybar.enable = true;

    programs = {

      wlogout = {
        enable = true;
      };

      swaylock = {
        enable = true;
      };

      fuzzel = {
        enable = true;
        settings = {
          main = {
            font = "Adwaita Sans:size=12";
            icons-enabled = "no";
          };
        };
      };
    };
  };
}
