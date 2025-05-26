{ config, lib, pkgs, ...}:
with lib;

let
  cfg = config.home.gnome.extensions; in
{
  options = {
    home.gnome.extensions.enable = lib.mkEnableOption "Enable user GNOME extensions";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      gnomeExtensions.battery-health-charging
    ];
}
