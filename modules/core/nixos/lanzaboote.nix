{ inputs, ... }:
{
  flake.modules.nixos.core = {
    imports = [
      inputs.lanzaboote.nixosModules.lanzaboote
    ];
  };
}
