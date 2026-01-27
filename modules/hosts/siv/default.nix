{ config, ... }:
{
  nixosHosts.siv = {
    unstable = false;
    hostName = "siv";
  };

  flake.modules.nixos.host_siv.imports = with config.flake.modules.nixos; [
    services
    daniel
  ];
}
