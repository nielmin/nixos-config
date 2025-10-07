{ config, ... }:
{
  flake.modules = {
    nixos.services.imports = with config.flake.modules.nixos; [
      printing
    ];

    homeManager.services.imports = with config.flake.modules.homeManager; [
      syncthing
    ];
  };
}
