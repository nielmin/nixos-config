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

    home.waybar.enable = true;

    programs = {
      fuzzel = {
        enable = true;
        settings = {
          main = {
            icon-theme = "MoreWaita";
          };
        };
      };
    };
  };
}
