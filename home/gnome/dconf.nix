{ pkgs, ... }:

{
  programs.dconf.enable = true;

  dconf.settings = {
    "org/gnome/mutter" = {
      center-new-windows = true;
    };
  };
}
