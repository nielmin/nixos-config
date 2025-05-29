{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.twm.programs; in {

  options = {
    home.twm.programs.enable = lib.mkEnableOption "Enable TWM user programs";
  };

  config = lib.mkIf cfg.enable {
    programs = {
      fuzzel = {
        enable = true;
        settings = {
          colors.background = "090E13FF";
          colors.text = "C5C9C7FF";
          colors.match = "938aa9ff";
          colors.selection-match = "938aa9ff";
          colors.selection = "393B42FF";
          colors.selection-text = "C5C9C7FF";
          colors.border = "c4746eff";
        };
      };
      eww = {
        enable = true;
      };
    };
  };
}
