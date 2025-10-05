{ config, ... }:
{
  flake.modules.homeManager.host_asta = {
    imports = with config.flake.modules.homeManager; [
      shell
      desktop
      catppuccin
      undervolt
      direnv
      tmux
      gallery-dl
    ];
  };
}
