{ config, lib, pkgs, ...}:
with lib;

let
  cfg = config.home.gnome; in
{
  options = {
    home.gnome.enable = lib.mkEnableOption "Enable GNOME home-manager";
  };

  config = lib.mkIf cfg.enable {
    home.gnome.dconf.enable = true;
    home.gnome.extensions.enable = true;
    };
  };
}
