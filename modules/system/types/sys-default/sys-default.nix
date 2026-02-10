{ self, ... }:
{
  flake.modules.nixos.sys-default = {
    imports = with self.modules.nixos; [
      sys-min

      home-manager

      bootloader
      local
    ];
  };

  flake.modules.homeManager.sys-default = {
    imports = with self.modules.homeManager; [
      sys-min

      git
      treefmt
      nix
      nh
    ];
  };
}
