{ inputs, ... }:
{
  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [
        inputs.niri.overlays.niri
      ];
      programs.niri = {
        enable = true;
      };

      security.polkit.enable = true; # polkit

      services.gnome.gnome-keyring.enable = true; # secret service

      fonts.packages = with pkgs; [
        nerd-fonts.fantasque-sans-mono
      ];

      environment.systemPackages = with pkgs; [
        bibata-cursors
        brightnessctl
        geoclue2
        playerctl
        wayland-utils # Wayland utilities
        wl-clipboard # Command-line copy/paste utilities for Wayland
        xwayland-satellite
      ];
    };
}
