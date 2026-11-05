{
  self,
  inputs,
  lib,
  ...
}:
{
  flake.modules.nixos.vm = {
    imports = [
      (self.factory.vm-user {
        isAdmin = true;
      })
    ];
  };

  flake.nixosConfigurations.ines = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos.settings
      inputs.self.modules.nixos.vm
      inputs.self.modules.nixos.core
      inputs.self.modules.nixos.desktop
    ];
  };
}
