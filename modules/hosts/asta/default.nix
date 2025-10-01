{ config, ... }:
{
  nixosHosts.asta = {
    unstable = true;
  };

  flake.modules.nixos.host_asta.imports = with config.flake.modules.nixos;
  [
    desktop
    dev
    users
    undervolt
  ];
}
