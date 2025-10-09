{ config, ... }:
{
  flake.modules = {
    nixos.utils.imports = with config.flake.modules.nixos; [
      undervolt
    ];

    homeManager.utils.imports = with config.flake.modules.homeManager; [
      undervolt
      gallery-dl
      monitoring
      multimedia
    ];
  };
}
