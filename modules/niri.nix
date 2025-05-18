{ config, lib, pkgs, ...}:
with lib;

let
  cfg = config.desktop.niri ; in {
  
  options = {
    desktop.niri.enable = lib.mkEnableOption "Enable Niri";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      niri
    ];
  };
}
