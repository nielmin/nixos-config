{ config, ... }:
{
  nixosHosts.nuc = {
    unstable = true;
  };

  flake.modules.nixos.host_nuc.imports = with config.flake.modules.nixos; [
    desktop
    plasma
    services
    tv
  ];
}
