{ inputs, ... }:
{
  flake.nixosModules.disko = {
    imports = [
      inputs.disko.nixosModules.disko
    ];
  };
}
