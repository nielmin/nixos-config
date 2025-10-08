{ inputs, ... }:
{
  flake.modules.nixos.niri = {
    nixpkgs.overlays = [
      inputs.niri-flake.overlays.niri
    ];
    programs.niri = {
      enable = true;
    };    
  };
}
