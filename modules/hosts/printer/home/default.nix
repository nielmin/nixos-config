{ config, ... }:
{
  flake.modules.homeManager.host_printer = {
    imports = with config.flake.modules.homeManager; [
    ];
  };
}
