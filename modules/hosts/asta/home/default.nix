{ config, ... }:
{
  flake.modules.homeManager.host_asta = {
    imports = with config.flake.modules.homeManager; [
      catppuccin
      desktop
      dev
      niri
      utils
      services
      waybar
    ];
  };
}
