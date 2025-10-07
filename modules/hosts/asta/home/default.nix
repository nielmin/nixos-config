{ config, ... }:
{
  flake.modules.homeManager.host_asta = {
    imports = with config.flake.modules.homeManager; [
      catppuccin
      dev
      desktop
      utils
      services
    ];
  };
}
