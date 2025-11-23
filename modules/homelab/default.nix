{ config, ... }:
{
  flake.modules = {
    nixos.homelab.imports = with config.flake.modules.nixos; [
      jellyfin
    ];

    homeManager.homelab.imports = with config.flake.modules.homeManager; [
    ];
  };
}
