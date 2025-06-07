{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.sway; in {

  imports = [
    ../programs/twm.nix
    ../services/twm.nix
    ../waybar
  ];

  options = {
    home.sway.enable = lib.mkEnableOption "Enable sway home-manager";
  };

  config = lib.mkIf cfg.enable {
    catppuccin.sway.enable = true;
    catppuccin.swaylock.enable = true;

    home.twm.services.enable = true;
    home.twm.programs.enable = true;
    home.waybar.enable = true;

    wayland.windowManager.sway = {
      enable = false;
      checkConfig = true;
    };
  };
}
