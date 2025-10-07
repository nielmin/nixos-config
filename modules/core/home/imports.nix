{ config, ... }:
{
  flake.modules.homeManager.core.imports = with config.flake.modules.homeManager; [
    git
    helix
    shell
    home-manager
    nix
    misc
  ];
}
