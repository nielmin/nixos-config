{ inputs, ... }:
{
  flake.modules.nixos.agenix = {
      imports = [
        inputs.agenix.nixosModules.default
      ];
      age.secrets.userpass.file = ../../../secrets/userpass.age;
    };
}
