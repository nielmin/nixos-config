{ config, ... }:
{
  flake.modules.homeManager.host_nuc = {
    imports = with config.flake.modules.homeManager; [
    ];
  };
}
