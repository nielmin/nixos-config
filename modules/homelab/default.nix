{ inputs, config, ... }:
{
  flake.modules = {
    nixos.homelab = {
      imports = with config.flake.modules.nixos; [
        jellyfin
        radicale
      ];
    };

    homeManager.homeleab = {
      imports = with config.flake.modules.homeManager; [
      ];
    };
  };
}
