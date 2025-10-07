{ config, ... }:
{
  flake.modules = {
    nixos.dev.imports = with config.flake.modules.nixos; [
        home-manager
    ];

    homeManager.dev.imports = with config.flake.modules.homeManager; [
        alacritty
        direnv
        tmux
        utils
    ];
  };
}
