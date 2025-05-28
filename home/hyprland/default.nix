{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.hyprland; in {

  imports = [
    ./fuzzel
    ./settings.nix
    ./services.nix
  ];

  options = {
    home.hyprland.enable = lib.mkEnableOption "Enable Hyprland home-manager";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
    };
  };
}
