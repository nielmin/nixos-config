{ pkgs, ... }:

{
  imports = [
    ./settings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
  };
}
