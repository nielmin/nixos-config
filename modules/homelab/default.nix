{ inputs, config, ... }:
{
  flake.modules = {
    nixos.homelab = {
      imports = with config.flake.modules.nixos; [
        jellyfin
      ];
    };

    homeManager.homeleab = {
      imports = with config.flake.modules.homeManager; [
      ];
    };
  };
}
