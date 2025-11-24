{ inputs, config, ... }:
{
  flake.modules = {
    nixos.homelab = {
      imports = with config.flake.modules.nixos; [
        quadlet
      ];
    };

    homeManager.homelab = {
      imports = with config.flake.modules.homeManager; [
        quadlet
        jellyfin
      ];
    };
  };
}
