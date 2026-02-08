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
    imports = [
      inputs.agenix.nixosModules.default

      inputs.nixos-facter-modules.nixosModules.facter

      inputs.lanzaboote.nixosModules.lanzaboote

      # disko
      inputs.disko.nixosModules.disko
      self.diskoConfigurations.vm

      self.nixosModules.bootloader
      self.nixosModules.fonts
      self.nixosModules.misc
      self.nixosModules.nix
      self.nixosModules.packages
      self.nixosModules.pipewire
      self.nixosModules.pipewire
      self.nixosModules.printing
      self.nixosModules.plasma
      self.nixosModules.ssh
      self.nixosModules.daniel
    ];

    networking = {
      hostName = "vm";
      networkmanager.enable = true;
    };

    system.stateVersion = "24.11";
  };
}
