{ inputs, ... }:
{
  flake.nixosModules.facter = {
    imports = [
      inputs.nixos-facter-modules.nixosModules.facter
    ];
  };
}
