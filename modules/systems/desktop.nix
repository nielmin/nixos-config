{
  self,
  inputs,
  lib,
  ...
}:
{
  flake.modules.nixos.ines-desktop = {
    imports = [
      (self.factory.daniel {
        username = "daniel";
        isAdmin = true;
      })
    ];
  };

  flake.nixosConfigurations.ines = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos.settings
      inputs.self.modules.nixos.ines
      inputs.self.modules.nixos.core
      inputs.self.modules.nixos.desktop
      inputs.self.modules.nixos.ines-desktop
    ];
  };
}
