{
  inputs,
  self,
  ...
}: {
  flake.nixosConfigurations.vm = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.vm
    ];
  };

  flake.nixosModules.vm = {pkgs, ...}: {
    imports = with self.nixosModules; [
      inputs.agenix.nixosModules.default

      inputs.nixos-facter-modules.nixosModules.facter

      inputs.lanzaboote.nixosModules.lanzaboote

      # disko
      inputs.disko.nixosModules.disko
      self.diskoConfigurations.vm

      bootloader
      fonts
      misc
      nix
      packages
      pipewire
      pipewire
      printing
      plasma
      ssh
      security
      daniel
    ];

    networking = {
      hostName = "vm";
      networkmanager.enable = true;
    };

    system.stateVersion = "24.11";
  };
}
