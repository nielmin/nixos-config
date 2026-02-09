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

      inputs.disko.nixosModules.disko

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
