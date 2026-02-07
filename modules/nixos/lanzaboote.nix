{ inputs, ... }:
{
  flake.nixosModules.lanzaboote = {
    imports = [
      inputs.lanzaboote.nixosModules.lanzaboote
    ];
  };
}
