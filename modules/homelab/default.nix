{ inputs, config, ... }:
{
  flake.modules = {
    nixos.homelab = {
      imports = with config.flake.modules.nixos; [
        quadlet
        jellyfin
        miniflux
        radicale
      ];
    };

    homeManager.homelab = {
      imports = with config.flake.modules.homeManager; [
        quadlet
        gonic
        kavita
        jellyfin
        miniflux
        radicale
      ];
    };
  };
}
