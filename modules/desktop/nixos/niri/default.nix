{ inputs, ... }:
{
  flake.modules.nixos.niri =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [
        inputs.niri-flake.overlays.niri
      ];
      programs.niri = {
        enable = true;
      };    

      fonts.packages = with pkgs; [
        nerd-fonts.fantasque-sans-mono
      ];

      environment.systemPackages = with pkgs;
      [
        bibata-cursors
        playerctl
        wayland-utils # Wayland utilities
        wl-clipboard # Command-line copy/paste utilities for Wayland
      ];
    };
}
