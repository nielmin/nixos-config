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
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    environment.systemPackages = with pkgs; [
      gnome-tweaks
      morewaita-icon-theme
    ];

    fonts.packages = with pkgs; [
      adwaita-fonts
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
