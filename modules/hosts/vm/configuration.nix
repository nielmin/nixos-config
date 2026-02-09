{
  inputs,
  self,
  ...
}:
{
  flake.nixosConfigurations = self.lib.mkNixos {
    hostName = "vm";
    system = "x86_64-linux";
  };

  flake.modules.nixos.vm = {
    imports = with self.modules.nixos; [
      inputs.agenix.nixosModules.default

      inputs.nixos-facter-modules.nixosModules.facter

      inputs.lanzaboote.nixosModules.lanzaboote

      # disko
      inputs.disko.nixosModules.disko
      self.diskoConfigurations.vm

      system

      fonts
      packages
      pipewire
      printing
      plasma
      ssh
      security
      virtualisation
    ];
  };
}
