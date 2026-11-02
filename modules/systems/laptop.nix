{
  self,
  inputs,
  lib,
  ...
}:
{
  flake.modules.nixos.laptop = {
    imports = [
      (self.factory.daniel {
        user-name = "daniel";
        isAdmin = true;
      })
    ];

    flake.nixosConfigurations.liv = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.modules.nixos.settings
        inputs.self.modules.nixos.liv
        inputs.self.modules.core
        inputs.self.modules.liv-laptop
      ];
    };
  };
}
