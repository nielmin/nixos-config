{ self, ... }: {
  flake.modules.nixos.base = {
    imports = [
      self.modules.nixos.bootable
      self.modules.nixos.cli
      self.modules.nixos.hm
      self.modules.nixos.networking
      self.modules.nixos.nix
      self.modules.nixos.preferences
      self.modules.nixos.security
    ];
  };
}
