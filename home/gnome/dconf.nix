{ pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
    "org/gnome/nautilus/preferences" = {
      default-sort-order = "type";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
