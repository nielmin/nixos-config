{ config, ... }:
{
  flake.modules.homeManager.host_vm = {
    imports = with config.flake.modules.homeManager; [
      dev
      utils
    ];
  };
}
