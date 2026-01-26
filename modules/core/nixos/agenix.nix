{ inputs, ... }:
{
  flake.modules.nixos.agenix = {
    imports = [
      inputs.agenix.nixosModules.default
    ];
    age.secrets.vm_pass.file = ../../../secrets/vm_pass.age;
  };
}
