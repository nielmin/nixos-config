{ config, lib, pkgs, ...}:
with lib;

let
  cfg =  config.home.gnome.dconf; in {

  options = {
    home.gnome.dconf.enable = lib.mkEnableOption "Enable GNOME dconf settings";
  };

  config = lib.mkIf cfg.enable {
    dconf.settings = {
      "org/gnome/mutter" = {
        center-new-windows = true;
      };
      "org/gnome/shell" = {
        favorite-apps = [
          "firefox.desktop"
          "org.gnome.Console.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file:///home/daniel/nixos-config/wallpapers/sea_02.jpg";
      };
      "org/gnome/desktop/background" = {
        picture-uri-dark = "file:///home/daniel/nixos-config/wallpapers/sea_02.jpg";
      };
      "org/gnome/nautilus/preferences" = {
        default-sort-order = "type";
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/interface" = {
        font-name = "Adwaita Sans 12";
      };
      "org/gnome/desktop/interface" = {
        document-font-name = "Adwaita Sans 11";
      };
      "org/gnome/desktop/interface" = {
        monospace-font-name = "FiraCode Nerd Font Mono 10";
      };
    };
  };
}
