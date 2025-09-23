{ config, ... }:
{
  flake.modules.homeManager.host_asta = {
    imports = with config.flake.modules.homeManager; [
      dev
      desktop
      catppuccin
    ];
  };
}
