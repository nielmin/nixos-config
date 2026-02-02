{ inputs, ... }:
{
  flake.modules.nixos.agenix =
    { config, ... }:
    {
      imports = [
        inputs.agenix.nixosModules.default
      ];

      age.secrets.secret1.file = ../../../secrets/userpass.age;
    };
}
