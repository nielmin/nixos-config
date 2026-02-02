{ inputs, ... }:
{
  flake.modules.nixos.core = {
    imports = [
      inputs.agenix.nixosModules.default
    ];
  };
}
