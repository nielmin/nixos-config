{
  self,
  inputs,
  lib,
  ...
}:
{
  flake.modules.nixos.liv-laptop = {
  };

    flake.nixosConfigurations.liv = inputs.nixpkgs.lib.nixosSystem {
      modules = [
        inputs.self.modules.nixos.settings
        inputs.self.modules.nixos.liv
        inputs.self.modules.nixos.core
        inputs.self.modules.nixos.daniel
        inputs.self.modules.nixos.liv-laptop
        inputs.self.modules.nixos.desktop
      ];
    };
}
