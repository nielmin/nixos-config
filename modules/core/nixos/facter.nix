{ inputs, ... }:
{
  flake.modules.nixos.core = {
    imports = [
      inputs.nixos-facter-modules.nixosModules.facter
    ];
  };
}
