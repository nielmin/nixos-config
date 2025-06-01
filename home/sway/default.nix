{ config, lib, pkgs, ... }:
with lib;

let
  cfg = config.home.sway; in {

  imports = [
    ../programs/twm.nix
    ../services/twm.nix
  ];

  options = {
    home.sway.enable = lib.mkEnableOption "Enable sway home-manager";
  };

  config = lib.mkIf cfg.enable {
    home.twm.services.enable = true;
    home.twm.programs.enable = true;

    wayland.windowManager.sway = {
      enable = false;
      checkConfig = true;
    };
  };
}
