{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.hyprland; in {

  imports = [
    ./settings.nix
    ./services.nix
    ./programs.nix
  ];

  options = {
    home.hyprland.enable = lib.mkEnableOption "Enable Hyprland home-manager";
  };

  config = lib.mkIf cfg.enable {
    home.hyprland.services.enable = true;
    home.hyprland.programs.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
    };
  };
}
