{ config, ... }:
{
  flake.modules = {
    imports = [
      quadlet-nix.nixosModules.quadlet
    ];

    nixos.homelab.imports = with config.flake.modules.nixos; [
      jellyfin
    ];

    homeManager.homelab.imports = with config.flake.modules.homeManager; [
    ];
  };
}
