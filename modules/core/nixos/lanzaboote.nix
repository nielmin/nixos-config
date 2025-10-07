  {
    inputs,
    ...
  }:
{
  flake.modules.nixos.lanzaboote =
  {    
    imports = [
      inputs.lanzaboote.nixosModules.lanzaboote
    ];
  };
}
