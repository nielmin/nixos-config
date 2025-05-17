{ config, lib, pkgs, ...}:
with lib;

let
  cfg = config.desktop.gnome; in {
  
  options = {
    desktop.gnome.enable = lib.mkEnableOption "Enable GNOME";
  };

  config = lib.mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = false;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    environment.systemPackages = with pkgs; [
      gnome-tweaks
    ];

    environment.gnome.excludePackages = with pkgs; [
      cheese
      epiphany
      geary
      gnome-tour
      gnome-music
      totem
      seahorse
      simple-scan
      gnome-connections
      gnome-system-monitor
      gnome-maps
      gnome-contacts
      yelp
      snapshot
    ];
  };
}
