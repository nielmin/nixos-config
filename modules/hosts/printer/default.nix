{ config, ... }:
{
  nixosHosts.printer = {
    unstable = false;
  };

  flake.modules.nixos.host_printer.imports = with config.flake.modules.nixos; [
    services
  ];
}
