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
      environment.systemPackages = with pkgs;
      [
        playerctl
        wayland-utils # Wayland utilities
        wl-clipboard # Command-line copy/paste utilities for Wayland
      ];
    };
}
