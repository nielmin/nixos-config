{ inputs, ... }:
{
  flake.modules.nixos.niri = {
    imports = [
      inputs.niri-flake.nixosModules.niri
    ];
    programs.niri = {
      enable = true;
    };    
  };
}
