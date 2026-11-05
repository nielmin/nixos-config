{
  self,
  inputs,
  lib,
  ...
}:
{
  flake.modules.nixos.vm-desktop = {
    imports = [
      (self.factory.vm-user {
        username = "vm-user";
        isAdmin = true;
      })
    ];
  };

  flake.nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.self.modules.nixos.settings
      inputs.self.modules.nixos.vm
      inputs.self.modules.nixos.core
      inputs.self.modules.nixos.desktop
      inputs.self.modules.nixos.vm-desktop
    ];
  };
}
