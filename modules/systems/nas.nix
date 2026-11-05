{
  self,
  inputs,
  lib,
  ...
}:
{
  flake.modules.nixos.siv-nas = {
    imports = [
      (self.factory.daniel {
        username = "daniel";
        isAdmin = true;
      })
    ];

    flake.nixosConfigurations.siv = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.modules.nixos.settings
        inputs.self.modules.nixos.siv
        inputs.self.modules.core
        inputs.self.modules.siv-nas
      ];
    };
  };
}
