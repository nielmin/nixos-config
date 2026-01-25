{ config, ... }:
{
  nixosHosts.asta = {
    unstable = true;
    hostName = "asta";
  };

  flake.modules.nixos.host_asta.imports = with config.flake.modules.nixos; [
    desktop
    dev
    plasma
    services
    daniel
    utils
  ];
}
