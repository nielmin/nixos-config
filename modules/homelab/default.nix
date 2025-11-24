{ inputs, config, ... }:
{
  flake.modules = {
    nixos.homelab = {
      imports = with config.flake.modules.nixos; [
      ];
    };

    homeManager.homeleab = {
      imports = with config.flake.modules.homeManager; [
        jellyfin
      ];
    };
  };
}
