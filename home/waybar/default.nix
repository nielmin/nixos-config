{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.waybar; in {

  options = {
    home.waybar.enable = lib.mkEnableOption "Enable waybar";
  };

  imports = [
    ./config.nix
    ./style.nix
  ];

  config = lib.mkIf cfg.enable {
    catppuccin.waybar.enable = true;

    programs = {
      waybar = {
        enable = true;
      };
    };
  };
}
