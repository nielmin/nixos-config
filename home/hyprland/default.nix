{ pkgs, ... }:

{
  imports = [
    ./fuzzel
    ./settings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
