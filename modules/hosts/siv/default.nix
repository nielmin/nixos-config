{ config, ... }:
{
  nixosHosts.siv = {
    unstable = false;
  };

  flake.modules.nixos.host_siv.imports = with config.flake.modules.nixos; [
    services
    nuc
  ];
}
