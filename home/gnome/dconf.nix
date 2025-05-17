{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "trayIconsReloaded@selfmade.pl"
      ];
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
}
