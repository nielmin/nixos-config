{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.hyprland; in {

  imports = [
    ./settings.nix
    ./services.nix
    ../programs/twm.nix
    ../services/twm.nix
    ../waybar
  ];

  options = {
    home.hyprland.enable = lib.mkEnableOption "Enable Hyprland home-manager";
  };

  config = lib.mkIf cfg.enable {
    home.twm.services.enable = true;
    home.hyprland.services.enable = true;
    home.twm.programs.enable = true;
    home.waybar.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
    };
  };
}
